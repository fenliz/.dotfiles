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
    config = { "\27LJ\2\nê\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\rfiletype\rNvimTree\ttext\5\1\0\4\25enforce_regular_tabs\2\28show_buffer_close_icons\1\20show_close_icon\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
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
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
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
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\rnightfox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mapx.nvim"] = {
    config = { "\27LJ\2\nj\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\18user.mappings\1\0\2\vglobal\nforce\rwhichkey\2\nsetup\tmapx\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
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
    config = { "\27LJ\2\n›\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18€6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0î\1\0\1\3\3\6\0%-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\27€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\18€-\1\1\0009\1\4\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\5\1B\1\1\1X\1\t€-\1\2\0B\1\1\2\15\0\1\0X\2\3€\18\1\0\0B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\19expand_or_jump\23expand_or_jumpable\vexpand\15expandable\21select_next_item\fvisible\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire»\6\1\0\f\0002\0`6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0009\3\4\0005\5\v\0004\6\6\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\0065\a\n\0>\a\5\6=\6\f\0055\6\14\0005\a\r\0=\a\15\0066\a\0\0'\t\16\0B\a\2\0029\a\17\a=\a\17\6=\6\18\0055\6\21\0009\a\19\0009\a\20\aB\a\1\2=\a\22\0069\a\19\0009\a\23\aB\a\1\2=\a\24\0069\a\19\0009\a\25\a)\tüÿB\a\2\2=\a\26\0069\a\19\0009\a\25\a)\t\4\0B\a\2\2=\a\27\0069\a\19\0009\a\28\aB\a\1\2=\a\29\0069\a\19\0005\t\31\0009\n\19\0009\n\30\nB\n\1\2=\n \t9\n\19\0009\n!\nB\n\1\2=\n\"\tB\a\2\2=\a#\0069\a\19\0009\a$\a5\t%\0B\a\2\2=\a&\0069\a\19\0003\t'\0005\n(\0B\a\3\2=\a)\0069\a\19\0003\t*\0005\n+\0B\a\3\2=\a,\6=\6\19\0055\6.\0003\a-\0=\a/\6=\0060\5B\3\2\0016\3\0\0'\0051\0B\3\2\0012\0\0€K\0\1\0\"user.code-completion.snippets\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\31user.code-completion.utils\vfields\1\0\0\1\4\0\0\tabbr\tkind\tmenu\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nemoji\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\0\nsetup\19nvim-autopairs\fluasnip\bcmp\frequire\0" },
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
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16dap-install\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n@\0\2\5\0\3\0\a6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1K\0\1\0\14on_attach\15illuminate\frequireğ\2\1\1\a\0\17\0&6\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0005\2\a\0=\1\b\0023\3\n\0=\3\t\0029\3\v\0\a\3\f\0X\3\6€6\3\4\0'\5\r\0B\3\2\2\18\5\2\0B\3\2\1X\3\b€9\3\v\0\a\3\14\0X\3\5€6\3\4\0'\5\15\0B\3\2\2\18\5\2\0B\3\2\1\18\5\0\0009\3\16\0\18\6\2\0B\3\3\1K\0\1\0\nsetup'user.language-servers.configs.json\vjsonls&user.language-servers.configs.lua\16sumneko_lua\tname\0\14on_attach\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimî\v\1\0\v\0004\0x4\0\5\0005\1\0\0>\1\1\0005\1\1\0>\1\2\0005\1\2\0>\1\3\0005\1\3\0>\1\4\0006\1\4\0\18\3\0\0B\1\2\4X\4\n€6\6\5\0009\6\6\0069\6\a\0069\b\b\0055\t\t\0009\n\b\5=\n\n\t9\n\v\5=\n\v\tB\6\3\1E\4\3\3R\4ô6\1\5\0009\1\f\0019\1\r\0015\3\16\0005\4\14\0=\0\15\4=\4\17\0035\4\18\0=\4\19\3B\1\2\0016\1\20\0'\3\21\0B\1\2\0029\1\22\0013\3\23\0B\1\2\0016\1\20\0'\3\24\0B\1\2\0029\1\25\0015\3\26\0B\1\2\0016\1\20\0'\3\27\0B\1\2\0016\1\5\0009\1\28\0019\1\29\0015\2\31\0=\2\30\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4\"\0B\2\2\0029\2#\2=\2!\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2&\2=\2$\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2(\2=\2'\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2*\2=\2)\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2,\2=\2+\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2.\2=\2-\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\0040\0B\2\2\0029\0021\2=\2/\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\0040\0B\2\2\0029\0023\2=\0022\1K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\28textDocument/codeAction\rhandlers\1\26\0\0\bî˜’\bï”\bï”\bï”\bî›\bî›\bïƒ¨\bï°®\bï£–\bî˜¤\bï‘µ\bï¢Ÿ\bïƒŠ\bï Š\bï¬Œ\bîˆ«\bï…›\bïš\bï„•\bï…\bîˆ¬\bïƒŠ\bïƒ§\bï¬¦\bî˜\23CompletionItemKind\rprotocol\blsp*user.language-servers.configs.null-ls\1\0\1\16hint_enable\1\nsetup\18lsp_signature\0\20on_server_ready\23nvim-lsp-installer\frequire\nfloat\1\0\6\nstyle\fminimal\vborder\frounded\vheader\5\vprefix\5\vsource\valways\14focusable\1\nsigns\1\0\3\18severity_sort\2\14underline\2\21update_in_insert\2\vactive\1\0\0\vconfig\15diagnostic\ttext\vtexthl\1\0\1\nnumhl\5\tname\16sign_define\afn\bvim\vipairs\1\0\2\tname\23DiagnosticSignInfo\ttext\bï™\1\0\2\tname\23DiagnosticSignHint\ttext\bïš\1\0\2\tname\23DiagnosticSignWarn\ttext\bï±\1\0\2\tname\24DiagnosticSignError\ttext\bï—\0" },
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
    config = { "\27LJ\2\n†\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\tkeys\1\0\0\14telescope\1\0\0\6i\1\0\0\1\0\2\vselect\n<C-y>\npaste\t<CR>\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nï\2\0\0\f\0\20\0%6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\2\4\0005\4\6\0005\5\5\0=\5\a\0045\5\b\0005\6\16\0004\a\4\0005\b\t\0\18\t\1\0'\v\n\0B\t\2\2=\t\v\b>\b\1\a5\b\f\0\18\t\1\0'\v\r\0B\t\2\2=\t\v\b>\b\2\a5\b\14\0\18\t\1\0'\v\15\0B\t\2\2=\t\v\b>\b\3\a=\a\17\6=\6\18\5=\5\19\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\16parent_node\1\0\1\bkey\6h\tedit\1\0\1\bkey\6l\acb\vtabnew\1\0\1\bkey\6t\1\0\3\21hide_root_folder\2\16auto_resize\2\nwidth\3(\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÕ\2\0\0\a\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\4=\4\t\0035\4\n\0005\5\v\0=\5\6\4=\4\f\3B\1\2\1K\0\1\0\17textsubjects\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
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
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\rnightfox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\1\0B\0\2\1K\0\1\0\tload\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nï\2\0\0\f\0\20\0%6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\2\4\0005\4\6\0005\5\5\0=\5\a\0045\5\b\0005\6\16\0004\a\4\0005\b\t\0\18\t\1\0'\v\n\0B\t\2\2=\t\v\b>\b\1\a5\b\f\0\18\t\1\0'\v\r\0B\t\2\2=\t\v\b>\b\2\a5\b\14\0\18\t\1\0'\v\15\0B\t\2\2=\t\v\b>\b\3\a=\a\17\6=\6\18\5=\5\19\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\16parent_node\1\0\1\bkey\6h\tedit\1\0\1\bkey\6l\acb\vtabnew\1\0\1\bkey\6t\1\0\3\21hide_root_folder\2\16auto_resize\2\nwidth\3(\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÕ\2\0\0\a\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\4=\4\t\0035\4\n\0005\5\v\0=\5\6\4=\4\f\3B\1\2\1K\0\1\0\17textsubjects\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n@\0\2\5\0\3\0\a6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1K\0\1\0\14on_attach\15illuminate\frequireğ\2\1\1\a\0\17\0&6\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0005\2\a\0=\1\b\0023\3\n\0=\3\t\0029\3\v\0\a\3\f\0X\3\6€6\3\4\0'\5\r\0B\3\2\2\18\5\2\0B\3\2\1X\3\b€9\3\v\0\a\3\14\0X\3\5€6\3\4\0'\5\15\0B\3\2\2\18\5\2\0B\3\2\1\18\5\0\0009\3\16\0\18\6\2\0B\3\3\1K\0\1\0\nsetup'user.language-servers.configs.json\vjsonls&user.language-servers.configs.lua\16sumneko_lua\tname\0\14on_attach\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimî\v\1\0\v\0004\0x4\0\5\0005\1\0\0>\1\1\0005\1\1\0>\1\2\0005\1\2\0>\1\3\0005\1\3\0>\1\4\0006\1\4\0\18\3\0\0B\1\2\4X\4\n€6\6\5\0009\6\6\0069\6\a\0069\b\b\0055\t\t\0009\n\b\5=\n\n\t9\n\v\5=\n\v\tB\6\3\1E\4\3\3R\4ô6\1\5\0009\1\f\0019\1\r\0015\3\16\0005\4\14\0=\0\15\4=\4\17\0035\4\18\0=\4\19\3B\1\2\0016\1\20\0'\3\21\0B\1\2\0029\1\22\0013\3\23\0B\1\2\0016\1\20\0'\3\24\0B\1\2\0029\1\25\0015\3\26\0B\1\2\0016\1\20\0'\3\27\0B\1\2\0016\1\5\0009\1\28\0019\1\29\0015\2\31\0=\2\30\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4\"\0B\2\2\0029\2#\2=\2!\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2&\2=\2$\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2(\2=\2'\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2*\2=\2)\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2,\2=\2+\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\4%\0B\2\2\0029\2.\2=\2-\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\0040\0B\2\2\0029\0021\2=\2/\0016\1\5\0009\1\28\0019\1 \0016\2\20\0'\0040\0B\2\2\0029\0023\2=\0022\1K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\28textDocument/codeAction\rhandlers\1\26\0\0\bî˜’\bï”\bï”\bï”\bî›\bî›\bïƒ¨\bï°®\bï£–\bî˜¤\bï‘µ\bï¢Ÿ\bïƒŠ\bï Š\bï¬Œ\bîˆ«\bï…›\bïš\bï„•\bï…\bîˆ¬\bïƒŠ\bïƒ§\bï¬¦\bî˜\23CompletionItemKind\rprotocol\blsp*user.language-servers.configs.null-ls\1\0\1\16hint_enable\1\nsetup\18lsp_signature\0\20on_server_ready\23nvim-lsp-installer\frequire\nfloat\1\0\6\nstyle\fminimal\vborder\frounded\vheader\5\vprefix\5\vsource\valways\14focusable\1\nsigns\1\0\3\18severity_sort\2\14underline\2\21update_in_insert\2\vactive\1\0\0\vconfig\15diagnostic\ttext\vtexthl\1\0\1\nnumhl\5\tname\16sign_define\afn\bvim\vipairs\1\0\2\tname\23DiagnosticSignInfo\ttext\bï™\1\0\2\tname\23DiagnosticSignHint\ttext\bïš\1\0\2\tname\23DiagnosticSignWarn\ttext\bï±\1\0\2\tname\24DiagnosticSignError\ttext\bï—\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n›\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18€6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0î\1\0\1\3\3\6\0%-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\27€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\18€-\1\1\0009\1\4\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\5\1B\1\1\1X\1\t€-\1\2\0B\1\1\2\15\0\1\0X\2\3€\18\1\0\0B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\19expand_or_jump\23expand_or_jumpable\vexpand\15expandable\21select_next_item\fvisible\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire»\6\1\0\f\0002\0`6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0009\3\4\0005\5\v\0004\6\6\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\0065\a\n\0>\a\5\6=\6\f\0055\6\14\0005\a\r\0=\a\15\0066\a\0\0'\t\16\0B\a\2\0029\a\17\a=\a\17\6=\6\18\0055\6\21\0009\a\19\0009\a\20\aB\a\1\2=\a\22\0069\a\19\0009\a\23\aB\a\1\2=\a\24\0069\a\19\0009\a\25\a)\tüÿB\a\2\2=\a\26\0069\a\19\0009\a\25\a)\t\4\0B\a\2\2=\a\27\0069\a\19\0009\a\28\aB\a\1\2=\a\29\0069\a\19\0005\t\31\0009\n\19\0009\n\30\nB\n\1\2=\n \t9\n\19\0009\n!\nB\n\1\2=\n\"\tB\a\2\2=\a#\0069\a\19\0009\a$\a5\t%\0B\a\2\2=\a&\0069\a\19\0003\t'\0005\n(\0B\a\3\2=\a)\0069\a\19\0003\t*\0005\n+\0B\a\3\2=\a,\6=\6\19\0055\6.\0003\a-\0=\a/\6=\0060\5B\3\2\0016\3\0\0'\0051\0B\3\2\0012\0\0€K\0\1\0\"user.code-completion.snippets\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\31user.code-completion.utils\vfields\1\0\0\1\4\0\0\tabbr\tkind\tmenu\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nemoji\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\0\nsetup\19nvim-autopairs\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n†\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\tkeys\1\0\0\14telescope\1\0\0\6i\1\0\0\1\0\2\vselect\n<C-y>\npaste\t<CR>\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16dap-install\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: mapx.nvim
time([[Config for mapx.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\18user.mappings\1\0\2\vglobal\nforce\rwhichkey\2\nsetup\tmapx\frequire\0", "config", "mapx.nvim")
time([[Config for mapx.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nê\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\rfiletype\rNvimTree\ttext\5\1\0\4\25enforce_regular_tabs\2\28show_buffer_close_icons\1\20show_close_icon\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
