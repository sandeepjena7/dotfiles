return {
  {
    "amitds1997/remote-nvim.nvim",
    branch = "main",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("remote-nvim").setup({
        ssh_config = {
          ssh_config_file_paths = { "$HOME/.ssh/config" },
        },
        remote = {
          copy_dirs = {
            config = {
              base = vim.fn.stdpath("config"),
              dirs = "*",
              compression = {
                enabled = true,
                additional_opts = { "--exclude-vcs" },
              },
            },
          },
        },
      })
    end,
  },
}