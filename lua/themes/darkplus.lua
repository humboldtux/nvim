-- https://youtu.be/RtNPfJKNr_8?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=664

vim.cmd([[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
