```bash
mkdir nvim-xan
cd nvim-xan
git init
git remote add -f origin git@github.com:nunzi00/xan-dotfiles.git
## to only retrieve partial repo
git sparse-checkout init
git sparse-checkout set 'config/nvim'

git checkout main
git pull

#link
ln -sf ~/Projects/nvim-xan/config/nvim ~/.config/nvim
```
