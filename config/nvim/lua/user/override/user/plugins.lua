local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end
lazy.setup({
"johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "fr", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
  },
}
  -- Harpoon
  {"theprimeagen/harpoon"}
)
