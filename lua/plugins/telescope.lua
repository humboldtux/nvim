local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})

-- https://www.youtube.com/watch?v=indguFY7wJ0&ab_channel=CodeSmell
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
--https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/53
telescope.load_extension("file_browser")
-- https://github.com/AckslD/nvim-neoclip.lua
-- <C-n>
telescope.load_extension("neoclip")
