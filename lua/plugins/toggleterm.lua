local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<C-t>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.register({
	t = {
		name = "Terminal",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}, { prefix = "<leader>" })
