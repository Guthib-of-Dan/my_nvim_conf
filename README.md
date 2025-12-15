# My personal NeoVim configuration 
> But I'll put here complete setup of pc for coding. 
It is suitable for WEB development (including react, tailwind, github actions, docker, python), C++ development (but no debugger) and working in bare tty (linux without gui).
Plugins: lazy.nvim, tokyonight theme, native lsp, tree-sitter, telescope, harpoon.
I should notice that on Linux if you want to default colors then run NeoVim as follows:
"C=0 nvim ." - where "C" - environment variable meaning "COLORS"
## Setup on Windows
0) for C++ development and tree-sitter it is recommended to have Visual Studio installed.
1) Get chocolatey https://www.liquidweb.com/blog/how-to-install-chocolatey-on-windows/ (powershell stage is enough)
2) Set up dependencies in powershell: "choco install git nodejs python ripgrep fd neovim llvm go;"
2.1) Set up docker. "choco install docker-desktop" (this installation may freeze, so after several minutes you can just Ctrl+C and go to Program Files/Docker/Docker/Docker Desktop.exe). "choco install docker-cli"
3) Reload your terminal and get LSP servers for NeoVim with powershell or cmd: "npm install -g @tailwindcss/language-server gh-actions-language-server vscode-langservers-extracted typescript typescript-language-server yaml-language-server dockerfile-language-server-nodejs basedpyright"
3.5) I like using Bun as a package manager, so run: powershell -c "irm bun.sh/install.ps1|iex"
4) run "mkdir ~/AppData/Local/nvim; cd ~/AppData/Local/nvim; git clone https://github.com/Guthib-of-Dan/my_nvim_conf.git ."  
5) Install "MesloLGS NF" ttf files from some github and configure Windows Terminal (but if on Windows 10 - install it in Microsoft Store and then configure it)
6) If you want Tree-Sitter to work, install VisualStudio (or just get from somewhere C/C++ headers) and through :TSInstall command get needed syntax (like ":TSInstall typescript css javascript c++")
## Setup on Linux
1) different distros - different processes. Briefly, you should install "git, clangd, npm, fd, ripgrep (or rg), neovim".
2) Want Bun? "curl -fsSL https://bun.com/install | bash"
3) REPEAT STEP 3 FROM WINDOWS
4) run "mkdir ~/.config/nvim && cd ~/.config/nvim && git clone https://github.com/Guthib-of-Dan/my_nvim_conf.git ."
5) ALMOST SAME AS STEP 5 ON WINDOWS, only that I use ghostty
6) SAME AS ON WINDOWS

# Neovim keybinds / commands I usually use
> Note: To the left I write editor's mode: i - insert, r - replace, e - explorer netrw, v - visual, t(x) - x is mode before and t is terminal. Also x = any mode;
## Folding
n zR - unfold all folds in file recursively;  
n zM - fold all folds in file recursively;  
n zr - unfold all folds in file one level;  
n zm - fold all folds in file one level;  
n zo - unfold code under cursor one level;  
n zO - unfold code under cursor recursively;  
n zc - fold code under cursor one level;  
n zC - fold code under cursor recursively;  
n za - toggle fold under cursor one level;  
n zA - toggle fold under cursor recursively;  

## Mode switching, writing, quitting, panes
n i - Insert mode;  
n v - Visual mode;  
n V - visual line (best way to find cursor);  
x Escape - get to normal mode;  
i Insert - Replace mode;  
r Insert - Insert mode;  
n :Ex - Explorer netrw in same directory;  
e % - new file  
e D - delete file/folder recursively under cursor;  
e R - rename file;  
e '-' - one firectory above (minus sign);  
n :e ... - enter file/folder, adjacent to working directory of NeoVim;  
n :ter - turn current pane into terminal with normal mode;  
t(n) i - Insert mode;  
n or t(n) :q - gracefully close current pane;  
n or t(n) :q! - forcefully close current pane with dropping unsaved changes;  
n :w - save file;  
n :new - create new horizontal pane;  
n :vnew - create new vertical pane;  
n Ctrl+w (and arrow up/down/right/left) - switch to pane on the side, where chosen arrow points;  

## Editing, moving in file
n a - insert mode, but move one symbol to right;  
n A - insert mode, but move to the end of line;  
n I - insert mode, but move to the start of line;  
n s - insert mode, but remove symbol under cursor  
v s - insert mode, but remove all selected symbols;  
n S - insert mode, but remove whole line;  
n gg - move to file start;  
n G - move to file end;  
n f(something) - move cursor to (something) - one symbol;  
n dd - delete whole line;  
n df(something) - delete up to (something) - one symbol;  
n 0 (as zero) - move to line beginning;  
n ^ - move to first non-whitespace symbol in line;  
n $ - move to line end;  
n w - move to next word (special symbols also count as stop points);  
n dw - delete everything up to next word;  
n diW - delete evrything around cursor up to whitespaces;  
n viW - select everything around cursor up to whitespaces;  
n o - create new line below cursor and go to insert mode there;  
n O - create new line above cursor and go to insert mode there;  
n zz - move pane (not pane!), so that cursor was in the middle of it;  
n Ctrl+d - scroll one height of pane to bottom;  
n Ctrl+u - scroll one height of pane to top;  
n u - undo last change (like Ctrl+z in vscode);  
n Ctrl+r - undo undone change (like Ctrl+y in vscode);  
n /(pattern) - highlight pattern in file;  
n n - move to next highlighted occurence;  
n N - move to previous highlighted occurence;  
:noh - unhighlight highlighted text;  
v :s/(phrase)/(replacement) - replace within selected text (phrase) with (replacement)  
n x - delete one symbol under cursor;  
n qq - record all commands used afterwards. To stop - press q;  
n Q - use all recorded commands on the current line;  

## Copy-paste
v y - copy selected text;  
v p - paste after cursor;  
v P - paste before cursor  
v "+y - copy selected text to system clipboard  
n "+p - paste after cursor from global clipboard;  
n "+P - paste before cursor from global clipboard;  

## Plugins and lsp-specific commands
n (space)ff - find files in current working directory;  
n (space)fh - find help;  
n (space)fy - find help;  
n (space)ht - toggle harpoon;  
n (space)ha - add current file to harpoon;  
n Ctrl+] - go to definition of keyword under cursor;  
n Ctrl+t - get back from definition as a result of Ctrl+];  
n grn - rename keyword under cursor;  
n gra - action for current "problem", given by lsp;  
n Ctrl+x Ctrl+o - omnicompletion;  
n Ctrl+x Ctrl+p - buffer completion;  
n Ctrl+x Ctrl+f - filename completion;  
i Ctrl+k - completion within some language structure (like function body, javascript object properties)  
n K - get description popup about under-cursor keyword;  
Ctrl+q - visual block;  
