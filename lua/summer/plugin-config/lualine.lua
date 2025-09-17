-- ~/.config/nvim/lua/summer/plugin-config/lualine.lua

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine not found!")
  return
end

-- 使用与 galaxyline 相同的颜色配置
local colors = {
  yellow = "#EBCB8B",
  cyan = "#88C0D0",
  green = "#A3BE8C",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#E5D1FA",
  grey = "#D8DEE9",
  blue = "#81A1C1",
  red = "#BF616A",
  pink = "#FFACAC",
  bg = "NONE",
  fg = "#D8DEE9"
}

-- 自定义主题，匹配 galaxyline 的视觉效果
local custom_theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg, bg = colors.bg },
    y = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
  },
  command = {
    a = { fg = colors.bg, bg = colors.pink, gui = 'bold' },
  },
  inactive = {
    a = { fg = colors.grey, bg = colors.bg },
    b = { fg = colors.grey, bg = colors.bg },
    c = { fg = colors.grey, bg = colors.bg },
  },
}

-- 检查缓冲区是否为空
local function buffer_not_empty()
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

-- 检查窗口宽度
local function hide_in_width()
  return vim.fn.winwidth(0) > 80
end

-- 检查 git 工作区
local function check_git_workspace()
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

-- 获取当前文件路径的父目录名
local function get_file_path()
  local file_path = vim.fn.expand('%:p')
  if file_path == '' then
    return ''
  end
  local cwd = vim.fn.fnamemodify(file_path, ":p:h:t")
  return cwd
end

-- 自定义组件定义
local components = {
  -- 左侧蓝色竖线指示器（对应 RainbowRed）
  left_indicator = {
    function()
      return "▊ "
    end,
    color = { fg = colors.blue, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- 模式指示器（对应 ViMode）
  mode = {
    function()
      return "  "
    end,
    color = function()
      local mode_color = {
        n = colors.green,
        i = colors.blue,
        v = colors.red,
        [''] = colors.red,
        V = colors.red,
        c = colors.pink,
        no = colors.green,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.green,
        ce = colors.green,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.green,
        t = colors.green,
      }
      return { fg = mode_color[vim.fn.mode()] or colors.green, bg = colors.bg, gui = 'bold' }
    end,
    padding = { left = 0, right = 1 },
  },

  -- 文件大小（对应 FileSize）
  filesize = {
    'filesize',
    cond = buffer_not_empty,
    color = { fg = colors.fg, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- 文件图标（对应 FileIcon）
  file_icon = {
    'filetype',
    icon_only = true,
    colored = true,
    cond = buffer_not_empty,
    padding = { left = 0, right = 1 },
  },

  -- 文件名（对应 FileName）
  filename = {
    'filename',
    cond = buffer_not_empty,
    color = { fg = colors.cyan, bg = colors.bg },
    path = 0, -- 只显示文件名
    padding = { left = 0, right = 1 },
  },

  -- 行列信息（对应 LineInfo）
  line_info = {
    'location',
    color = { fg = colors.fg, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- 进度百分比（对应 PerCent）
  progress = {
    'progress',
    color = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
    padding = { left = 0, right = 1 },
  },

  -- 诊断错误（对应 DiagnosticError）
  diagnostic_error = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error' },
    symbols = { error = '  ' },
    diagnostics_color = { error = { fg = colors.red, bg = colors.bg } },
    padding = { left = 0, right = 1 },
  },

  -- 诊断警告（对应 DiagnosticWarn）
  diagnostic_warn = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'warn' },
    symbols = { warn = '  ' },
    diagnostics_color = { warn = { fg = colors.yellow, bg = colors.bg } },
    padding = { left = 0, right = 1 },
  },

  -- 诊断提示（对应 DiagnosticHint）
  diagnostic_hint = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'hint' },
    symbols = { hint = '  ' },
    diagnostics_color = { hint = { fg = colors.cyan, bg = colors.bg } },
    padding = { left = 0, right = 1 },
  },

  -- 诊断信息（对应 DiagnosticInfo）
  diagnostic_info = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'info' },
    symbols = { info = '  ' },
    diagnostics_color = { info = { fg = colors.blue, bg = colors.bg } },
    padding = { left = 0, right = 1 },
  },

  -- 中间文件路径（对应 FilePath）
  file_path = {
    function()
      local file_path = get_file_path()
      if file_path == '' then
        return ''
      end
      return file_path
    end,
    icon = ' ',
    color = { fg = colors.cyan, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- 文件编码（对应 FileEncode）
  encoding = {
    'encoding',
    cond = hide_in_width,
    color = { fg = colors.green, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- 文件格式（对应 FileFormat）
  fileformat = {
    'fileformat',
    cond = hide_in_width,
    color = { fg = colors.green, bg = colors.bg },
    padding = { left = 0, right = 1 },
  },

  -- Git 图标（对应 GitIcon）
  git_icon = {
    function()
      return "   "
    end,
    cond = check_git_workspace,
    color = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
    padding = { left = 0, right = 1 },
  },

  -- Git 分支（对应 GitBranch）
  git_branch = {
    function()
      local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
      if branch == '' then
        return ''
      end
      return branch .. ' '
    end,
    cond = check_git_workspace,
    color = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
    padding = { left = 0, right = 1 },
  },

  -- Git 差异添加（对应 DiffAdd）
  diff_add = {
    'diff',
    symbols = { added = '  ' },
    diff_color = { added = { fg = colors.green, bg = colors.bg } },
    cond = hide_in_width,
    padding = { left = 0, right = 1 },
  },

  -- Git 差异修改（对应 DiffModified）
  diff_modified = {
    'diff',
    symbols = { modified = ' 柳' },
    diff_color = { modified = { fg = colors.yellow, bg = colors.bg } },
    cond = hide_in_width,
    padding = { left = 0, right = 1 },
  },

  -- Git 差异删除（对应 DiffRemove）
  diff_remove = {
    'diff',
    symbols = { removed = '  ' },
    diff_color = { removed = { fg = colors.red, bg = colors.bg } },
    cond = hide_in_width,
    padding = { left = 0, right = 1 },
  },

  -- 右侧蓝色竖线指示器（对应 RainbowBlue）
  right_indicator = {
    function()
      return " ▊"
    end,
    color = { fg = colors.blue, bg = colors.bg },
    padding = { left = 1, right = 0 },
  },
}

-- Lualine 配置
lualine.setup({
  options = {
    icons_enabled = true,
    theme = custom_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { "NvimTree", "vista", "dbui", "packer", "help", "toggleterm", "dashboard" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,

  },
  sections = {
    -- 左侧部分 - 按照 galaxyline 的顺序
    lualine_a = {
      components.left_indicator,
    },
    lualine_b = {
      components.mode,
      components.filesize,
      components.file_icon,
      components.filename,
      components.line_info,
      components.progress,
      components.diagnostic_error,
      components.diagnostic_warn,
      components.diagnostic_hint,
      components.diagnostic_info,
    },
    lualine_c = {
      components.file_path,
    },
    -- 右侧部分 - 按照 galaxyline 的顺序
    lualine_x = {
      components.encoding,
      components.fileformat,
      components.git_icon,
      components.git_branch,
    },
    lualine_y = {
      components.diff_add,
      components.diff_modified,
      components.diff_remove,
    },
    lualine_z = {
      components.right_indicator,
    }
  },
  -- 非活动窗口的状态栏（对应 short_line）
  inactive_sections = {
    lualine_a = {},
    lualine_b = {
      {
        'filetype',
        colored = false,
        icon_only = false,
        color = { fg = colors.blue, bg = colors.bg, gui = 'bold' },
      }
    },
    lualine_c = {
      {
        'filename',
        cond = buffer_not_empty,
        color = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
        path = 0,
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'filetype',
        icon_only = true,
        colored = false,
        color = { fg = colors.fg, bg = colors.bg },
      }
    }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- 设置短文件列表，对应 galaxyline 的 short_line_list
local short_line_list = { "NvimTree", "vista", "dbui", "packer", "help", "toggleterm", "dashboard" }

-- 自动命令来处理特殊文件类型
vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter', 'WinEnter' }, {
  callback = function()
    local filetype = vim.bo.filetype
    if vim.tbl_contains(short_line_list, filetype) then
      -- 对特殊文件类型使用简化的状态栏
      vim.opt_local.laststatus = 0
    else
      vim.opt_local.laststatus = 2
    end
  end,
})
