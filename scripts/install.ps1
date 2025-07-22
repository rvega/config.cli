
choco install neovim git fzf fd nodejs

New-Item -ItemType SymbolicLink -Target C:\Users\admin\Cli\configs\neovim\nvim\ -Path C:\Users\admin\AppData\Local\nvim

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

New-Item -ItemType SymbolicLink -Target C:\Users\admin\Cli\configs\clang-format -Path C:\Users\admin\_clang-format
