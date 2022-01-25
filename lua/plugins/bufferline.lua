local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
	},
})

local status_ok_whichkey, which_key = pcall(require, "which-key")
if not status_ok_whichkey then
	return
end
which_key.register({
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
}, { prefix = "<leader>" })

vim.cmd([[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]])
