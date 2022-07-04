local telescope_finders = require("telescope.finders")
local entry_display = require("telescope.pickers.entry_display")

local displayer = entry_display.create({
  separator = " | ",
  items = {
    { width = 25 },
    { width = 30 },
    { remaining = true },
  },
})

local make_display = function(entry)
  local npm_script = entry.value
  return displayer({
    { npm_script.name },
    { npm_script.package or npm_script.path },
    { npm_script.content },
  })
end

local entry_maker = function(npm_script)
  return {
    value = npm_script,
    ordinal = npm_script.name,
    display = make_display,
  }
end

local M = {}

M.npm_script_finder = function(opts, npm_scripts)
  return telescope_finders.new_table({
    results = npm_scripts,
    entry_maker = entry_maker,
  })
end

return M
