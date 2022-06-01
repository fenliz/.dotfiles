local o = vim.o
local g = vim.g

-- Code completion
o.completeopt = "menu,menuone,noselect,noinsert"

-- Faster completion
o.updatetime = 300

-- Copilot
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_tab_fallback = ""
