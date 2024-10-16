vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- Center Screen on Navigation
vim.keymap.set('n', 'J', '6jzz')
vim.keymap.set('n', 'K', '6kzz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Switch panes without w
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- In visual mode, pressing J moves the selected block of text down one line, and pressing K moves it up one line. The selection is reselected (gv=gv) after moving.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Search Results Centering
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Select the whole buffer
vim.keymap.set('n', 'vv', 'ggVG')

-- Arrow
vim.keymap.set('n', '<Leader>p', require('arrow.persist').previous)
vim.keymap.set('n', '<Leader>n', require('arrow.persist').next)
vim.keymap.set('n', '<Leader>as', require('arrow.persist').toggle)

-- Resize horizontal split, increase
vim.keymap.set('n', '<Leader>rk', ':resize +5<CR>', { noremap = true, silent = true, desc = 'Increase horizontal split size' })

-- Resize horizontal split, decrease
vim.keymap.set('n', '<Leader>rj', ':resize -5<CR>', { noremap = true, silent = true, desc = 'Decrease horizontal split size' })

-- Resize vertical split, increase
vim.keymap.set('n', '<Leader>rl', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = 'Increase vertical split size' })

-- Resize vertical split, decrease
vim.keymap.set('n', '<Leader>rh', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = 'Decrease vertical split size' })

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

vim.keymap.set('n', '<leader>fn', '<cmd>Neotree reveal<CR>', { noremap = true, silent = true, desc = 'Toggle [F]ile [N]eotree' })
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

-- Home row search
vim.keymap.set('n', '<c-f>', '/')

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

-- Keymap for invoice cleanup
vim.api.nvim_set_keymap('n', '<leader>inv', ':v/#/d \\| g/^s*$/d<CR>', { noremap = true, silent = true, desc = 'Clean up invoice' })
