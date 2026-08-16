local M = {}

local modes = {
	["n"] = { label = "NORMAL", icon = "🪄" },
	["i"] = { label = "INSERT", icon = "💪" },
	["v"] = { label = "VISUAL", icon = "🌌" },
	["V"] = { label = "V-LINE", icon = "🌌" },
	["\22"] = { label = "V-BLOCK", icon = "🌌" },
	["c"] = { label = "COMMAND", icon = "💥" },
	["R"] = { label = "REPLACE", icon = "🌐" },
	["t"] = { label = "TERMINAL", icon = "🌉" },
}

local function mode_section()
	local mode = vim.fn.mode()
	local m = modes[mode] or { label = mode, icon = "👻" }
	return m.icon .. " " .. m.label
end

local function file_section()
	local name = vim.fn.expand("%:~:.")
	if name == "" then
		name = "[No Name]"
	end
	local modified = vim.bo.modified and " ●" or ""
	return "🌃 " .. name .. modified
end

local git_cache = { branch = "", bufnr = -1 }
local function git_section()
	if vim.b.gitsigns_head then
		return "🔭 " .. vim.b.gitsigns_head
	end
	if vim.fn.bufnr() ~= git_cache.bufnr then
		git_cache.branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
		git_cache.bufnr = vim.fn.bufnr()
	end
	if git_cache.branch == "" then
		return ""
	end
	return "🔭 " .. git_cache.branch
end

local function diagnostics_section()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local parts = {}
	if errors > 0 then
		table.insert(parts, "💥 " .. errors)
	end
	if warns > 0 then
		table.insert(parts, "🔔 " .. warns)
	end
	return table.concat(parts, " ")
end

local function position_section()
	return "🌟 " .. vim.fn.line(".") .. ":" .. vim.fn.col(".")
end

local sep = " │ "

local function join(sections)
	local result = {}
	for _, s in ipairs(sections) do
		if s ~= "" then
			table.insert(result, s)
		end
	end
	return table.concat(result, sep)
end

M.render = function()
	local left = join({
		" " .. mode_section(),
		file_section(),
		git_section(),
	})
	local right = join({
		diagnostics_section(),
		position_section() .. " ",
	})
	return left .. "%=" .. right
end

return M
