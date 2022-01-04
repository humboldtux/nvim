local status_ok, _ = pcall(vim.cmd, "colorscheme nord")

if not status_ok then
	vim.notify("colorscheme nord not found!")
	return
end
