return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		-- branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup({
				settings = {
					options = {
						notify_user_on_venv_activation = true,
					},
					search = {
						anaconda_base = {
							command = "fdfind /python$ /home/sandeep/miniconda3/envs --full-path  -E /proc | grep --color=never '/bin/python$'",
							type = "anaconda",
						},
					},
				},
			})
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv
			{ "<leader>cea", "<cmd>VenvSelect<cr>" },
		},
	},
}
