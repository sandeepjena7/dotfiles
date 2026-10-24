-- return {
--   {
--     "mrcjkb/rustaceanvim",
--     version = "^9",
--     lazy = false, -- the plugin lazy-loads itself
--     init = function()
--       vim.g.rustaceanvim = {
--         server = {
--           capabilities = require("cmp_nvim_lsp").default_capabilities(),
--           default_settings = {
--             ["rust-analyzer"] = {
--               check = { command = "clippy" },
--               cargo = { allFeatures = true },
--               procMacro = { enable = true },
--             },
--           },
--         },
--       }
--     end,
--   },
--
--   {
--     "saecki/crates.nvim",
--     event = { "BufRead Cargo.toml" },
--     opts = {
--       lsp = { enabled = true, actions = true, completion = true, hover = true },
--     },
--   },
-- }
--
--

-- lua/plugins/rust.lua
-- Rust setup for Neovim 0.12+ using rustaceanvim ^9.
-- rustaceanvim configures rust-analyzer itself: do NOT enable rust_analyzer
-- through lspconfig / mason-lspconfig.

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false, -- the plugin lazy-loads itself
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    init = function()
      -- Using a function means this runs when the first Rust buffer opens,
      -- not at startup, so cmp_nvim_lsp is guaranteed to be loadable.
      vim.g.rustaceanvim = function()
        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

        return {
          server = {
            capabilities = ok and cmp_lsp.default_capabilities() or nil,

            on_attach = function(_, bufnr)
              local function map(keys, cmd, desc)
                vim.keymap.set("n", keys, function()
                  vim.cmd(cmd)
                end, { buffer = bufnr, desc = "Rust: " .. desc })
              end

              -- Inlay hints on by default (toggle with <leader>th from lsp.lua)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

              -- Rust-aware replacements / extras
              map("K", "RustLsp hover actions", "Hover actions")
              map("<leader>ra", "RustLsp codeAction", "Code action (grouped)")
              map("<leader>rr", "RustLsp runnables", "Runnables")
              map("<leader>rt", "RustLsp testables", "Testables")
              map("<leader>rd", "RustLsp debuggables", "Debuggables")
              map("<leader>re", "RustLsp explainError", "Explain error")
              map("<leader>rD", "RustLsp renderDiagnostic", "Render diagnostic")
              map("<leader>rm", "RustLsp expandMacro", "Expand macro")
              map("<leader>rc", "RustLsp openCargo", "Open Cargo.toml")
              map("<leader>rp", "RustLsp parentModule", "Parent module")
              map("<leader>rj", "RustLsp joinLines", "Join lines")
            end,

            default_settings = {
              ["rust-analyzer"] = {
                check = { command = "clippy" },
                cargo = {
                  allFeatures = true, -- remove if big workspaces feel slow
                  buildScripts = { enable = true },
                },
                procMacro = { enable = true },
                imports = {
                  granularity = { group = "module" },
                  prefix = "self",
                },
              },
            },
          },
        }
      end
    end,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      lsp = { enabled = true, actions = true, completion = true, hover = true },
    },
  },
}
