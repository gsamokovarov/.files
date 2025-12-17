return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        header = [[

                                                             ▄▄                 
                                                             ██                 
  ▄███▄██   ▄█████▄  ████████   ▄█████▄   ██▄████   ▄█████▄  ██▄████▄  ▀██  ███ 
 ██▀  ▀██   ▀ ▄▄▄██      ▄█▀    ▀ ▄▄▄██   ██▀      ██▀    ▀  ██▀   ██   ██▄ ██  
 ██    ██  ▄██▀▀▀██    ▄█▀     ▄██▀▀▀██   ██       ██        ██    ██    ████▀  
 ▀██▄▄███  ██▄▄▄███  ▄██▄▄▄▄▄  ██▄▄▄███   ██       ▀██▄▄▄▄█  ██    ██     ███   
  ▄▀▀▀ ██   ▀▀▀▀ ▀▀  ▀▀▀▀▀▀▀▀   ▀▀▀▀ ▀▀   ▀▀         ▀▀▀▀▀   ▀▀    ▀▀     ██    
  ▀████▀▀                                                               ███     
                                                                                
]]
,
      },
    },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<Tab>"] = false,
            ["<S-Tab>"] = false,
          },
        },
        list = {
          keys = {
            ["<Tab>"] = false,
            ["<S-Tab>"] = false,
          },
        },
      },
    },
    explorer = { enabled = false, },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = false },
  },
  keys = {
    -- Top Pickers
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sf", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
  },
}
