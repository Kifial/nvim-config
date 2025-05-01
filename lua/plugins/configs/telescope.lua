local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble")

telescope.setup({
  extensions = {
    undo = {
      mappings = {
        i = {
          ["<cr>"] = require("telescope-undo.actions").restore,
          ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-y>"] = require("telescope-undo.actions").yank_additions,
        },
        n = {
          ["y"] = require("telescope-undo.actions").yank_additions,
          ["Y"] = require("telescope-undo.actions").yank_deletions,
          ["u"] = require("telescope-undo.actions").restore,
          ["<cr>"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = function(prompt_bufnr)
          actions.send_to_qflist(prompt_bufnr)
          trouble.open({ mode = "qflist" })
        end
      },
      n = {
        ["<C-q>"] = function(prompt_bufnr)
          actions.send_to_qflist(prompt_bufnr)
          trouble.open({ mode = "qflist" })
        end
      },
    }
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false
    }
  }
})




require("telescope").load_extension("undo")
