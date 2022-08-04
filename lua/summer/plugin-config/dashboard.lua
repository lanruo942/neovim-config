local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("dashboard not found!")
  return
end

db.hide_statusline = false

db.custom_footer = {
  "",
  "",
  "🍂 https://summer.today",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Recent Projects                     ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently Used files                 ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find file                           ",
    action = "Telescope find_files",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit keybindings                    ",
  --   action = "edit ~/.config/nvim/lua/keybindings.lua",
  -- },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  {
    icon = "  ",
    desc = "Change colorscheme                  ",
    action = "Telescope colorscheme",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}

db.custom_header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[███████╗   ██╗  ██╗   ██╗   ███████╗   ██╗        ██████╗    ]],
  [[██╔════╝   ██║  ██║   ██║   ██╔════╝   ██║        ██╔══██╗   ]],
  [[███████╗   ███████║   ██║   █████╗     ██║        ██║  ██║   ]],
  [[╚════██║   ██╔══██║   ██║   ██╔══╝     ██║        ██║  ██║   ]],
  [[███████║██╗██║  ██║██╗██║██╗███████╗██╗███████╗██╗██████╔╝██╗]],
  [[╚══════╝╚═╝╚═╝  ╚═╝╚═╝╚═╝╚═╝╚══════╝╚═╝╚══════╝╚═╝╚═════╝ ╚═╝]],
  [[                                                             ]],
  [[                    [ version : 1.0.0 ]                      ]],
  [[]],
  [[]],
}

-- db.custom_header = {
--    [[        ▄▄▄▄▄███████████████████▄▄▄▄▄     ]],
--    [[      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ]],
--    [[     █▀████████▄             ▀▀████ ▀██▄  ]],
--    [[    █▄▄██████████████████▄▄▄         ▄██▀ ]],
--    [[     ▀█████████████████████████▄    ▄██▀  ]],
--    [[       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ]],
--    [[         ▀███▄              ▀██████▀      ]],
--    [[           ▀██████▄        ▄████▀         ]],
--    [[              ▀█████▄▄▄▄▄▄▄███▀           ]],
--    [[                ▀████▀▀▀████▀             ]],
--    [[                  ▀███▄███▀                ]],
-- 	 [[                     ▀█▀                   ]],
-- 	 [[                                           ]],
-- 	 [[                                           ]],
-- 	 [[                                           ]],
-- }
