return {
  { "nvim-neotest/neotest-jest" },
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = function()
      local npm_executable_exists = function(name)
        local path = vim.fn.getcwd() .. "/node_modules/.bin/" .. name
        local ok = vim.loop.fs_stat(path)
        return ok
      end

      local adapters = {}

      if npm_executable_exists("jest") then
        table.insert(adapters, require("neotest-jest"))
      elseif npm_executable_exists("vitest") then
        table.insert(adapters, require("neotest-vitest"))
      end

      return {
        adapters = adapters,
      }
    end,
  },
}
