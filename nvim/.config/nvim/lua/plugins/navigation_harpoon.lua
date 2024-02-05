local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values

  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = {
      {
        "<leader>hh",
        function()
          toggle_telescope(require("harpoon"):list())
        end,
        desc = "Find harpoon",
      },
      {
        "<leader>ha",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Add file to harpoon",
      },
    },
  },
}
