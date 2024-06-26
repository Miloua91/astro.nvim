return {
    'goolord/alpha-nvim',
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == 'lazy' then
            vim.cmd.close()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'AlphaReady',
                callback = function() require('lazy').show() end,
            })
        end

        require('alpha').setup(dashboard.opts)
    end,
    opts = function()
        local dashboard = require('alpha.themes.dashboard')
        local header = {
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠢⢀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⣠⣁⠂⠄⡀⡀⡀⣠⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣹⢿⠟⠋⠉⠛⠛⠍⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠋⠀⠐⠂⠀⢀⠠⠣⠠⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠏⢳⡀⢀⠠⠂⠁⠈⠀⠀⠐⠈⡐⠠⡀⠠⠀⠀⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢃⣤⢾⠣⡈⠀⠀⠀⠀⠀⠀⢄⠢⠂⠁⠀⣤⠡⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⠀⠀⡀⢄⣢⡗⠁⠀⠀⠀⠄⢻⣷⣮⣐⠠⠀⠀⢀⢈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⠂⣠⣾⠟⠋⠀⠀⢀⠠⠁⢀⠂⠉⠻⣿⣿⣾⡼⠏⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠈⢀⣴⡾⠟⠁⠈⠀⠀⡀⠡⠀⠐⠀⠀⠀⠀⣼⣷⡟⡀⠀⠀⠜⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⢁⣠⣴⣿⡏⠀⠃⠕⠀⠀⠂⠀⠀⠁⠁⠀⠀⢀⣾⣿⡏⠀⠀⠀⠌⠀⠀⠨⠐⠢⡀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣾⣿⣟⡿⠲⠑⠄⢀⠠⠈⠀⠀⠀⢀⠔⠈⠐⠀⠙⣻⡏⠓⣆⠀⠌⠀⡠⠄⠄⠄⠄⠌⠂⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣽⣷⣿⣯⠽⠠⠀⠀⠨⠀⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀⠀⢹⢀⣠⡿⠈⠔⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠌⠘⣿⡿⠋⠟⠨⠈⠠⠊⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠰⠁⣸⡿⠁⠀⠀⠀⠈⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠌⢰⡟⠁⠀⠀⠀⠀⠀⡀⡠⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⢢⠏⡀⣀⠠⡠⠔⠔⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⡠⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        }
        local footer = {
            '                                      n e o v i m   ',
            '▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄',
        }
        dashboard.section.header.val = header
        dashboard.section.footer.val = footer
        dashboard.section.buttons.val = {
            dashboard.button('f', '󰈞 ' .. ' Find file', ':Telescope find_files <CR>'),
            dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
            dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
            dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
            dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
            dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
            dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = 'comment'
            button.opts.hl_shortcut = 'comment'
        end
        dashboard.section.header.opts.hl = 'identifier'
        dashboard.section.buttons.opts.hl = 'string'
        dashboard.section.footer.opts.hl = 'comment'
        dashboard.opts.layout[1].val = 0
        return dashboard
    end,
}
