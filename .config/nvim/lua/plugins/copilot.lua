-- Make it not moan about <Tab>
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-O>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
