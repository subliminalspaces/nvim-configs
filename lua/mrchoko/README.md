
cd to your nvim config folder
mkdir a lua folder
mkdir a lua/<name> folder
clone this into your <name> folder
Require your <name> folder in your ~/.config/nvim/init.lua file.
In your ~/.config/nvim/lua/<name>/init.lua file, change all the requires to your <name>


require("<name>")

