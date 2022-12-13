-- Setup Null-ls
local null_ls=require("null-ls")

-- Code actions, diagnostics, formatting, hover, completion
null_ls.setup({
  sources = {
    -- hover
    null_ls.builtins.hover.printenv,

    -- typescript
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,

    -- rustfmt
    null_ls.builtins.formatting.rustfmt,

    -- css
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.formatting.stylelint,

    -- vim
    -- null_ls.builtins.diagnostics.vint,

    -- lua
    null_ls.builtins.formatting.stylua,

    -- github actions
    null_ls.builtins.diagnostics.actionlint,

    -- ansible
    null_ls.builtins.diagnostics.ansiblelint,

    -- c/cpp
    null_ls.builtins.diagnostics.clang_check,
    null_ls.builtins.diagnostics.cmake_lint,

    -- spelling
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.djlint,

    -- python
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.pylint,

    -- snippets
    null_ls.builtins.completion.luasnip,

    -- misc
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.dotenv_linter,
  },
})
