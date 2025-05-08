-- General
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set('n','ne',"<esc><cmd>enew<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>qa!<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>")
vim.keymap.set("n", "|", "<cmd>vs<cr>")


vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ta", function()
  vim.cmd "!docker exec gf_back sh -c 'APP_ENV=test php vendor/bin/phpunit'"
end)

vim.keymap.set("n", "<leader>ct", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml %s'", file)
  vim.notify(command)
  vim.cmd(command)
end)
vim.keymap.set("n", "<leader>ta", function()
  vim.cmd "!docker exec gf_back sh -c 'APP_ENV=test php vendor/bin/phpunit'"
end)

vim.keymap.set("n", "<leader>ct", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml %s'", file)
  vim.notify(command)
  vim.cmd(command)
end)
vim.keymap.set("n", "<leader>psa", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml'", file)
  vim.notify(command)
  vim.cmd(command)
end)

-- Plugins
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>lr", function()
  require "inc_rename"
  return ":IncRename " .. vim.fn.expand "<cword>"
end)
