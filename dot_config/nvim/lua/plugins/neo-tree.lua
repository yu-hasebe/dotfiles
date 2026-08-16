return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<space>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
		},
		opts = {
			window = {
				width = 30,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			default_component_configs = {
				icon = {
					folder_closed = "📁",
					folder_open   = "📂",
					folder_empty  = "📁",
					default       = "📄",
				},
				git_status = {
					symbols = {
						added     = "+",
						modified  = "~",
						deleted   = "-",
						renamed   = "»",
						untracked = "?",
						ignored   = "",
						unstaged  = "",
						staged    = "",
						conflict  = "✖",
					},
				},
			},
		},
	},
}
