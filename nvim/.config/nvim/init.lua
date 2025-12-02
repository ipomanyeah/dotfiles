-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("blink-cmp")

require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.expand("~/dotfiles/nvim/.config/nvim/snippets"),
})

local lspconfig = require("lspconfig")

-- Create capabilities and DISABLE snippet support BEFORE clangd setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- clangd without placeholders
lspconfig.clangd.setup({
  cmd = { "clangd", "--header-insertion=never" },
  capabilities = capabilities,
})

require("snacks")

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start({
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})
-- Default options:
require("kanagawa")

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
