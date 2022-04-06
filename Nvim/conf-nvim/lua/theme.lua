-- Hide ~ from end of lines.
vim.opt.fillchars = {eob = " "}

-- Add icons for lsp diagnostics sings
vim.cmd
[[
  sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
  sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
  sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
  sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
]]

vim.g.rose_pine_variant= 'base' -- styles: base, moon and dawn.
vim.cmd('colorscheme rose-pine')
