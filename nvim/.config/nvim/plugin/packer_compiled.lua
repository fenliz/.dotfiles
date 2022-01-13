-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\5\rfiletype\rNvimTree\15text_align\tleft\1\0\4\16diagnostics\rnvim_lsp\25enforce_regular_tabs\2\28show_buffer_close_icons\1\20show_close_icon\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¿\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\23disabled_filetypes\1\6\0\0\rNvimTree\17dapui_scopes\22dapui_breakpoints\17dapui_stacks\18dapui_watches\1\0\1\ntheme\rnightfox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mapx.nvim"] = {
    config = { "\27LJ\2\nj\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\18user.mappings\1\0\2\rwhichkey\2\vglobal\nforce\nsetup\tmapx\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
  },
  neogit = {
    config = { "\27LJ\2\nÆ\6\0\0\n\0+\0d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\a\0005\5\6\0=\5\b\4B\2\2\0016\2\0\0'\4\t\0B\2\2\0029\2\5\0025\4\n\0005\5\v\0=\5\f\0045\5\r\0005\6\15\0\18\a\1\0'\t\14\0B\a\2\2=\a\16\6\18\a\1\0'\t\17\0B\a\2\2=\a\18\6\18\a\1\0'\t\19\0B\a\2\2=\a\20\6\18\a\1\0'\t\21\0B\a\2\2=\a\22\6=\6\23\0055\6\25\0\18\a\1\0'\t\24\0B\a\2\2=\a\26\6\18\a\1\0'\t\27\0B\a\2\2=\a\28\6\18\a\1\0'\t\29\0B\a\2\2=\a\30\6\18\a\1\0'\t\29\0B\a\2\2=\a\31\6\18\a\1\0'\t \0B\a\2\2=\a!\6\18\a\1\0'\t\"\0B\a\2\2=\a#\6\18\a\1\0'\t$\0B\a\2\2=\a%\6\18\a\1\0'\t&\0B\a\2\2=\a'\6\18\a\1\0'\t(\0B\a\2\2=\a)\6\18\a\1\0'\t\14\0B\a\2\2=\a\16\6\18\a\1\0'\t\17\0B\a\2\2=\a\18\6\18\a\1\0'\t\19\0B\a\2\2=\a\20\6\18\a\1\0'\t\21\0B\a\2\2=\a\22\6=\6\f\5=\5*\4B\2\2\0019\2\5\0B\2\1\1K\0\1\0\17key_bindings\6R\18refresh_files\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\6l\t<cr>\17select_entry\6k\15prev_entry\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\2\15file_panel\1\0\1\nwidth\3#\1\0\1\18diff_binaries\1\rdiffview\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\22diffview_callback\20diffview.config\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\1\0B\0\2\1K\0\1\0\tload\rnightfox\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0Ó\1\0\1\3\3\6\0%-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\27Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\18Ä-\1\1\0009\1\4\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\5\1B\1\1\1X\1\tÄ-\1\2\0B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\19expand_or_jump\23expand_or_jumpable\vexpand\15expandable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire”\6\1\0\f\0003\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0009\3\4\0005\5\f\0004\6\a\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\0065\a\n\0>\a\5\0065\a\v\0>\a\6\6=\6\r\0055\6\15\0005\a\14\0=\a\16\0066\a\0\0'\t\17\0B\a\2\0029\a\18\a=\a\18\6=\6\19\0055\6\22\0009\a\20\0009\a\21\aB\a\1\2=\a\23\0069\a\20\0009\a\24\aB\a\1\2=\a\25\0069\a\20\0009\a\26\a)\t¸ˇB\a\2\2=\a\27\0069\a\20\0009\a\26\a)\t\4\0B\a\2\2=\a\28\0069\a\20\0009\a\29\aB\a\1\2=\a\30\0069\a\20\0005\t \0009\n\20\0009\n\31\nB\n\1\2=\n!\t9\n\20\0009\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\20\0009\a%\a5\t&\0B\a\2\2=\a'\0069\a\20\0003\t(\0005\n)\0B\a\3\2=\a*\0069\a\20\0003\t+\0005\n,\0B\a\3\2=\a-\6=\6\20\0055\6/\0003\a.\0=\a0\6=\0061\5B\3\2\0016\3\0\0'\0052\0B\3\2\0012\0\0ÄK\0\1\0\"user.code-completion.snippets\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\31user.code-completion.utils\vfields\1\0\0\1\4\0\0\tabbr\tkind\tmenu\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nemoji\1\0\1\tname\forgmode\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\0\nsetup\19nvim-autopairs\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\ndapui\frequire3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nclose\ndapui\frequire3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nclose\ndapui\frequire√\4\1\0\f\0\27\00076\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0029\0\3\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\5\0009\1\6\0009\1\a\0013\2\t\0=\2\b\0019\1\n\0009\1\v\0013\2\f\0=\2\b\0019\1\n\0009\1\r\0013\2\14\0=\2\b\0014\1\6\0005\2\15\0>\2\1\0015\2\16\0>\2\2\0015\2\17\0>\2\3\0015\2\18\0>\2\4\0015\2\19\0>\2\5\0016\2\20\0\18\4\1\0B\2\2\4X\5\bÄ6\a\21\0009\a\22\a9\a\23\a9\t\24\0065\n\26\0009\v\25\6=\v\25\nB\a\3\1E\5\3\3R\5ˆK\0\1\0\1\0\3\vtexthl\5\nnumhl\5\vlinehl\5\ttext\tname\16sign_define\afn\bvim\vipairs\1\0\2\ttext\b‚ñ∂\tname\15DapStopped\1\0\2\ttext\b‚óã\tname\26DapBreakpointRejected\1\0\2\ttext\b‚óâ\tname\16DapLogPoint\1\0\2\ttext\b‚óÜ\tname\27DapBreakpointCondition\1\0\2\ttext\b‚óè\tname\18DapBreakpoint\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\nsetup\16dap-install\bdap\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nﬁ\1\0\2\5\0\a\0\0146\2\0\0'\4\1\0B\2\2\2\18\4\1\0B\2\2\0019\2\2\0009\2\3\2\15\0\2\0X\3\4Ä6\2\4\0009\2\5\2'\4\6\0B\2\2\1K\0\1\0Cautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()\bcmd\bvim\24document_formatting\26resolved_capabilities*user.language-servers.buffer-mappings\frequireæ\4\1\1\a\0\22\0=6\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0025\2\a\0006\3\4\0'\5\5\0B\3\2\0029\3\6\3\18\5\1\0B\3\2\2=\3\b\0023\3\t\0=\3\n\0029\3\v\0\a\3\f\0X\3\6Ä6\3\4\0'\5\r\0B\3\2\2\18\5\2\0B\3\2\1X\3 Ä9\3\v\0\a\3\14\0X\3\6Ä6\3\4\0'\5\15\0B\3\2\2\18\5\2\0B\3\2\1X\3\23Ä9\3\v\0\a\3\16\0X\3\6Ä6\3\4\0'\5\17\0B\3\2\2\18\5\2\0B\3\2\1X\3\14Ä9\3\v\0\a\3\18\0X\3\vÄ6\3\4\0'\5\19\0B\3\2\2\18\5\0\0\18\6\2\0B\3\3\1\18\5\0\0009\3\20\0B\3\2\0012\0\0ÄK\0\1\0\18\5\0\0009\3\21\0\18\6\2\0B\3\3\1K\0\1\0\nsetup\19attach_buffers'user.language-servers.configs.rust\18rust_analyzer'user.language-servers.configs.json\vjsonls-user.language-servers.configs.typescript\rtsserver&user.language-servers.configs.lua\16sumneko_lua\tname\14on_attach\0\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimñ\a\1\0\4\0\31\0S6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0006\0\4\0'\2\23\0B\0\2\0016\0\4\0'\2\24\0B\0\2\0016\0\4\0'\2\25\0B\0\2\0029\0\26\0005\2\27\0B\0\2\0016\0\4\0'\2\28\0B\0\2\0029\0\29\0003\2\30\0B\0\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\1\0\1\16hint_enable\1\nsetup\18lsp_signature*user.language-servers.configs.null-ls&user.language-servers.diagnostics\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
    url = "https://github.com/RishabhRD/nvim-lsputils"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nÜ\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\tkeys\1\0\0\14telescope\1\0\0\6i\1\0\0\1\0\2\npaste\t<CR>\vselect\n<C-y>\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nm\0\0\4\0\5\0\f6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\vrender\fminimal\ftimeout\3–\15\nsetup\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÎ\3\0\0\f\0\26\0/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\4\0009\2\5\2)\3\1\0=\3\6\0026\2\4\0009\2\5\2)\3\1\0=\3\a\0029\2\b\0005\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0005\6\22\0004\a\4\0005\b\15\0\18\t\1\0'\v\16\0B\t\2\2=\t\17\b>\b\1\a5\b\18\0\18\t\1\0'\v\19\0B\t\2\2=\t\17\b>\b\2\a5\b\20\0\18\t\1\0'\v\21\0B\t\2\2=\t\17\b>\b\3\a=\a\23\6=\6\24\5=\5\25\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\16parent_node\1\0\1\bkey\6h\tedit\1\0\1\bkey\6l\acb\vtabnew\1\0\1\bkey\6t\1\0\3\16auto_resize\2\nwidth\3(\21hide_root_folder\2\16diagnostics\1\0\1\venable\2\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\27nvim_tree_quit_on_open$nvim_tree_disable_window_picker\6g\bvim\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÖ\3\0\0\a\0\14\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2B\1\1\0019\1\3\0005\3\4\0005\4\b\0005\5\5\0005\6\6\0=\6\a\5=\5\t\4=\4\n\0035\4\v\0005\5\f\0=\5\a\4=\4\r\3B\1\2\1K\0\1\0\17textsubjects\1\0\2\6;!textsubjects-container-outer\6.\23textsubjects-smart\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aaf\20@function.outer\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\1\0\2\14lookahead\2\venable\2\1\0\1\21ensure_installed\ball\nsetup$user.note-taking.syntax-parsing\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  orgmode = {
    config = { "\27LJ\2\nà\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16refactoring\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mapx.nvim
time([[Config for mapx.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\18user.mappings\1\0\2\rwhichkey\2\vglobal\nforce\nsetup\tmapx\frequire\0", "config", "mapx.nvim")
time([[Config for mapx.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nﬁ\1\0\2\5\0\a\0\0146\2\0\0'\4\1\0B\2\2\2\18\4\1\0B\2\2\0019\2\2\0009\2\3\2\15\0\2\0X\3\4Ä6\2\4\0009\2\5\2'\4\6\0B\2\2\1K\0\1\0Cautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()\bcmd\bvim\24document_formatting\26resolved_capabilities*user.language-servers.buffer-mappings\frequireæ\4\1\1\a\0\22\0=6\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0025\2\a\0006\3\4\0'\5\5\0B\3\2\0029\3\6\3\18\5\1\0B\3\2\2=\3\b\0023\3\t\0=\3\n\0029\3\v\0\a\3\f\0X\3\6Ä6\3\4\0'\5\r\0B\3\2\2\18\5\2\0B\3\2\1X\3 Ä9\3\v\0\a\3\14\0X\3\6Ä6\3\4\0'\5\15\0B\3\2\2\18\5\2\0B\3\2\1X\3\23Ä9\3\v\0\a\3\16\0X\3\6Ä6\3\4\0'\5\17\0B\3\2\2\18\5\2\0B\3\2\1X\3\14Ä9\3\v\0\a\3\18\0X\3\vÄ6\3\4\0'\5\19\0B\3\2\2\18\5\0\0\18\6\2\0B\3\3\1\18\5\0\0009\3\20\0B\3\2\0012\0\0ÄK\0\1\0\18\5\0\0009\3\21\0\18\6\2\0B\3\3\1K\0\1\0\nsetup\19attach_buffers'user.language-servers.configs.rust\18rust_analyzer'user.language-servers.configs.json\vjsonls-user.language-servers.configs.typescript\rtsserver&user.language-servers.configs.lua\16sumneko_lua\tname\14on_attach\0\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimñ\a\1\0\4\0\31\0S6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0006\0\4\0'\2\23\0B\0\2\0016\0\4\0'\2\24\0B\0\2\0016\0\4\0'\2\25\0B\0\2\0029\0\26\0005\2\27\0B\0\2\0016\0\4\0'\2\28\0B\0\2\0029\0\29\0003\2\30\0B\0\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\1\0\1\16hint_enable\1\nsetup\18lsp_signature*user.language-servers.configs.null-ls&user.language-servers.diagnostics\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\1\0B\0\2\1K\0\1\0\tload\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\tkeys\1\0\0\14telescope\1\0\0\6i\1\0\0\1\0\2\npaste\t<CR>\vselect\n<C-y>\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nÆ\6\0\0\n\0+\0d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\a\0005\5\6\0=\5\b\4B\2\2\0016\2\0\0'\4\t\0B\2\2\0029\2\5\0025\4\n\0005\5\v\0=\5\f\0045\5\r\0005\6\15\0\18\a\1\0'\t\14\0B\a\2\2=\a\16\6\18\a\1\0'\t\17\0B\a\2\2=\a\18\6\18\a\1\0'\t\19\0B\a\2\2=\a\20\6\18\a\1\0'\t\21\0B\a\2\2=\a\22\6=\6\23\0055\6\25\0\18\a\1\0'\t\24\0B\a\2\2=\a\26\6\18\a\1\0'\t\27\0B\a\2\2=\a\28\6\18\a\1\0'\t\29\0B\a\2\2=\a\30\6\18\a\1\0'\t\29\0B\a\2\2=\a\31\6\18\a\1\0'\t \0B\a\2\2=\a!\6\18\a\1\0'\t\"\0B\a\2\2=\a#\6\18\a\1\0'\t$\0B\a\2\2=\a%\6\18\a\1\0'\t&\0B\a\2\2=\a'\6\18\a\1\0'\t(\0B\a\2\2=\a)\6\18\a\1\0'\t\14\0B\a\2\2=\a\16\6\18\a\1\0'\t\17\0B\a\2\2=\a\18\6\18\a\1\0'\t\19\0B\a\2\2=\a\20\6\18\a\1\0'\t\21\0B\a\2\2=\a\22\6=\6\f\5=\5*\4B\2\2\0019\2\5\0B\2\1\1K\0\1\0\17key_bindings\6R\18refresh_files\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\6l\t<cr>\17select_entry\6k\15prev_entry\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\2\15file_panel\1\0\1\nwidth\3#\1\0\1\18diff_binaries\1\rdiffview\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\22diffview_callback\20diffview.config\rgitsigns\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\nà\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nm\0\0\4\0\5\0\f6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\vrender\fminimal\ftimeout\3–\15\nsetup\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nÍ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\5\rfiletype\rNvimTree\15text_align\tleft\1\0\4\16diagnostics\rnvim_lsp\25enforce_regular_tabs\2\28show_buffer_close_icons\1\20show_close_icon\1\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÎ\3\0\0\f\0\26\0/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\4\0009\2\5\2)\3\1\0=\3\6\0026\2\4\0009\2\5\2)\3\1\0=\3\a\0029\2\b\0005\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0005\6\22\0004\a\4\0005\b\15\0\18\t\1\0'\v\16\0B\t\2\2=\t\17\b>\b\1\a5\b\18\0\18\t\1\0'\v\19\0B\t\2\2=\t\17\b>\b\2\a5\b\20\0\18\t\1\0'\v\21\0B\t\2\2=\t\17\b>\b\3\a=\a\23\6=\6\24\5=\5\25\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\16parent_node\1\0\1\bkey\6h\tedit\1\0\1\bkey\6l\acb\vtabnew\1\0\1\bkey\6t\1\0\3\16auto_resize\2\nwidth\3(\21hide_root_folder\2\16diagnostics\1\0\1\venable\2\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\27nvim_tree_quit_on_open$nvim_tree_disable_window_picker\6g\bvim\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\ndapui\frequire3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nclose\ndapui\frequire3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nclose\ndapui\frequire√\4\1\0\f\0\27\00076\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0029\0\3\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\5\0009\1\6\0009\1\a\0013\2\t\0=\2\b\0019\1\n\0009\1\v\0013\2\f\0=\2\b\0019\1\n\0009\1\r\0013\2\14\0=\2\b\0014\1\6\0005\2\15\0>\2\1\0015\2\16\0>\2\2\0015\2\17\0>\2\3\0015\2\18\0>\2\4\0015\2\19\0>\2\5\0016\2\20\0\18\4\1\0B\2\2\4X\5\bÄ6\a\21\0009\a\22\a9\a\23\a9\t\24\0065\n\26\0009\v\25\6=\v\25\nB\a\3\1E\5\3\3R\5ˆK\0\1\0\1\0\3\vtexthl\5\nnumhl\5\vlinehl\5\ttext\tname\16sign_define\afn\bvim\vipairs\1\0\2\ttext\b‚ñ∂\tname\15DapStopped\1\0\2\ttext\b‚óã\tname\26DapBreakpointRejected\1\0\2\ttext\b‚óâ\tname\16DapLogPoint\1\0\2\ttext\b‚óÜ\tname\27DapBreakpointCondition\1\0\2\ttext\b‚óè\tname\18DapBreakpoint\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\nsetup\16dap-install\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0Ó\1\0\1\3\3\6\0%-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\27Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\18Ä-\1\1\0009\1\4\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\5\1B\1\1\1X\1\tÄ-\1\2\0B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\19expand_or_jump\23expand_or_jumpable\vexpand\15expandable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire”\6\1\0\f\0003\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0009\3\4\0005\5\f\0004\6\a\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\0065\a\n\0>\a\5\0065\a\v\0>\a\6\6=\6\r\0055\6\15\0005\a\14\0=\a\16\0066\a\0\0'\t\17\0B\a\2\0029\a\18\a=\a\18\6=\6\19\0055\6\22\0009\a\20\0009\a\21\aB\a\1\2=\a\23\0069\a\20\0009\a\24\aB\a\1\2=\a\25\0069\a\20\0009\a\26\a)\t¸ˇB\a\2\2=\a\27\0069\a\20\0009\a\26\a)\t\4\0B\a\2\2=\a\28\0069\a\20\0009\a\29\aB\a\1\2=\a\30\0069\a\20\0005\t \0009\n\20\0009\n\31\nB\n\1\2=\n!\t9\n\20\0009\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\20\0009\a%\a5\t&\0B\a\2\2=\a'\0069\a\20\0003\t(\0005\n)\0B\a\3\2=\a*\0069\a\20\0003\t+\0005\n,\0B\a\3\2=\a-\6=\6\20\0055\6/\0003\a.\0=\a0\6=\0061\5B\3\2\0016\3\0\0'\0052\0B\3\2\0012\0\0ÄK\0\1\0\"user.code-completion.snippets\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\31user.code-completion.utils\vfields\1\0\0\1\4\0\0\tabbr\tkind\tmenu\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nemoji\1\0\1\tname\forgmode\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\0\nsetup\19nvim-autopairs\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÖ\3\0\0\a\0\14\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2B\1\1\0019\1\3\0005\3\4\0005\4\b\0005\5\5\0005\6\6\0=\6\a\5=\5\t\4=\4\n\0035\4\v\0005\5\f\0=\5\a\4=\4\r\3B\1\2\1K\0\1\0\17textsubjects\1\0\2\6;!textsubjects-container-outer\6.\23textsubjects-smart\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aaf\20@function.outer\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\1\0\2\14lookahead\2\venable\2\1\0\1\21ensure_installed\ball\nsetup$user.note-taking.syntax-parsing\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¿\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\23disabled_filetypes\1\6\0\0\rNvimTree\17dapui_scopes\22dapui_breakpoints\17dapui_stacks\18dapui_watches\1\0\1\ntheme\rnightfox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
