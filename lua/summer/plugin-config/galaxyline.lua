local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
	vim.notify("galaxyline not found!")
	return
end

--[[ local colors = {
	yellow = "#fabd2f",
	cyan = "#008080",
	green = "#afd700",
	orange = "#FF8800",
	purple = "#5d4d7a",
	pink = "#d16d9e",
	grey = "#c0c0c0",
	blue = "#0087d7",
	red = "#ec5f67",
} ]]
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
	bg = "NONE"
}

local fileinfo = require("galaxyline.provider_fileinfo")
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer", "help", "toggleterm", "dashboard" }

gls.left[1] = {
	RainbowRed = {
		provider = function()
			return "▊ "
		end,
		highlight = { colors.blue, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
gls.left[2] = {
	ViMode = {
		provider = function()
			-- auto change color according the vim mode
			local mode_color = {
				n = colors.green,
				i = colors.blue,
				v = colors.red,
				[""] = colors.red,
				V = colors.red,
				c = colors.pink,
				no = colors.green,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.purple,
				Rv = colors.purple,
				cv = colors.green,
				ce = colors.green,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.green,
				t = colors.green,
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
			return "  "
		end,
		highlight = { colors.red, colors.bg, "bold" },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
gls.left[3] = {
	FileSize = {
		provider = "FileSize",
		condition = condition.buffer_not_empty,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.fg, colors.bg },
	},
}
gls.left[4] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = { fileinfo.get_file_icon_color, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[5] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.cyan, colors.bg },
	},
}

gls.left[6] = {
	LineInfo = {
		provider = "LineColumn",
		highlight = { colors.fg, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[7] = {
	PerCent = {
		provider = "LinePercent",
		highlight = { colors.fg, colors.bg, "bold" },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[8] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = { colors.red, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
gls.left[9] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.yellow, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[10] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "  ",
		highlight = { colors.cyan, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[11] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "  ",
		highlight = { colors.blue, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.mid[1] = {
	FilePath = {
		provider = function()
			local file_path = fileinfo.get_current_file_path()
			local cwd = vim.fn.fnamemodify(file_path, ":p:h:t")
			return cwd
		end,
		icon = " ",
		highlight = { fileinfo.get_file_icon_color, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

--[[ gls.mid[1] = {
	ShowLspClient = {
		provider = "GetLspClient",
		condition = function()
			local tbl = { ["dashboard"] = true, [""] = true }
			if tbl[vim.bo.filetype] then
				return false
			end
			return true
		end,
		icon = " LSP:",
		highlight = { colors.cyan, colors.bg, "bold" },
	},
} ]]

gls.right[1] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.green, colors.bg },
	},
}

gls.right[2] = {
	FileFormat = {
		provider = "FileFormat",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.green, colors.bg },
	},
}

gls.right[3] = {
	GitIcon = {
		provider = function()
			return "   "
		end,
		condition = condition.check_git_workspace,
		highlight = { colors.fg, colors.bg, "bold" },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[4] = {
	GitBranch = {
		provider = function()
			local branch = require("galaxyline.provider_vcs").get_git_branch()
			if not branch or branch == "" then
				return ""
			end
			return branch .. " "
		end,
		condition = condition.check_git_workspace,
		highlight = { colors.fg, colors.bg, "bold" },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[5] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = condition.hide_in_width,
		icon = "  ",
		highlight = { colors.green, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
gls.right[6] = {
	DiffModified = {
		provider = "DiffModified",
		condition = condition.hide_in_width,
		icon = " 柳",
		highlight = { colors.yellow, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
gls.right[7] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = condition.hide_in_width,
		icon = "  ",
		highlight = { colors.red, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[8] = {
	RainbowBlue = {
		provider = function()
			return " ▊"
		end,
		highlight = { colors.blue, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.blue, colors.bg, "bold" },
	},
}

gls.short_line_left[2] = {
	SFileName = {
		provider = "SFileName",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg, "bold" },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		highlight = { colors.fg, colors.bg },
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
	},
}
