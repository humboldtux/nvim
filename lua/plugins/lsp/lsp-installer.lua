local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"html",
	"jsonls",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"taplo",
	"vimls",
	"yamlls",
}
for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
	}

	if server.name == "bashls" then
		local bashls_opts = require("plugins.lsp.settings.bashls")
		opts = vim.tbl_deep_extend("force", bashls_opts, opts)
		server:setup(opts)
	end

	if server.name == "jsonls" then
		local jsonls_opts = require("plugins.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		server:setup(opts)
	end

	if server.name == "rust_analyzer" then
		local rust_analyzer_opts = require("plugins.lsp.settings.rust_analyzer")
		opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
		require("rust-tools").setup({
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		server:setup(opts)
	end

	if server.name == "taplo" then
		local taplo_opts = require("plugins.lsp.settings.taplo")
		opts = vim.tbl_deep_extend("force", taplo_opts, opts)
		server:setup(opts)
	end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
end)
