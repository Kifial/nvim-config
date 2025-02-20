require("telescope").setup({
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
  }
})

require("telescope").load_extension("undo")
