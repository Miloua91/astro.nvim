-- Start command in conEmu outside of nvim
function RunCommandInCmd()
  local command = vim.fn.input('Enter command: ')

  if command ~= '' then
    local fullCommand = string.format('!start C:/tools/Cmder/vendor/conemu-maximus5/ConEmu64.exe "cmd /k %s"', command)
    vim.cmd('silent ' .. fullCommand)
    print('Command executed')
  else
    print('Command canceled')
  end
end

return {
  vim.api.nvim_set_keymap('n', '<leader>!', '<cmd>lua RunCommandInCmd()<CR>',
    { noremap = true, silent = true, desc = "Execute in terminal" })
}
