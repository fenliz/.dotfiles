return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    lazy = false,
    keys = {
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Quick chat",
      },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix issue" },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code" },
      { "<leader>ad", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix diagnostics" },
    },
  },
}
