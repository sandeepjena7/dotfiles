return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
      -- Setup nvim-treesitter
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })
      -- if need c ro cpp used this or typecrpint  TSInstall cpp rust javascript typescript


      -- Install parsers synchronously
      -- local parsers_to_install = {
      --   'python',
      --   'lua',
      --   'markdown',
      --   'markdown_inline',
      --   'bash',
      --   'json',
      --   'yaml',
      --   'vim',
      --   'vimdoc',
      --   'query',
      --   'rust',
      --   'javascript',
      --   -- 'typescript',
      --   'c',
      --   -- 'cpp',
      --   'html',
      --   'css',
      -- }

       local essential_parsers = {
        'python',
        'lua',
        'markdown',
        'bash',
        'json',
        'vim',
        'vimdoc',
        'query',
        "rust",
        "c",
      }

      -- Install parsers asynchronously
      require('nvim-treesitter').install(parsers_to_install)

      -- Setup rainbow delimiters
      local rainbow_delimiters = require('rainbow-delimiters')
      
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }

      -- MDX support
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")

      -- Enable treesitter features via autocommand
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'python', 'lua', 'markdown', 'bash', 'json', 'yaml', 
          'vim', 'vimdoc', 'query', 'rust', 'javascript', 'typescript',
          'c', 'cpp', 'html', 'css', 'go', 'java'
        },
        callback = function(args)
          local buf = args.buf
          local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
          
          -- Only start treesitter if parser is available
          if lang and pcall(vim.treesitter.language.add, lang) then
            -- Enable highlighting
            pcall(vim.treesitter.start, buf)
            
            -- Enable folding
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
            vim.wo[0][0].foldenable = false
            
            -- Enable indentation for specific languages
            if vim.tbl_contains({ 'lua'}, vim.bo[buf].filetype) then
              vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
        end,
      })
    end,
  },
  
  -- Treesitter textobjects (using main branch compatible with the rewrite)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main", -- Important: Use main branch for new nvim-treesitter
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Configure textobjects with the new API
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          keymaps = {
            -- Functions
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            -- Classes
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- Loops
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            -- Conditionals
            ["ad"] = "@conditional.outer",
            ["id"] = "@conditional.inner",
            -- Parameters/Arguments
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            -- Blocks
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = 'V',     -- linewise
          },
          include_surrounding_whitespace = false,
        },
        
        move = {
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
            ["]o"] = "@loop.outer",
            ["]d"] = "@conditional.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
            ["[o"] = "@loop.outer",
            ["[d"] = "@conditional.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        
        swap = {
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
            ["<leader>m"] = "@function.outer",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
            ["<leader>M"] = "@function.outer",
          },
        },
      })
    end,
  },
}