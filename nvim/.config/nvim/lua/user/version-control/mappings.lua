local mapx = require("mapx")

mapx.nname("<leader>g", "Git")

nnoremap("<leader>gg", ":LazyGit<CR>", "Git: Browser")
nnoremap("<leader>gs", ':lua require("telescope.builtin").git_status()<CR>', "<silent>", "Git: Status")
nnoremap("<leader>gb", ':lua require("telescope.builtin").git_branches()<CR>', "<silent>", "Git: Branches")
nnoremap("<leader>gc", ':lua require("telescope.builtin").git_commits()<CR>', "<silent>", "Git: Commits")
nnoremap("<leader>gh", ':lua require("telescope.builtin").git_bcommits()<CR>', "<silent>", "Git: File history")
nnoremap("<leader>gS", ':lua require("telescope.builtin").git_stash()<CR>', "<silent>", "Git: Stashes")
