-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("blink-cmp")

require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.expand("~/dotfiles/nvim/.config/nvim/snippets"),
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.clangd.setup({
    cmd = { "clangd", "--header-insertion=never" }, -- Disable auto #include
    capabilities = capabilities,
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
		pattern = {"*.hl", "hypr*.conf"},
		callback = function(event)
				print(string.format("starting hyprls for %s", vim.inspect(event)))
				vim.lsp.start {
						name = "hyprlang",
						cmd = {"hyprls"},
						root_dir = vim.fn.getcwd(),
				}
		end
})
