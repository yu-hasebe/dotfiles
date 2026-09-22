local lsp_utils = require("helpers.lsp.utils")

local augroup = vim.api.nvim_create_augroup("lua/helpers/lsp/typescript.lua", {})

local function create_autocmd(event, opts)
	vim.api.nvim_create_autocmd(
		event,
		vim.tbl_extend("force", {
			group = augroup,
		}, opts)
	)
end

create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.lsp.start({
			name = "ts_ls",
			cmd = { "typescript-language-server", "--stdio" },
			root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json", ".git" }),
			on_attach = function(client, bufnr)
				lsp_utils.on_attach(client, bufnr)
			end,
		})
	end,
})
