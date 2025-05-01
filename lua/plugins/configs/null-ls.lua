local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.root_has_file({ ".prettierrc.json" }) -- Check for Prettier config
      end,
    }),
    null_ls.builtins.formatting.terraform_fmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          pcall(vim.cmd, "TSToolsOrganizeImports sync")
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
