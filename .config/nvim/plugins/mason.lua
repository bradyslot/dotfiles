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
  -- "csharp_ls",
  "sqlls",
  "terraformls",
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
  "tflint",
  -- "sqlfluff",
}

local mason_settings = {
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

local lsp_handlers = {
  ["omnisharp"] = {
    ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
    ["textDocument/references"] = require('omnisharp_extended').references_handler,
    ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
  },
}

local lsp_settings = {
  ["omnisharp"] = {
    -- enable_editorconfig_support = true,
    -- enable_ms_build_load_projects_on_demand = true,
    -- enable_roslyn_analyzers = true,
    -- organize_imports_on_format = false,
    -- enable_import_completion = false,
    -- sdk_include_prereleases = false,
    -- analyze_open_documents_only = false,
  }
}

require("mason").setup(mason_settings)
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
    capabilities = capabilities,
    handlers = lsp_handlers[server],
    settings = lsp_settings[server],
  }
end

