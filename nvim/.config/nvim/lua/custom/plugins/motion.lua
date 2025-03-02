return {
  -- { 'easymotion/vim-easymotion' },
  -- { 'justinmk/vim-sneak' },
  -- {
  --   'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').create_default_mappings()
  --   end,
  -- },
  -- { 'hadronized/hop.nvim' },
  -- {
  --   'smoka7/hop.nvim',
  --   version = '*',
  --   opts = {
  --     keys = 'etovxqpdygfblzhckisuran',
  --   },
  -- },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
     -- stylua: ignore
     keys = {
       { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
       { "<S-CR>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
       -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
       -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
       -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- {"echasnovski/mini-jump"},
  -- { 'rlane/pounce.nvim' },
  -- {"echasnovski/mini-jump2d"},
}
