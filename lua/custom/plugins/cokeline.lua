return {
  'willothy/nvim-cokeline',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    'nvim-tree/nvim-web-devicons', -- If you want devicons
    'stevearc/resession.nvim', -- Optional, for persistent history
  },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local green = vim.g.terminal_color_2
    local yellow = vim.g.terminal_color_3

    local map = vim.api.nvim_set_keymap

    map('n', 'H', '<Plug>(cokeline-focus-prev)', { silent = true })
    map('n', 'L', '<Plug>(cokeline-focus-next)', { silent = true })
    map('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
    map('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })

    for i = 1, 9 do
      map('n', ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
      map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
    end

    require('cokeline').setup {

      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },

      components = {
        {
          text = '｜',
          fg = function(buffer)
            return buffer.is_modified and yellow or green
          end,
        },
        {
          text = function(buffer)
            return buffer.devicon.icon .. ' '
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            return buffer.index .. ': '
          end,
        },
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          fg = get_hex('Comment', 'fg'),
          italic = true,
        },
        {
          text = function(buffer)
            return buffer.filename .. ' '
          end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },
        {
          text = ' ',
        },
      },
    }
  end,
}
