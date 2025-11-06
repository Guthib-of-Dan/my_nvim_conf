return {
  "neovim/nvim-lspconfig",
  config = function()
    --vim.lsp.enable("marko-js")
    -- In your init.lua
    --vim.filetype.add({ extension = { marko = 'marko', }, })
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
    vim.lsp.enable('basedpyright')
    vim.lsp.enable("cssls")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("gh_actions_ls")
    vim.lsp.enable("protols")
    vim.lsp.enable("clangd")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("tailwindcss")

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
          vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          --vim.api.nvim_buf_set_keymap(ev.buf, 'n', ""
         vim.api.nvim_set_keymap('i', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true }) 
        end
      end,
    })
  end
}
