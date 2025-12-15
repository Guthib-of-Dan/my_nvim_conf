return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    vim.lsp.config("cssls", {
      capabilities = capabilities
    })
    vim.lsp.config("html", {
      capabilities = capabilities
    })
    vim.lsp.config("jsonls", {
       capabilities = capabilities
    })
    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
            { "docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml" },
          },
          validate = true,
          completion = true,
          hover = true,
        },
      },
    })

    vim.lsp.enable('basedpyright')
    vim.lsp.enable("cssls")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("gh_actions_ls")
    vim.lsp.enable("protols")
    vim.lsp.enable("clangd")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("tailwindcss")
    vim.lsp.enable('dockerls')
    vim.lsp.enable('yamlls')

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
          vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          vim.api.nvim_set_keymap('i', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true }) 
        end
      end,
    })
  end
}
