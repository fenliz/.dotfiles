return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<c-l>",
          next = "<C-k>",
          prev = "<C-j>",
        },
      },
    },
  },
  {
    "jellydn/CopilotChat.nvim",
    dependencies = { "zbirenbaum/copilot.lua" }, -- Or { "github/copilot.vim" }
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
    },
    build = function()
      -- Needs these commands:
      -- pip install python-dotenv requests pynvim==0.5.0 prompt-toolkit
      -- pip install tiktoken (optional for displaying prompt token counts)
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
    },
  },
}
