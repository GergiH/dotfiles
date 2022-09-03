# GergiH dotfiles

Totally random dotfiles, mostly default configs, recently Neovim is the only one used from these, rarely updated.

## Neovim

1. Copy the `init.vim` into `~/.config/nvim/` on Linux, or `~/AppData/Local/nvim/` on Windows
2. Install the Plugin Manager from `https://github.com/junegunn/vim-plug`
3. Run `:PlugInstall`
4. Run `:checkhealth telescope` and install the dependencies

![image](https://user-images.githubusercontent.com/30079559/188262512-be5abb27-ba59-4388-872f-4013885e058b.png)

(Font used in screenshot: [Rec Mono Casual](https://www.recursive.design/))

### Custom keybinds

- `Ctrl + /` - Comment toggle
- `Ctrl + m` - Format with Neoformat (not really working most of the time, better config needed prob.)
- `\ff` - Find file with Telescope
- `\fg` - Grep in files with Telescope
- `\fb` - Find buffer with Telescope

## kitty

Install the themes first from https://github.com/dexpota/kitty-themes
