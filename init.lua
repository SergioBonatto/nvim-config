-- =============================================================================
-- init.lua — Entry point
-- =============================================================================

require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.autocmds")

vim.api.nvim_create_user_command("OneHalfMatteToggle", function()
	if vim.g.colors_name == "atomonedark_matte" then
		vim.cmd("colorscheme atomonelight_matte")
	else
		vim.cmd("colorscheme atomonedark_matte")
	end
end, {})
