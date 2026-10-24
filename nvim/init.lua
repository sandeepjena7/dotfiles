require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps
require("core.snippets") -- Custom code snippets

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	-- require("plugins.python"),
	require("plugins.pythonuv"),

	require("plugins.autocompletion"),
	require("plugins.none-ls"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.comment"),
	require("plugins.rust"),
	require("plugins.lsp-signature"),
	-- require("plugins.hover"),
	-- require("plugins.remote"), not working future look this issue telecope issue
	-- require("plugins.bracket"),
	require("plugins.markdown"),	
})

-- Always open the cheatsheet on startup
local cheatsheet = vim.fn.expand("~/dotfiles/nvim_cheatsheet_clean.txt")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- delay so alpha / neo-tree finish their own startup first
		vim.defer_fn(function()
			if vim.fn.filereadable(cheatsheet) == 0 then
				return
			end

			local argc = vim.fn.argc()
			local only_dir = argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1

			if argc == 0 or only_dir then
				-- `nvim` or `nvim .`: show the cheatsheet instead of the dashboard
				vim.cmd("edit " .. vim.fn.fnameescape(cheatsheet))
			else
				-- `nvim somefile`: keep your file, open the cheatsheet in a side split
				vim.cmd("vsplit " .. vim.fn.fnameescape(cheatsheet))
				vim.cmd("wincmd p") -- jump back to your file
			end
		end, 50)
	end,
})
