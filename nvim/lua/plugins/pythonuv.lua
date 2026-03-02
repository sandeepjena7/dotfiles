return {
    {
        "benomahony/uv.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = false,
        -- ft = { "python" }, -- Optional: lazy load only for Python files
        opts = {
            -- Auto-activate virtual environments when found
            auto_activate_venv = true,
            notify_activate_venv = true,

            -- Auto commands for directory changes
            auto_commands = true,

            -- Integration with telescope picker
            picker_integration = true,

            -- Keymaps configuration
            keymaps = {
                prefix = "<leader>x",  -- Main prefix for uv commands
                commands = true,       -- Show uv commands menu (<leader>x)
                run_file = true,       -- Run current file (<leader>xr)
                run_selection = true,  -- Run selected code (<leader>xs)
                run_function = true,   -- Run function (<leader>xf)
                venv = true,           -- Environment management (<leader>xe)
                init = true,           -- Initialize uv project (<leader>xi)
                add = true,            -- Add a package (<leader>xa)
                remove = true,         -- Remove a package (<leader>xd)
                sync = true,           -- Sync packages (<leader>xc)
                sync_all = true,       -- Sync all packages (<leader>xC)
            },

            -- Execution options
            execution = {
                run_command = "uv run python",
                notify_output = true,
                notification_timeout = 10000,
            },
        },
    },
}


