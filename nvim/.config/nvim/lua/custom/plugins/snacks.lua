return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      ui_select = true, -- Use snacks picker for vim.ui.select (replaces telescope-ui-select)
      -- Custom configurations
      win = {
        input = {
          keys = {
            -- History navigation (mimicking Telescope's <C-j>/<C-k> for history)
            ['<C-j>'] = { 'history_forward', mode = { 'i', 'n' } },
            ['<C-k>'] = { 'history_back', mode = { 'i', 'n' } },
          },
        },
      },
    },
  },
  keys = {
    -- Search keybindings
    { '<leader>sh', function() require('snacks').picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() require('snacks').picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sf', function() require('snacks').picker.files() end, desc = '[S]earch [F]iles' },
    { '<leader>sw', function() require('snacks').picker.grep_word() end, desc = '[S]earch current [W]ord' },
    { '<leader>sg', function() require('snacks').picker.grep() end, desc = '[S]earch by [G]rep' },
    { '<leader>sd', function() require('snacks').picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', function() require('snacks').picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>s.', function() require('snacks').picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', function() require('snacks').picker.buffers() end, desc = '[ ] Find existing buffers' },
    { '<leader>st', function() require('snacks').picker.git_stash() end, desc = '[S]earch Git S[t]ash' },

    -- Current buffer fuzzy find
    {
      '<leader>/',
      function()
        require('snacks').picker.lines()
      end,
      desc = '[/] Fuzzily search in current buffer',
    },

    -- Search in open files
    {
      '<leader>s/',
      function()
        require('snacks').picker.grep_buffers()
      end,
      desc = '[S]earch [/] in Open Files',
    },

    -- Search Neovim config files
    {
      '<leader>sn',
      function()
        require('snacks').picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = '[S]earch [N]eovim files',
    },
  },
}
