return {
  -- 'yetone/avante.nvim',
  -- event = 'VeryLazy',
  -- lazy = false,
  -- version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  -- opts = {
  --   --  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  --   provider = 'copilot', -- Recommend using Claude
  --   -- copilot = {
  --   --   model = 'claude-3.5-sonnet', -- o1-preview | o1-mini | claude-3.5-sonnet
  --   -- },
  --   auto_suggestions_provider = 'copilot', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  --   behaviour = {
  --     auto_focus_sidebar = true,
  --     auto_suggestions = false, -- Experimental stage
  --     auto_suggestions_respect_ignore = false,
  --     auto_set_highlight_group = true,
  --     auto_set_keymaps = true,
  --     auto_apply_diff_after_generation = false,
  --     jump_result_buffer_on_finish = false,
  --     support_paste_from_clipboard = false,
  --     minimize_diff = true,
  --   },
  --   history = {
  --     max_tokens = 4096,
  --     storage_path = vim.fn.stdpath 'state' .. '/avante',
  --     paste = {
  --       extension = 'png',
  --       filename = 'pasted-%Y-%m-%d-%H-%M-%S',
  --     },
  --   },
  --   highlights = {
  --     diff = {
  --       current = 'DiffText',
  --       incoming = 'DiffAdd',
  --     },
  --   },
  --   mappings = {
  --     diff = {
  --       ours = 'co',
  --       theirs = 'ct',
  --       all_theirs = 'ca',
  --       both = 'cb',
  --       cursor = 'cc',
  --       next = ']x',
  --       prev = '[x',
  --     },
  --     suggestion = {
  --       accept = '<M-l>',
  --       next = '<M-]>',
  --       prev = '<M-[>',
  --       dismiss = '<C-]>',
  --     },
  --     jump = {
  --       next = ']]',
  --       prev = '[[',
  --     },
  --     submit = {
  --       normal = '<CR>',
  --       insert = '<C-s>',
  --     },
  --     -- NOTE: The following will be safely set by avante.nvim
  --     ask = '<leader>aa',
  --     edit = '<leader>ae',
  --     refresh = '<leader>ar',
  --     focus = '<leader>af',
  --     toggle = {
  --       default = '<leader>at',
  --       debug = '<leader>ad',
  --       hint = '<leader>ah',
  --       suggestion = '<leader>as',
  --       repomap = '<leader>aR',
  --     },
  --     sidebar = {
  --       apply_all = 'A',
  --       apply_cursor = 'a',
  --       switch_windows = '<Tab>',
  --       reverse_switch_windows = '<S-Tab>',
  --       remove_file = 'd',
  --       add_file = '@',
  --     },
  --     files = {
  --       add_current = '<leader>ac', -- Add current buffer to selected files
  --     },
  --   },
  --   windows = {
  --     ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
  --     position = 'right',
  --     wrap = true, -- similar to vim.o.wrap
  --     width = 30, -- default % based on available width in vertical layout
  --     height = 30, -- default % based on available height in horizontal layout
  --     sidebar_header = {
  --       enabled = true, -- true, false to enable/disable the header
  --       align = 'left', -- left, center, right for title
  --       rounded = false,
  --     },
  --     input = {
  --       prefix = '> ',
  --       height = 8, -- Height of the input window in vertical layout
  --     },
  --     edit = {
  --       border = 'single',
  --       start_insert = true, -- Start insert mode when opening the edit window
  --     },
  --     ask = {
  --       floating = false, -- Open the 'AvanteAsk' prompt in a floating window
  --       border = 'single',
  --       start_insert = true, -- Start insert mode when opening the ask window
  --       ---@alias AvanteInitialDiff "ours" | "theirs"
  --       focus_on_apply = 'ours', -- which diff to focus after applying
  --     },
  --   },
  --   --- @class AvanteConflictConfig
  --   diff = {
  --     autojump = true,
  --     --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
  --     --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
  --     --- Disable by setting to -1.
  --     override_timeoutlen = 500,
  --   },
  --   --- @class AvanteHintsConfig
  --   hints = {
  --     enabled = true,
  --   },
  --   --- @class AvanteRepoMapConfig
  --   repo_map = {
  --     ignore_patterns = { '%.git', '%.worktree', '__pycache__', 'node_modules' }, -- ignore files matching these
  --     negate_patterns = {}, -- negate ignore files matching these.
  --   },
  --   --- @class AvanteFileSelectorConfig
  --   file_selector = {
  --     --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "telescope" | string
  --     provider = 'native',
  --     -- Options override for custom providers
  --     provider_opts = {},
  --   },
  --   suggestion = {
  --     debounce = 600,
  --     throttle = 600,
  --   },
  -- },
  -- -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- build = 'make',
  -- dependencies = {
  --   'stevearc/dressing.nvim',
  --   'nvim-lua/plenary.nvim',
  --   'MunifTanjim/nui.nvim',
  --   --- The below dependencies are optional,
  --   'echasnovski/mini.pick', -- for file_selector provider mini.pick
  --   'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  --   'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --   'ibhagwan/fzf-lua', -- for file_selector provider fzf
  --   'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --   'zbirenbaum/copilot.lua', -- for providers='copilot'
  --   {
  --     -- support for image pasting
  --     'HakonHarnes/img-clip.nvim',
  --     event = 'VeryLazy',
  --     opts = {
  --       -- recommended settings
  --       default = {
  --         embed_image_as_base64 = false,
  --         prompt_for_file_name = false,
  --         drag_and_drop = {
  --           insert_mode = true,
  --         },
  --         -- required for Windows users
  --         use_absolute_path = true,
  --       },
  --     },
  --   },
  --   {
  --     -- Make sure to set this up properly if you have lazy=true
  --     'MeanderingProgrammer/render-markdown.nvim',
  --     opts = {
  --       file_types = { 'markdown', 'Avante' },
  --     },
  --     ft = { 'markdown', 'Avante' },
  --   },
  -- },
}
