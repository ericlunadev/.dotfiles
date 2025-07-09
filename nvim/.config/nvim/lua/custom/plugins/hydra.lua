return {
  'nvimtools/hydra.nvim',
  config = function()
    local Hydra = require 'hydra'

    Hydra {
      name = 'Resize',
      mode = 'n',
      body = '<leader>r',
      hint = [[
 Resize Panes
 _h_: ← decrease width     _l_: → increase width
 _j_: ↓ decrease height    _k_: ↑ increase height
 _=_: equalize             _q_: quit
      ]],
      config = {
        color = 'pink',
        invoke_on_body = true,
        hint = {
          position = 'middle',
          float_opts = {
            border = 'rounded',
          },
        },
      },
      heads = {
        { 'h', ':vertical resize -5<CR>' },
        { 'l', ':vertical resize +5<CR>' },
        { 'j', ':resize -5<CR>' },
        { 'k', ':resize +5<CR>' },
        { '=', '<C-w>=' },
        { 'q', nil, { exit = true } },
        { '<Esc>', nil, { exit = true } },
      },
    }
  end,
}