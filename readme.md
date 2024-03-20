# Quick Neovim

Run a temporary pre-configured Neovim instance anywhere you need, quickly.

`curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/murielsilveira/quick-nvim/main/install.sh | sh`

--

References:

- https://github.com/neovim/neovim/blob/master/INSTALL.md
- https://github.com/nvim-lua/kickstart.nvim

--

Initial notes:


Build a script that install NeoVim and configures it in a custom location, so I can quickly use my config in any machine very quickly.

Steps:

- Download and install `nvim` on a temp dir
- Download nvim config on the same temp dir
- Have an alias or script that loads `nvim` with that custom config location
- Add that custom script on PATH for the terminal session so `nvim` is available
- If the install script is run again, skip download and only update the PATH
