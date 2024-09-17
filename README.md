```bash
mkdir -p  ~/Projects/nvim-xan
cd  ~/Projects/nvim-xan
git init
git remote add -f origin git@github.com:nunzi00/xan-dotfiles.git
git checkout main
git pull

## to only retrieve partial repo
git sparse-checkout init
git sparse-checkout set 'config/nvim'
git sparse-checkout set 'README.md'

#link
ln -sf ~/Projects/nvim-xan/config/nvim ~/.config/nvim
bash ~/home/lucas/Projects/nvim-xan/config/nvim/dev

sudo npm install -g typescript-language-server typescript
```
