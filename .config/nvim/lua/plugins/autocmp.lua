-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
      snippet = {
           expand = function(args)
               luasnip.lsp_expand(args.body)
           end
      },
      mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm {
             behavior = cmp.ConfirmBehavior.Replace,
             select = true
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
      	   if cmp.visible() then
               cmp.select_next_item()
      	   elseif luasnip.expand_or_jumpable() then
               luasnip.expand_or_jump()
           else
               fallback()
           end
      end, {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
           if cmp.visible() then
               cmp.select_prev_item()
           elseif luasnip.jumpable(-1) then
               luasnip.jump(-1)
           else
               fallback()
           end
      end, {"i", "s"})
     }),
     sources = {{
         name = "nvim_lsp"
     }, {
         name = "luasnip"
     }, {
         name = "path"
     }, {
         name = "buffer",
         option = {
            -- Avoid accidentally running on big files
            get_bufnrs = function()
                local buf = vim.api.nvim_get_current_buf()
                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                if byte_size > 1024 * 1024 then -- 1 Megabyte max
                     return {}
                end
                return {buf}
            end
         }
     }}
  }
