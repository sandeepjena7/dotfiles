return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup({
            init = function()
                require("hover.providers.lsp")
                require("hover.providers.diagnostic")
                require("hover.providers.man")
            end,
            preview_opts = { border = "rounded" },
            title = true,
        })

        -- Override K after LSP attaches (this is the fix)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                vim.keymap.set("n", "K", function() require("hover").open() end, { desc = "Hover Docs" })
            end,
        })

        vim.keymap.set("n", "K", function() require("hover").open() end, { desc = "Hover Docs" })
        vim.keymap.set("n", "gK", function() require("hover").enter() end, { desc = "Enter Hover" })
        -- Cycle providers
        vim.keymap.set("n", "<C-p>", function() require("hover").switch("previous") end, { desc = "Hover Previous" })
        vim.keymap.set("n", "<C-n>", function() require("hover").switch("next") end, { desc = "Hover Next" })
    end,
}