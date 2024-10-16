return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function trunc(trunc_width)
      return function(str)
        if #str <= trunc_width then
          return str
        end
        return str:sub(1, trunc_width) .. '...'
      end
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          'mode',
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              end -- not recording
              return 'recording to ' .. reg
            end,
          },
        },
        lualine_b = {
          {
            'branch',
            fmt = trunc(30),
          },
          'diagnostics',
        },
        lualine_c = {
          'filename',
          {
            function()
              local statusline = require 'arrow.statusline'
              return statusline.text_for_statusline_with_icons()
            end,
          },
        },
        lualine_x = { 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
