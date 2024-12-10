```bash



mkdir -p  ~/Projects/
cd ~/Projects/
git clone --no-checkout https://github.com/nunzi00/xan-dotfiles.git nvim-xan
cd nvim-xan
git sparse-checkout init --cone
git checkout main
git sparse-checkout set 'config/nvim'
git sparse-checkout set 'README.md'

#link
ln -sf ~/Projects/nvim-xan/config/nvim ~/.config/nvim
sudo npm install -g typescript-language-server typescript

bash ~/Projects/nvim-xan/config/nvim/dev

###################################################################3

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
sudo npm install -g typescript-language-server typescript

bash ~/Projects/nvim-xan/config/nvim/dev

```
