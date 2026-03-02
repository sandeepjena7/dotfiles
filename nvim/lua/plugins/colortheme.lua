-- return {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       -- Example config in lua
--       vim.g.nord_contrast = true
--       vim.g.nord_borders = false
--       vim.g.nord_disable_background = true
--       vim.g.nord_italic = false
--       vim.g.nord_uniform_diff_background = true
--       vim.g.nord_bold = false
  
--       -- Load the colorscheme
--       require('nord').set()
  
--       -- Toggle background transparency
--       local bg_transparent = false
  
--       local toggle_transparency = function()
--         bg_transparent = not bg_transparent
--         vim.g.nord_disable_background = bg_transparent
--         vim.cmd [[colorscheme nord]]
--       end
  
--       vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end,
--   }

return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- OPTIONAL CONFIG:
    -- See https://github.com/Mofiqul/dracula.nvim#configuration
    require("dracula").setup({
      -- you can customize colors or styles here, e.g.:
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
      },
      italic_comment = true,
      transparent_bg = false, -- set to true if you want transparency
    })

    -- Load the colorscheme
    vim.cmd([[colorscheme dracula]])

    -- Optional: Keymap to toggle transparency
    local bg_transparent = false

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require("dracula").setup({
        transparent_bg = bg_transparent,
      })
      vim.cmd([[colorscheme dracula]])
    end

    vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
  end,
}


-- return {
--   "luisiacc/gruvbox-baby",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Set these BEFORE loading the colorscheme
--     vim.g.gruvbox_baby_background_color = "dark" -- dark or medium
--     vim.g.gruvbox_baby_transparent_mode = 0 -- 0 = opaque, 1 = transparent
--     vim.g.gruvbox_baby_keyword_style = "italic"
--     vim.g.gruvbox_baby_function_style = "bold"
--     vim.g.gruvbox_baby_comment_style = "italic"
    
--     -- Custom color overrides to match your terminal
--     vim.g.gruvbox_baby_highlights = {
--       Normal = { fg = "#EBDBB2", bg = "#1E1E1E" },
--       NormalFloat = { fg = "#EBDBB2", bg = "#1E1E1E" },
--       SignColumn = { bg = "#1E1E1E" },
--       LineNr = { bg = "#1E1E1E" },
--     }
    
--     -- Load colorscheme
--     vim.cmd([[colorscheme gruvbox-baby]])
    
--     -- Optional: Toggle transparency keymap
--     local bg_transparent = false
--     vim.keymap.set("n", "<leader>bg", function()
--       bg_transparent = not bg_transparent
--       vim.g.gruvbox_baby_transparent_mode = bg_transparent and 1 or 0
--       vim.cmd([[colorscheme gruvbox-baby]])
--     end, { noremap = true, silent = true, desc = "Toggle transparency" })
--   end,
-- }


-- return {
--   "ellisonleao/gruvbox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = false,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "medium", -- can be "hard", "soft" or empty string
--       palette_overrides = {
--         dark0_hard = "#1E1E1E",  -- matches your terminal background
--         dark0 = "#1E1E1E",
--         dark0_soft = "#282828",
--         dark1 = "#3c3836",
--         dark2 = "#504945",
--         dark3 = "#665c54",
--         dark4 = "#7c6f64",
--         light0_hard = "#EBDBB2", -- matches your terminal foreground
--         light0 = "#EBDBB2",
--         light0_soft = "#d5c4a1",
--         light1 = "#ebdbb2",
--         light2 = "#d5c4a1",
--         light3 = "#bdae93",
--         light4 = "#a89984",
--         bright_red = "#fb4934",
--         bright_green = "#b8bb26",
--         bright_yellow = "#fabd2f",
--         bright_blue = "#83a598",
--         bright_purple = "#d3869b",
--         bright_aqua = "#8ec07c",
--         bright_orange = "#fe8019",
--         neutral_red = "#cc241d",
--         neutral_green = "#98971a",
--         neutral_yellow = "#d79921",
--         neutral_blue = "#458588",
--         neutral_purple = "#b16286",
--         neutral_aqua = "#689d6a",
--         neutral_orange = "#d65d0e",
--         faded_red = "#9d0006",
--         faded_green = "#79740e",
--         faded_yellow = "#b57614",
--         faded_blue = "#076678",
--         faded_purple = "#8f3f71",
--         faded_aqua = "#427b58",
--         faded_orange = "#af3a03",
--       },
--       overrides = {
--         -- Customize specific highlight groups if needed
--         Normal = { bg = "#1E1E1E", fg = "#EBDBB2" },
--         SignColumn = { bg = "#1E1E1E" },
--         GruvboxGreenSign = { bg = "#1E1E1E" },
--         GruvboxOrangeSign = { bg = "#1E1E1E" },
--         GruvboxPurpleSign = { bg = "#1E1E1E" },
--         GruvboxYellowSign = { bg = "#1E1E1E" },
--         GruvboxRedSign = { bg = "#1E1E1E" },
--         GruvboxBlueSign = { bg = "#1E1E1E" },
--         GruvboxAquaSign = { bg = "#1E1E1E" },
--       },
--       dim_inactive = false,
--       transparent_mode = false,
--     })
    
--     -- Set background and load colorscheme
--     vim.o.background = "dark"
--     vim.cmd([[colorscheme gruvbox]])
    
--     -- Optional: Keymap to toggle transparency
--     local bg_transparent = false
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       require("gruvbox").setup({
--         transparent_mode = bg_transparent,
--       })
--       vim.cmd([[colorscheme gruvbox]])
--     end
    
--     vim.keymap.set("n", "<leader>bg", toggle_transparency, { 
--       noremap = true, 
--       silent = true,
--       desc = "Toggle background transparency"
--     })
--   end,
-- }