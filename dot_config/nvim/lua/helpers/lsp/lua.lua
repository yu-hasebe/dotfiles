local lsp_utils = require("helpers.lsp.utils")

local augroup = vim.api.nvim_create_augroup("lua/helpers/lsp/lua.lua", {})

local function create_autocmd(event, opts)
	vim.api.nvim_create_autocmd(
		event,
		vim.tbl_extend("force", {
			group = augroup,
		}, opts)
	)
end

create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.lsp.start({
			name = "lua_ls",
			cmd = { "lua-language-server" },
			root_dir = vim.fs.root(0, { ".git" }),

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Disable the built-in formatter to use stylua instead
					format = {
						enable = false,
					},
				},
			},

			on_attach = function(client, bufnr)
				lsp_utils.on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						-- Use stylua instead of the lua_ls built-in formatter
						local content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
						local result = vim.fn.system({ "stylua", "--search-parent-directories", "-" }, content)
						if vim.v.shell_error == 0 then
							local lines = vim.split(result, "\n", { plain = true })
							if lines[#lines] == "" then
								table.remove(lines)
							end
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
						end
					end,
				})
			end,
		})
	end,
})
