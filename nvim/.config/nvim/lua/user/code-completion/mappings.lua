inoremap("<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true }, "Copilot: Complete")
inoremap("<C-k>", "copilot#Next()", { silent = true, expr = true }, "Copilot: Next")
