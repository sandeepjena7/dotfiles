return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded"
        },
        hint_enable = false,
        floating_window = true,
        -- ❌ WRONG key: `auto_close_after` does not exist
        -- ✅ CORRECT key is: `close_timeout` (in milliseconds, not seconds)
        close_timeout = 5000,          -- was: auto_close_after = 5
        toggle_key = "<C-k>",
        -- ✅ ADD THIS — without it, toggle_key only pops the window once
        -- but won't flip the floating_window setting on/off properly
        toggle_key_flip_floatwin_setting = true,
    },
}