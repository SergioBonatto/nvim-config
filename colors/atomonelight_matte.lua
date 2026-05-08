vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "atomonelight_matte"

require("onehalfmatte.highlights").apply(
  require("onehalfmatte.palette").light
)
