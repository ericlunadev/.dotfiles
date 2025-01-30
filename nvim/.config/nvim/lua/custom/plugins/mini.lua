return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    require('mini.bracketed').setup {}
    require('mini.move').setup {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',

        -- Move current line in Normal mode (clashes with window navigation with C and with M clashes with Zellij)
        -- line_left = '<C-h>',
        -- line_right = '<C-l>',
        -- line_down = '<C-j>',
        -- line_up = '<C-k>',
      },

      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
    require('mini.starter').setup {
      header = table.concat {
        '____ ____ _ ____ _    _  _ _  _ ____  ___ ____ _  _\n',
        '|___ |__/ | |    |    |  | |\\ | |__|  |   |___ |  |\n',
        '|___ |  \\ | |___ |___ |__| | \\| |  | .|__/|___  \\/ \n',
      },
    }
    -- Visualize and work with indentation
    require('mini.indentscope').setup { draw = {
      animation = function()
        return 0
      end,
    }, symbol = '' }

    require('mini.sessions').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    vim.cmd 'hi MiniJump guifg=#E0AF68 guibg=#1F2335'
    -- vim.cmd('hi MiniJump guifg=#7AA2F7 guibg=#3B4261')

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    -- local statusline = require 'mini.statusline'
    -- -- set use_icons to true if you have a Nerd Font
    -- statusline.setup { use_icons = vim.g.have_nerd_font }
    --
    -- -- You can configure sections in the statusline by overriding their
    -- -- default behavior. For example, here we set the section for
    -- -- cursor location to LINE:COLUMN
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
