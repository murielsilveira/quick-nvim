#!/bin/bash
set -e

TMP_NVIM_DIR="$HOME/tmp/quick_nvim"
mkdir -p $TMP_NVIM_DIR

CONFIG_REPO="https://github.com/nvim-lua/kickstart.nvim"
CONFIG_DIR="$TMP_NVIM_DIR/kickstart.nvim"

# Download Neovim if not present
if [ ! -f "$TMP_NVIM_DIR/nvim.appimage" ]; then
    echo "Downloading Neovim..."
    curl -L -o "$TMP_NVIM_DIR/nvim.appimage" "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
    chmod u+x "$TMP_NVIM_DIR/nvim.appimage"
else
    echo "Neovim already downloaded."
fi

# Download kickstart config if not present
if [ ! -f "$CONFIG_DIR" ]; then
    echo "Downloading Neovim config..."
    git clone "$CONFIG_REPO" "$CONFIG_DIR"
else
    echo "Neovim config already present."
fi

# Create script to launch nvim with the custom config
LAUNCH_SCRIPT="$TMP_NVIM_DIR/nvim"
echo "#!/bin/bash" > "$LAUNCH_SCRIPT"
echo "$TMP_NVIM_DIR/nvim.appimage -u "$CONFIG_DIR/init.lua" \"\$@\"" >> "$LAUNCH_SCRIPT"
chmod u+x "$LAUNCH_SCRIPT"

echo ""
echo "Now run the following to use in your current session,"
echo "or permanently add to your PATH by placing it on your profile file (.bashrc, .zshrc):"
echo ""
echo "export PATH=\"$TMP_NVIM_DIR:\$PATH\""
echo ""
echo "nvim"
echo ""
