vim.g.startify_session_dir = '~/.config/nvim/session'
--You can automatically restart a session like this
vim.g.startify_session_autoload = 1
-- Let Startify take care of buffers
vim.g.startify_session_delete_buffers = 1
-- Similar to Vim-rooter
vim.g.startify_change_to_vcs_root = 1
-- If you want Unicode
vim.g.startify_fortune_use_unicode = 1
-- Automatically Update Sessions
vim.g.startify_session_persistence = 1
-- Get rid of empy buffer and quit
vim.g.startify_enable_special = 0

-- vim.g.startify_lists = [
--          \ { 'type': 'files',     'header': ['   Files']            },
--         \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
--          \ { 'type': 'sessions',  'header': ['   Sessions']       },
--         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
--          \ ]

--vim.g.startify_bookmarks = [
--            \ { 'c': '~/.config/i3/config' },
--            \ { 'i': '~/.config/nvim/init.vim' },
--            \ { 'z': '~/.zshrc' },
--            \ '~/Blog',
--            \ '~/Code',
--            \ '~/Pics',
--            \ ]
