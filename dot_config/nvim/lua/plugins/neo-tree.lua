return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<space>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		},
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					icon = {
						provider = function(icon, node)
							local text, hl
							local mini_icons = require("mini.icons")
							if node.type == "file" then
								text, hl = mini_icons.get("file", node.name)
							elseif node.type == "directory" then
								text, hl = mini_icons.get("directory", node.name)
							end
							if text then
								icon.text = text
								icon.highlight = hl
							end
						end,
					},
				},
			})
		end,
	},
}
