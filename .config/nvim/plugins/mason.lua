local servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "eslint",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "stylelint_lsp",
  "sumneko_lua",
  "taplo",
  "tsserver",
  "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _,server in pairs(servers) do
  require("lspconfig")[server].setup {
    on_attach = require("mason").on_attach,
    capabilities = capabilities
  }
end
