#!/usr/bin/env bash

start_dir=$PWD

if [[ -n "$ZPREZTODIR" ]]; then
  echo "=> Setting up prezto zsh shell"
  git clone --recursive https://github.com/joshniec/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^z*; do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile}"
  done
fi

dotfiles=(
  asdfrc
  chromaterm.yml
  gitconfig
  gitignore
  solargraph.yml
  starship.toml
  tflint.hcl
  tmux.conf
  tmux.conf.local
)

echo "=> Setting up symlinks to $HOME"
for dotfile in "${dotfiles[@]}"; do
  ln -s "$PWD/${dotfile}" "$HOME/.${dotfile}"
done

echo "=> Setting up vim config"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
ln -s "$PWD/my_configs.vim" "$HOME/.vim_runtime/my_configs.vim"
cd ~/.vim_runtime && python update_plugins.py
cd "$start_dir" || exit


echo "=> Setting up extra vim plugins"
git clone https://github.com/fatih/vim-go ~/.vim_runtime/my_plugins/vim-go
git clone https://github.com/hashivim/vim-terraform ~/.vim_runtime/my_plugins/vim-terraform
git clone https://github.com/cespare/vim-toml ~/.vim_runtime/my_plugins/vim-toml

echo "=> All done"
