local trouble = require("trouble")

trouble.setup({})

local map = vim.keymap.set

map("n", "<leader>tq", function()
  trouble.toggle({ mode = "qflist" })
end)

map("n", "<leader>tr", function()
  trouble.toggle({ mode = "lsp_references" })
end)

map("n", "<leader>td", function()
  trouble.toggle({ mode = "diagnostics" })
end)

map("n", "]t", function()
  trouble.next({ skip_groups = true, jump = true })
end)

map("n", "[t", function()
  trouble.prev({ skip_groups = true, jump = true })
end)
