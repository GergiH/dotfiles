# GergiH dotfiles

Totally random dotfiles, mostly default configs, recently Neovim is the only one used from these, rarely updated.

## Neovim

1. Copy the contents of `nvim` into `~/.config/nvim/` on Linux, or `~/AppData/Local/nvim/` on Windows
2. Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart)
3. Install Node.js
4. Install C Compiler with `sudo apt install build-essential`
3. Run `:PackerSync`
4. Run `:checkhealth telescope` and install the dependencies

![image](https://user-images.githubusercontent.com/30079559/188262512-be5abb27-ba59-4388-872f-4013885e058b.png)

(Font used in screenshot: [Rec Mono Casual](https://www.recursive.design/))

### Custom keybinds

- `gc` - Comment toggle
- `\ff` - Find file with Telescope
- `\fg` - Grep in files with Telescope
- `\fb` - Find buffer with Telescope

## kitty

Install the themes first from https://github.com/dexpota/kitty-themes
