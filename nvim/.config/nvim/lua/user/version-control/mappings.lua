local mapx = require("mapx")

mapx.nname("<leader>g", "Git")

nnoremap("<leader>gg", ':lua require("user.terminal.utils").toggle_lazygit()<CR>', "<silent>", "Git: Browser")
nnoremap("<leader>gs", ':lua require("telescope.builtin").git_status()<CR>', "<silent>", "Git: Status")
nnoremap("<leader>gb", ':lua require("telescope.builtin").git_branches()<CR>', "<silent>", "Git: Branches")
nnoremap("<leader>gc", ':lua require("telescope.builtin").git_commits()<CR>', "<silent>", "Git: Commits")
nnoremap("<leader>gh", ':lua require("telescope.builtin").git_bcommits()<CR>', "<silent>", "Git: File history")
nnoremap("<leader>gS", ':lua require("telescope.builtin").git_stash()<CR>', "<silent>", "Git: Stashes")
nnoremap("<leader>gd", ':lua require("gitsigns").diffthis()<CR>', "<silent>", "Git: Diff current file")

nnoremap("ä", ':lua require("user.version-control.utils").go_to_next_hunk()<CR>', "<silent>", "Git: Next hunk")
nnoremap("ö", ':lua require("user.version-control.utils").go_to_prev_hunk()<CR>', "<silent>", "Git: Prev hunk")
