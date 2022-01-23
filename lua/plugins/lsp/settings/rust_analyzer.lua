return {
	cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
	tools = { -- rust-tools options
		autoSetHints = false,
		hover_with_actions = false,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
		server = {
			--on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					--https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
					checkOnSave = {
						command = "clippyer",
					},
				},
			},
		},
	},
}
