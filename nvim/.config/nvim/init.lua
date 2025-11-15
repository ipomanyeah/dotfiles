-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("blink-cmp")
require("luasnip").add_snippets("cpp", require("snippets.cpp"))
require("luasnip.loaders.from_lua").lazy_load({
  paths = "snippets"
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.clangd.setup({
    cmd = { "clangd", "--header-insertion=never" }, -- Disable auto #include
    capabilities = capabilities,
})
