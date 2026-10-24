local M = {}

M.base46 = {
	transparency = true,
	hl_override = {
		Normal = { fg = "#EAD4AA" },
		Comment = { fg = "#8B9BB4", italic = true },
		String = { fg = "#63C74D" },
		Number = { fg = "#FEE761" },
		Boolean = { fg = "#FEE761" },
		Float = { fg = "#FEE761" },
		Function = { fg = "#0099DB" },
		Keyword = { fg = "#B55088" },
		Type = { fg = "#2CE8F5" },
		Constant = { fg = "#FEAE34" },
		Special = { fg = "#F6757A" },
		Statement = { fg = "#E43B44" },
		Identifier = { fg = "#EAD4AA" },
	},
}

return M
