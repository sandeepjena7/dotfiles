return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = "rust",
    config = function()
      -- Use direct path construction instead of mason registry methods
      local home = os.getenv("HOME")
      local mason_path = home .. "/.local/share/nvim/mason"
      local extension_path = mason_path .. "/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      
      -- Check if codelldb actually exists at this path
      local codelldb_exists = vim.fn.filereadable(codelldb_path) == 1
      
      if codelldb_exists then
        local cfg = require('rustaceanvim.config')
        vim.g.rustaceanvim = {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
        vim.notify("Rust debugging configured!", vim.log.levels.INFO)
      else
        vim.g.rustaceanvim = {}
        vim.notify("codelldb not found. Install via :Mason", vim.log.levels.WARN)
      end
    end
  },
  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui', 
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
    {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function()
      require("crates").setup {
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" } }
      })
    end
  },
}