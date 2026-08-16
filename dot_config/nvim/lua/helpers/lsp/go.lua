local augroup = vim.api.nvim_create_augroup("lua/helpers/lsp/go.lua", {})

local function create_autocmd(event, opts)
	vim.api.nvim_create_autocmd(
		event,
		vim.tbl_extend("force", {
			group = augroup,
		}, opts)
	)
end

create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.lsp.start({
			name = "gopls",
			cmd = { "gopls" },
			root_dir = vim.fs.root(0, { "go.mod", ".git" }),
			settings = {
				gopls = {
					gofumpt = true,
					analyses = { unusedparams = true },
					staticcheck = true,
				},
			},
			on_attach = function(client, bufnr)
				LspOnAttach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end,
		})
	end,
})
