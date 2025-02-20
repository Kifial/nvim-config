local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>w", vim.cmd.w)
map("n", "<leader>q", vim.cmd.q)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


map("x", "<leader>P", "\"_dP")

map("n", "<leader>p", "\"+p")
map("v", "<leader>p", "\"+p")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

map("n", "Q", "<nop>")
map("n", "<leader>fr", vim.lsp.buf.format)

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("v", "<leader>c", "gc", { remap = true })
map("n", "<leader>c", "gcc", { remap = true })

local builtin = require('telescope.builtin')
map("n", "<C-p>", builtin.find_files, { desc = 'Telescope find files' })
map("n", "<C-f>", builtin.live_grep, { desc = 'Telescope live grep' })
map("n", "<leader>td", builtin.diagnostics)
map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })

map("n", "<C-]>", vim.cmd.bnext)
map("n", "<C-[>", vim.cmd.bprev)

map("n", "<leader>e", ":NvimTreeToggle<CR>")

local opts = { noremap = true, silent = true }
-- Keybindings
map("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
map("n", "gh", vim.lsp.buf.hover, opts)      -- Show hover info
map("n", "<leader>vd", vim.diagnostic.open_float, opts)
map("n", "gs", function()
  require("tiny-code-action").code_action()
end, opts)

map("n", "<leader>u", "<cmd>Telescope undo<cr>")

map("n", "<leader>g", "<cmd>G<CR><C-w>_")
map("n", "gk", "<cmd>diffget //2<CR>")
map("n", "gl", "<cmd>diffget //3<CR>")

map("n", "<Esc>", "<Esc>", { noremap = true })
