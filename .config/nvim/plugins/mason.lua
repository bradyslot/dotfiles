local lsp_servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "stylelint_lsp",
  "taplo",
  "tsserver",
  "yamlls",
  "omnisharp",
}
local lint_servers = {
  "actionlint",
  "ansible-lint",
  "eslint_d",
  "yamllint",
  "stylelint",
  "shellcheck",
  "pylint",
  "markdownlint",
  "jsonlint",
  "codespell",
}

local settings = {
  ui = {
    border = "none",
      icons = {
      package_installed = "+",
      package_pending = ">",
      package_uninstalled = "-"
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-null-ls").setup({
  ensure_installed = lint_servers,
  automatic_installation = true,
  handlers = {},
})
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  automatic_installation = true,
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _,server in pairs(lsp_servers) do
  require("lspconfig")[server].setup {
    on_attach = require("mason").on_attach,
    capabilities = capabilities
  }
end
