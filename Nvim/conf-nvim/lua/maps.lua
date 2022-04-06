-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Better way to go to normal mode
map('i', 'ii', '<ESC>')

-- Map leader key to space.
vim.g.mapleader = ' '

-- Set cl for clearing highlights after searching word in file.
map('n', '<leader>nl', ':nohlsearch<CR>')

-- Split navigations.
map('n', '<A-j>', '<C-w><C-j>')
map('n', '<A-k>', '<C-w><C-k>')
map('n', '<A-l>', '<C-w><C-l>')
map('n', '<A-h>', '<C-w><C-h>')


-- Buffer resizing.
map('n', '<A-H>', ':call ResizeLeft(3)<CR><Esc>')
map('n', '<A-L>', ':call ResizeRight(3)<CR><Esc>')
map('n', '<A-K>', ':call ResizeUp(1)<CR><Esc>')
map('n', '<A-J>', ':call ResizeDown(1)<CR><Esc>')


-- Buffer switching.
map('n', '<A-[>', ':BufferLineCyclePrev<CR>')
map('n', '<A-]>', ':BufferLineCycleNext<CR>')

-- Buffer closing.
map('n', '<A-q>', ':BufferLinePickClose<CR>')

-- Buffer moving.
map('n', '<A-{>', ':BufferLineMoveNext<CR>')
map('n', '<A-}>', ':BufferLineMovePrev<CR>')


-- NvimTree toggle
map('n', '<leader>t', ':NvimTreeToggle<CR>')


-- Session commands
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")

--------
-- Lsp
map('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', ':lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>')


-- ToggleTerm
map('n', '<C-t>', ':ToggleTerm<CR>')
map('t', '<C-t>', ':ToggleTerm<CR>')
map('n', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
map('v', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
  map('t', '<esc>', '<C-\\><C-n>')
  map('t', 'jk', '<C-\\><C-n>')
  map('t', '<A-h>', '<c-\\><c-n><c-w>h')
  map('t', '<A-j>', '<c-\\><c-n><c-w>j')
  map('t', '<A-k>', '<c-\\><c-n><c-w>k')
  map('t', '<A-l>', '<c-\\><c-n><c-w>l')

  map('t', '<S-h>', '<c-\\><C-n>:call ResizeLeft(3)<CR>')
  map('t', '<S-j>', '<c-\\><C-n>:call ResizeDown(1)<CR>')
  map('t', '<S-k>', '<c-\\><C-n>:call ResizeUp(1)<CR>')
  map('t', '<S-l>', '<c-\\><C-n>:call ResizeRight(3)<CR>')
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Remove unnecessary white spaces.
map('n', '<leader>cw', ':StripWhitespace<CR>')


-- comment
map("n", "cc", ":CommentToggle<CR>")
map("v", "cc", ":'<,'>CommentToggle<CR>")
