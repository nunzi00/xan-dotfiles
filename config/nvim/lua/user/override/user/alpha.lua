local alpha = require("alpha")
local startify = require("alpha.themes.startify")

startify.section.header.val = {
	"                                         ",
	"                                         ",
	"                                         ",
	"██╗░░░░░██╗░░░██╗░█████╗░░█████╗░░██████╗",
	"██║░░░░░██║░░░██║██╔══██╗██╔══██╗██╔════╝",
	"██║░░░░░██║░░░██║██║░░╚═╝███████║╚█████╗░",
	"██║░░░░░██║░░░██║██║░░██╗██╔══██║░╚═══██╗",
	"███████╗╚██████╔╝╚█████╔╝██║░░██║██████╔╝",
	"╚══════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░",
	"                                         ",
	"                                         ",
	"                                         ",
}
startify.config.opts.noautocmd = true
-- startify.config.opts.position = "right"
startify.config.opts.margin = 100

startify.section.top_buttons.val = {
	startify.button("e", "  New file", "<cmd>ene <CR>"),
    { type = "padding", val = 2 },
	{ type = "text", val = "Search ", opts = { hl = "SpecialComment", position = "center" } },
	{ type = "text", val = "-------------------------------------------------------------", opts = { hl = "SpecialComment", position = "center" } },
	startify.button("SPC f f", "󰈞  Find file"),
	startify.button("SPC f o", "󰊄  Recently opened files"),
	startify.button("SPC f g", "󰈬  Find word"),
}
startify.section.bottom_buttons.val = {
    { type = "padding", val = 4 },
	{ type = "text", val = "Sessions", opts = { hl = "SpecialComment", position = "center" } },
	{ type = "text", val = "-------------------------------------------------------------", opts = { hl = "SpecialComment", position = "center" } },
	startify.button("SPC s l", "  Open lasts sessions"),
    { type = "padding", val = 4 },
	{ type = "text", val = "-------------------------------------------------------------", opts = { hl = "SpecialComment", position = "center" } },
	startify.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
}
startify.section.mru.val = {}
startify.section.mru_cwd.val = {}

-- vim.cmd([[autocmd User AlphaReady echo 'Happy coding!!!']])

alpha.setup(startify.config)
