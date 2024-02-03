require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "html",
        "tailwindcss",
	"quick_lint_js",
        "tsserver",
        "pyright",
    }
})

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").quick_lint_js.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
}
