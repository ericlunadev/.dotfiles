vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- Center Screen on Navigation
vim.keymap.set('n', 'J', '6jzz')
vim.keymap.set('n', 'K', '6kzz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- vim-tmux-navigator keybindings are handled by the plugin
-- Commented out to prevent conflicts with tmux navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Search Results Centering
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Select the whole buffer
vim.keymap.set('n', 'vv', 'ggVG')

-- Yank line and comment/uncomment copy
vim.keymap.set('n', 'yc', 'yygccp')

-- Arrow
vim.keymap.set('n', '<Leader>p', require('arrow.persist').previous)
vim.keymap.set('n', '<Leader>n', require('arrow.persist').next)


local diagnostics_active = true
vim.keymap.set('n', '<leader>d', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

-- Git
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>ga', '<cmd>Git fetch --all<CR>')

vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true, desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>fo', '<cmd>Oil<CR>', { noremap = true, silent = true, desc = 'Toggle [F]ile [O]il' })
vim.keymap.set('n', '<leader>tgb', '<cmd>Gitsigns toggle_current_line_blame<CR>')

local ericlunadev = vim.api.nvim_create_augroup('ericlunadev', {})

local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWinEnter', {
  group = ericlunadev,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= 'fugitive' then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>p', function()
      vim.cmd.Git 'push'
    end, opts)

    -- rebase always
    vim.keymap.set('n', '<leader>P', function()
      vim.cmd.Git 'pull --rebase'
    end, opts)

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set('n', '<leader>t', ':Git push -u origin ', opts)

    -- Save git stash
    vim.keymap.set('n', '<leader>ss', ':Git stash save -u', opts)

    vim.keymap.set('n', '<leader>sa', ':Git stash save -u "ES setup"', opts)
  end,
})

vim.keymap.set('n', '<leader>w', '<cmd>:update<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>:q<CR>')
vim.keymap.set('n', '<leader>Q', '<cmd>:q!<CR>')

vim.keymap.set('n', '<leader>j', 'J')

-- This is for fugitive
vim.api.nvim_create_user_command('Browse', function(opts)
  vim.fn.system { 'open', opts.fargs[1] }
end, { nargs = 1 })
vim.keymap.set({ 'n', 'v' }, '<leader>gbo', ':GBrowse<cr>') -- git browse current file in browser
vim.keymap.set({ 'n', 'v' }, '<leader>gby', ':GBrowse!<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>gc', ':G checkout FRE-', { noremap = true, silent = false })

-- Search and replace selection
vim.keymap.set('v', '<C-r>', '"hy:%s/\\v<C-r>h//g<left><left>', { silent = false, desc = 'change selection' })

vim.keymap.set('n', '<leader>bda', ':%bdelete|edit#|bdelete#<CR>', { desc = 'Delete all buffers except the current one' })

-- Copy a pytest command for the current file (relative path) to the clipboard
vim.api.nvim_set_keymap(
  'n',
  '<leader>pyt',
  [[:lua vim.fn.system('echo "pytest ' .. vim.fn.expand('%') .. ' -vv -s" | pbcopy'); vim.notify('Copied pytest command to clipboard')<CR>]],
  { noremap = true, silent = true }
)

-- Substitute
vim.keymap.set('n', 's', require('substitute').operator, { noremap = true })
vim.keymap.set('n', 'ss', require('substitute').line, { noremap = true })
vim.keymap.set('n', 'S', require('substitute').eol, { noremap = true })
vim.keymap.set('x', 's', require('substitute').visual, { noremap = true })

vim.keymap.set('n', '<leader>tn', function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = 'Toggle line numbers' })

-- Toggle relative numbers
vim.keymap.set('n', '<leader>tr', function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = 'Toggle relative numbers' })

-- Note: vim-tmux-navigator plugin handles <C-h> navigation
-- Removed terminal mode <C-h> mapping to avoid conflicts with vim-tmux-navigator

-- Close notifications
vim.keymap.set('n', '<leader>x', function()
  require('notify').dismiss({ silent = true, pending = true })
end, { desc = 'Close notifications' })
