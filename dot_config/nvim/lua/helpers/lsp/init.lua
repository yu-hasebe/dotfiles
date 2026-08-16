vim.api.nvim_create_user_command("LspHealth", "checkhealth vim.lsp", { desc = "LSP health check" })

function LspOnAttach(client, bufnr)
	local opts = { buffer = bufnr, silent = true }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("i", "<C-q>", "<C-x><C-o>", opts)
end

local dirname = vim.fn.stdpath("config") .. "/lua/helpers/lsp"

for file, ftype in vim.fs.dir(dirname) do
	if ftype == "file" and vim.endswith(file, ".lua") and file ~= "init.lua" then
		local name = file:sub(1, -5)
		local ok, result = pcall(require, "helpers.lsp." .. name)
		if not ok then
			vim.notify("Error loading LSP: " .. name .. "\n" .. result, vim.log.levels.WARN)
		end
	end
end
