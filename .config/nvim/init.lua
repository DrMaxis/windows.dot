-- Use system clipboard                
vim.opt.clipboard = "unnamedplus,unnamed"

-- Show trailing whitespace whenever your not typing

vim.api.nvim_command('autocmd BufEnter * highlight ExtraWhitespace guibg=red')

vim.api.nvim_set_keymap('n', '<F6>', [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]], { noremap = true, silent = true })

local function set_ws_match()
  local in_insert = vim.fn.mode():match('^i')
  local pattern = in_insert and [[\s\+\%#\@<!$]] or [[\s\+$]]
  if vim.w.whitespace_match_number then
    pcall(vim.fn.matchdelete, vim.w.whitespace_match_number)
  end
  vim.w.whitespace_match_number = vim.fn.matchadd('ExtraWhitespace', pattern)
end

local aug = vim.api.nvim_create_augroup('WhitespaceMatch', { clear = true })

vim.api.nvim_create_autocmd('ModeChanged', {
  group = aug,
  callback = set_ws_match,
})

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufEnter', 'WinEnter' }, {
  group = aug,
  callback = set_ws_match,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.fn.matchadd('BadCharactersHighlight', [==[[\x0b\x0c\u00a0\u1680\u180e\u2000-\u200a\u2028\u202f\u205f\u3000\ufeff]]==])
  end
})
vim.api.nvim_set_hl(0, 'BadCharactersHighlight', {ctermbg='red', bg='#f92672'})
 -- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
