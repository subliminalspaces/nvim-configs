return {
'goolord/alpha-nvim', 
dependencies = {'nvim-tree/nvim-web-devicons'},
init = function ()
  require'alpha'.setup(require'alpha.themes.startify'.config)
end
}
