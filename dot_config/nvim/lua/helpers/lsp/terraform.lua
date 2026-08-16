local lsp_utils = require("helpers.lsp.utils")

local augroup = vim.api.nvim_create_augroup("lua/helpers/lsp/terraform.lua", {})

local function create_autocmd(event, opts)
	vim.api.nvim_create_autocmd(
		event,
		vim.tbl_extend("force", {
			group = augroup,
		}, opts)
	)
end

create_autocmd("FileType", {
	pattern = { "terraform", "terraform-vars" },
	callback = function()
		vim.lsp.start({
			name = "terraform-ls",
			cmd = { "terraform-ls", "serve" },
			root_dir = vim.fs.root(0, { ".terraform", ".git" }),
			on_attach = function(client, bufnr)
				lsp_utils.on_attach(client, bufnr)
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
