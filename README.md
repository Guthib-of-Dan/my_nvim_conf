# My personal NeoVim configuration 
> But I'll put here complete setup of pc for coding. 
It is suitable for WEB development (including react, tailwind, github actions), C++ development (but no debugger) and working in bare tty (linux without gui).
Plugins: lazy.nvim, tokyonight theme, native lsp, tree-sitter, telescope, harpoon.
I should notice that on Linux if you want to default colors then run NeoVim as follows:
"C=0 nvim ." - where "C" - environment variable meaning "COLORS"
## Setup on Windows
1) Get chocolatey https://www.liquidweb.com/blog/how-to-install-chocolatey-on-windows/ (powershell stage is enough)
2) Set up dependencies in powershell: "choco install git; choco install nodejs; choco install ripgrep; choco install fd; choco install neovim; choco install llvm"
3) Reload your terminal and get LSP servers for NeoVim with powershell or cmd: "npm install -g @tailwindcss/language-server gh-actions-language-server vscode-langservers-extracted typescript typescript-language-server"
3.5) I like using Bun as a package manager, so run: powershell -c "irm bun.sh/install.ps1|iex"
4) run "mkdir ~/AppData/Local/nvim; cd ~/AppData/Local/nvim; git clone https://github.com/Guthib-of-Dan/my_nvim_conf.git;"  
5) Install "MesloLGS NF" ttf files from some github and configure Windows Terminal (but if on Windows 10 - install it in Microsoft Store and then configure it)
6) If you want Tree-Sitter to work, install VisualStudio (or just get from somewhere C/C++ headers) and through :TSInstall command get needed syntax (like ":TSInstall typescript css javascript c++")
## Setup on Linux
1) different distros - different processes. Briefly, you should install "git, clangd, npm, fd, ripgrep (or rg), neovim".
2) Want Bun? "curl -fsSL https://bun.com/install | bash"
3) REPEAT STEP 3 FROM WINDOWS
4) run "mkdir ~/.config/nvim && cd ~/.config/nvim && git clone https://github.com/Guthib-of-Dan/my_nvim_conf.git"
5) ALMOST SAME AS STEP 5 ON WINDOWS, only that I use ghostty
6) SAME AS ON WINDOWS
