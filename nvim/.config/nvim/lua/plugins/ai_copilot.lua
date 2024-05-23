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
    opts = {
      prompts = {
        -- Code related prompts
        Explain = "Please explain how the following code works.",
        Review = "Please review the following code and provide suggestions for improvement.",
        Tests = "Please explain how the selected code works, then generate unit tests for it.",
        Refactor = "Please refactor the following code to improve its clarity and readability.",
        FixCode = "Please fix the following code to make it work as intended.",
        FixError = "Please explain the error in the following text and provide a solution.",
        BetterNamings = "Please provide better names for the following variables and functions.",
        -- Text related prompts
        Summarize = "Please summarize the following text.",
        Spelling = "Please correct any grammar and spelling errors in the following text.",
        Wording = "Please improve the grammar and wording of the following text.",
        Concise = "Please rewrite the following text to make it more concise.",
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "Prompts",
      },
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
    },
  },
}
