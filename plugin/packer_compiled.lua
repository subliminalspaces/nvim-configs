-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/abhi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/abhi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/abhi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/abhi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/abhi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n=\0\1\4\0\3\0\0066\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0D\1\2\0\14calculate\16Comment.jsx\frequire˘\1\1\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0023\3\f\0=\3\r\2B\0\2\1K\0\1\0\rpre_hook\0\rmappings\1\0\2\nbasic\2\nextra\2\nextra\1\0\3\beol\bgcA\nabove\bgcO\nbelow\bgco\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nﬁ\6\0\0\a\0*\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\25\0005\5\22\0005\6\23\0=\6\24\5>\5\1\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \3=\3!\0025\3\"\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4#\0=\4\26\0035\4$\0=\4\28\0034\4\0\0=\4\30\0034\4\0\0=\4 \3=\3%\0024\3\0\0=\3&\0024\3\0\0=\3\n\0024\3\0\0=\3'\0025\3(\0=\3)\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\4\0\0\0\16diagnostics\rfilename\fsymbols\1\0\3\rmodified\6~\fremoved\6-\nadded\6+\1\2\1\0\tdiff\fcolored\2\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\15statusline\3Ë\a\vwinbar\3Ë\a\ftabline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\fmolokai\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\n\v\0\2\2\0\0\0\1K\0\1\0ß\1\1\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\roverride\0\flibrary\1\0\3\15pathStrict\2\14lspconfig\2\17setup_jsonls\2\1\0\4\ntypes\2\fplugins\2\fruntime\2\fenabled\2\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\nÒ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\fexclude\17extra_groups\1\a\0\0\23BufferLineTabClose\29BufferlineBufferSelected\19BufferLineFill\25BufferLineBackground\24BufferLineSeparator BufferLineIndicatorSelected\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nﬂ\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\a\0004\5\3\0005\6\5\0>\6\1\0055\6\6\0>\6\2\5=\5\b\4=\4\t\3=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2B\0\2\1K\0\1\0\bgit\1\0\5\17show_on_dirs\2\22show_on_open_dirs\2\venable\2\vignore\1\ftimeout\3ê\3\ffilters\1\0\1\rdotfiles\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\0\1\0\2\bkey\n<C-k>\vaction\n<NOP>\1\0\2\bkey\6u\vaction\vdir_up\1\0\1\18adaptive_size\2\1\0\1\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["smart-splits.nvim"] = {
    config = { "\27LJ\2\nç\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\19ignored_events\1\3\0\0\rBufEnter\rWinEnter\16resize_mode\nhooks\1\0\0\16resize_keys\1\5\0\0\6j\6k\6i\6l\1\0\2\rquit_key\n<ESC>\vsilent\1\21ignored_buftypes\1\2\0\0\rNvimTree\22ignored_filetypes\1\0\5\25move_cursor_same_row\1\19default_amount\3\n\17wrap_at_edge\2\21tmux_integration\1!disable_tmux_nav_when_zoomed\2\1\4\0\0\vnofile\rquickfix\vprompt\nsetup\17smart-splits\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¶\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n¿\2\0\0\5\0\f\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3\24\3\0\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15highlights\vNormal\1\0\0\1\0\2\abg\tnone\nguibg\tnone\tsize\fcolumns\6o\bvim\1\0\t\14direction\rvertical\17persist_mode\2\17persist_size\2\20start_in_insert\2\20shade_terminals\1\16auto_scroll\2\22terminal_mappings\2\20insert_mappings\2\17open_mapping\n<C-\\>\nsetup\15toggleterm\frequireÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tree-sitter-css"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-css",
    url = "https://github.com/tree-sitter/tree-sitter-css"
  },
  ["tree-sitter-diff"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-diff",
    url = "https://github.com/the-mikedavis/tree-sitter-diff"
  },
  ["tree-sitter-dockerfile"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-dockerfile",
    url = "https://github.com/camdencheek/tree-sitter-dockerfile"
  },
  ["tree-sitter-git-rebase"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-git-rebase",
    url = "https://github.com/the-mikedavis/tree-sitter-git-rebase"
  },
  ["tree-sitter-gitattributes"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-gitattributes",
    url = "https://github.com/ObserverOfTime/tree-sitter-gitattributes"
  },
  ["tree-sitter-gitcommit"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-gitcommit",
    url = "https://github.com/gbprod/tree-sitter-gitcommit"
  },
  ["tree-sitter-gitignore"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-gitignore",
    url = "https://github.com/shunsambongi/tree-sitter-gitignore"
  },
  ["tree-sitter-graphql"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-graphql",
    url = "https://github.com/bkegley/tree-sitter-graphql"
  },
  ["tree-sitter-html"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-html",
    url = "https://github.com/tree-sitter/tree-sitter-html"
  },
  ["tree-sitter-http"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-http",
    url = "https://github.com/rest-nvim/tree-sitter-http"
  },
  ["tree-sitter-javascript"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-javascript",
    url = "https://github.com/tree-sitter/tree-sitter-javascript"
  },
  ["tree-sitter-jsdoc"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-jsdoc",
    url = "https://github.com/tree-sitter/tree-sitter-jsdoc"
  },
  ["tree-sitter-json"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-json",
    url = "https://github.com/tree-sitter/tree-sitter-json"
  },
  ["tree-sitter-json5"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-json5",
    url = "https://github.com/Joakker/tree-sitter-json5"
  },
  ["tree-sitter-python"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-python",
    url = "https://github.com/tree-sitter/tree-sitter-python"
  },
  ["tree-sitter-regex"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-regex",
    url = "https://github.com/tree-sitter/tree-sitter-regex"
  },
  ["tree-sitter-sql"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-sql",
    url = "https://github.com/DerekStride/tree-sitter-sql"
  },
  ["tree-sitter-toml"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-toml",
    url = "https://github.com/ikatyang/tree-sitter-toml"
  },
  ["tree-sitter-typescript"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-typescript",
    url = "https://github.com/tree-sitter/tree-sitter-typescript"
  },
  ["tree-sitter-yaml"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/tree-sitter-yaml",
    url = "https://github.com/ikatyang/tree-sitter-yaml"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nŒ\5\0\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bÔëâ\thint\bÔ†µ\nerror\bÔôô\fwarning\bÔî©\nother\bÔ´†\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\nclose\6q\rprevious\6k\nhover\6K\vcancel\n<esc>\fpreview\6p\tnext\6j\frefresh\6r\19toggle_preview\6P\16toggle_mode\6m\1\0\15\14auto_fold\1\17auto_preview\2\15auto_close\1\14auto_open\1\17indent_lines\2\16fold_closed\bÔë†\14fold_open\bÔëº\rposition\vbottom\tmode\26workspace_diagnostics\nicons\2\nwidth\0032\vheight\3\n\25use_diagnostic_signs\1\fpadding\2\ngroup\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÉ\a\0\0\5\0.\00076\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\a\0005\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\0025\3\14\0=\3\15\0024\3\0\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0005\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\28\0005\4\27\0=\4\29\0035\4\30\0=\4\31\3=\3 \0025\3!\0=\3\"\0025\3$\0005\4#\0=\4%\0035\4&\0=\4'\3=\3(\0025\3)\0004\4\0\0=\4*\0035\4+\0=\4,\3=\3-\2B\0\2\1K\0\1\0\fdisable\14filetypes\1\2\0\0\20TelescopePrompt\rbuftypes\1\0\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\vborder\tnone\rwinblend\3\0\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\1\0\3\14separator\b‚ûú\ngroup\6+\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\4\19ignore_missing\1\14show_help\2\14show_keys\2\rtriggers\tauto\fpresets\1\0\a\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\17text_objects\2\fmotions\2\rspelling\1\0\2\16suggestions\3\20\fenabled\1\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/home/abhi/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n¿\2\0\0\5\0\f\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3\24\3\0\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15highlights\vNormal\1\0\0\1\0\2\abg\tnone\nguibg\tnone\tsize\fcolumns\6o\bvim\1\0\t\14direction\rvertical\17persist_mode\2\17persist_size\2\20start_in_insert\2\20shade_terminals\1\16auto_scroll\2\22terminal_mappings\2\20insert_mappings\2\17open_mapping\n<C-\\>\nsetup\15toggleterm\frequireÁÃô≥\6≥ÊÃ˛\3\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nﬂ\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\a\0004\5\3\0005\6\5\0>\6\1\0055\6\6\0>\6\2\5=\5\b\4=\4\t\3=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2B\0\2\1K\0\1\0\bgit\1\0\5\17show_on_dirs\2\22show_on_open_dirs\2\venable\2\vignore\1\ftimeout\3ê\3\ffilters\1\0\1\rdotfiles\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\0\1\0\2\bkey\n<C-k>\vaction\n<NOP>\1\0\2\bkey\6u\vaction\vdir_up\1\0\1\18adaptive_size\2\1\0\1\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\2\2\0\0\0\1K\0\1\0ß\1\1\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\roverride\0\flibrary\1\0\3\15pathStrict\2\14lspconfig\2\17setup_jsonls\2\1\0\4\ntypes\2\fplugins\2\fruntime\2\fenabled\2\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n=\0\1\4\0\3\0\0066\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0D\1\2\0\14calculate\16Comment.jsx\frequire˘\1\1\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0023\3\f\0=\3\r\2B\0\2\1K\0\1\0\rpre_hook\0\rmappings\1\0\2\nbasic\2\nextra\2\nextra\1\0\3\beol\bgcA\nabove\bgcO\nbelow\bgco\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\nÒ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\fexclude\17extra_groups\1\a\0\0\23BufferLineTabClose\29BufferlineBufferSelected\19BufferLineFill\25BufferLineBackground\24BufferLineSeparator BufferLineIndicatorSelected\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nﬁ\6\0\0\a\0*\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\25\0005\5\22\0005\6\23\0=\6\24\5>\5\1\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \3=\3!\0025\3\"\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4#\0=\4\26\0035\4$\0=\4\28\0034\4\0\0=\4\30\0034\4\0\0=\4 \3=\3%\0024\3\0\0=\3&\0024\3\0\0=\3\n\0024\3\0\0=\3'\0025\3(\0=\3)\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\4\0\0\0\16diagnostics\rfilename\fsymbols\1\0\3\rmodified\6~\fremoved\6-\nadded\6+\1\2\1\0\tdiff\fcolored\2\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\15statusline\3Ë\a\vwinbar\3Ë\a\ftabline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\fmolokai\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: smart-splits.nvim
time([[Config for smart-splits.nvim]], true)
try_loadstring("\27LJ\2\nç\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\19ignored_events\1\3\0\0\rBufEnter\rWinEnter\16resize_mode\nhooks\1\0\0\16resize_keys\1\5\0\0\6j\6k\6i\6l\1\0\2\rquit_key\n<ESC>\vsilent\1\21ignored_buftypes\1\2\0\0\rNvimTree\22ignored_filetypes\1\0\5\25move_cursor_same_row\1\19default_amount\3\n\17wrap_at_edge\2\21tmux_integration\1!disable_tmux_nav_when_zoomed\2\1\4\0\0\vnofile\rquickfix\vprompt\nsetup\17smart-splits\frequire\0", "config", "smart-splits.nvim")
time([[Config for smart-splits.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nÉ\a\0\0\5\0.\00076\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\a\0005\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\0025\3\14\0=\3\15\0024\3\0\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0005\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\28\0005\4\27\0=\4\29\0035\4\30\0=\4\31\3=\3 \0025\3!\0=\3\"\0025\3$\0005\4#\0=\4%\0035\4&\0=\4'\3=\3(\0025\3)\0004\4\0\0=\4*\0035\4+\0=\4,\3=\3-\2B\0\2\1K\0\1\0\fdisable\14filetypes\1\2\0\0\20TelescopePrompt\rbuftypes\1\0\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\vborder\tnone\rwinblend\3\0\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\1\0\3\14separator\b‚ûú\ngroup\6+\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\4\19ignore_missing\1\14show_help\2\14show_keys\2\rtriggers\tauto\fpresets\1\0\a\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\17text_objects\2\fmotions\2\rspelling\1\0\2\16suggestions\3\20\fenabled\1\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nŒ\5\0\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bÔëâ\thint\bÔ†µ\nerror\bÔôô\fwarning\bÔî©\nother\bÔ´†\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\nclose\6q\rprevious\6k\nhover\6K\vcancel\n<esc>\fpreview\6p\tnext\6j\frefresh\6r\19toggle_preview\6P\16toggle_mode\6m\1\0\15\14auto_fold\1\17auto_preview\2\15auto_close\1\14auto_open\1\17indent_lines\2\16fold_closed\bÔë†\14fold_open\bÔëº\rposition\vbottom\tmode\26workspace_diagnostics\nicons\2\nwidth\0032\vheight\3\n\25use_diagnostic_signs\1\fpadding\2\ngroup\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
