local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "joaquin.plugins" },
	{ import = "joaquin.plugins.lsp" },
	-- Null-ls for linting and formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"williamboman/mason.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			require("mason-null-ls").setup({
				ensure_installed = { "eslint_d" }, -- Ensure eslint_d is installed
				automatic_installation = true,
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.eslint_d, -- Real-time linting with eslint_d
					null_ls.builtins.formatting.eslint_d, -- Auto-formatting
					null_ls.builtins.code_actions.eslint_d, -- Code actions (optional)
				},
				root_dir = require("null-ls.utils").root_pattern( -- Automatic root detection
					".eslintrc",
					".eslintrc.json",
					".eslintrc.js",
					"package.json",
					".git"
				),
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
