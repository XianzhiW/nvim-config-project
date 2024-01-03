local success, telescope = pcall(require, "nvim-treesitter.configs")
if not success then
    print("WARNING: telescope not loaded.")
    return
end
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git/.*$", },
        border = true,
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}, -- termius being annoying
    },
    extensions = {
        file_browser = {
            -- use the "ivy" theme if you want
            dir_icon = ""
        },
    },


}
require("telescope").load_extension("file_browser")

local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "


keymap("n", "<leader>ff", ":Telescope live_grep hidden=true<CR>", term_opts)
keymap("n", "<leader>p", ":Telescope find_files hidden=true<CR>",
    term_opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", term_opts)

-- git-related
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", term_opts)
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", term_opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", term_opts)
