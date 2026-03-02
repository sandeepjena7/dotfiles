-- Requires TreeSitter to be set up
return {
  'mrjones2014/nvim-ts-rainbow',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup({
      rainbow = {
        enable = true,
        -- Colors can be customized:
        colors = {
          "#cc241d",
          "#a89984",
          "#b16286",
          "#d79921",
          "#689d6a",
          "#d65d0e",
          "#458588",
        },
        -- Term colors for non-GUI
        termcolors = {
          "red",
          "green",
          "yellow",
          "blue",
          "magenta",
          "cyan",
          "white",
        }
      }
    })
  end
}