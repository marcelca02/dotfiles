require('nvim-treesitter.configs').setup {
        -- A list of parser names, or "all"
	ensure_installed = {"c", "rust", "bash", "cpp", "java", "make", "toml", "javascript", "lua", "python", "json", "html", "vim", "typescript", "css"},
	auto_install = true,
	sync_install = false,
        highlight = {
            enable = true,
            use_languagetree = true
        },
        indent = {
            enable = true
        },
        autotag = {
            enable = true
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false
        },
        refactor = {
            highlight_definitions = {
                enable = true
            },
            highlight_current_scope = {
                enable = false
            }
        }, 
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
