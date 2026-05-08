-- =============================================================================
-- config/autocmds.lua
-- =============================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- =============================================================================
-- Auto Reload
-- =============================================================================

autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = augroup("AutoRead", { clear = true }),
	pattern = "*",
	command = "checktime",
})

-- =============================================================================
-- C / C++
-- =============================================================================

autocmd("FileType", {
	group = augroup("CSettings", { clear = true }),
	pattern = { "c", "cpp", "h" },
	callback = function()
		vim.opt_local.cindent = true

		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = false

		vim.opt_local.textwidth = 90
		vim.opt_local.colorcolumn = "80"

		vim.opt_local.formatoptions:remove({ "c", "r", "o" })

		if vim.fn.filereadable("build.sh") == 1 then
			vim.opt_local.makeprg = "./build.sh"
		else
			vim.opt_local.makeprg = "make"
		end
	end,
})

-- =============================================================================
-- JS / TS
-- =============================================================================

autocmd("FileType", {
	group = augroup("JSSettings", { clear = true }),
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- =============================================================================
-- Agda
-- =============================================================================

autocmd("FileType", {
	group = augroup("AgdaSettings", { clear = true }),
	pattern = "agda",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- =============================================================================
-- Custom Filetypes
-- =============================================================================

autocmd({ "BufNewFile", "BufRead" }, {
	group = augroup("CustomFT", { clear = true }),
	pattern = "*.phi",
	command = "setlocal filetype=phi",
})

-- =============================================================================
-- LSP Keymaps
-- =============================================================================

autocmd("LspAttach", {
	group = augroup("LspKeymaps", { clear = true }),
	callback = function(args)
		local map = vim.keymap.set
		local opts = {
			buffer = args.buf,
			silent = true,
		}

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "<leader>lh", vim.lsp.buf.hover, opts)

		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		map("n", "[d", vim.diagnostic.goto_prev, opts)
		map("n", "]d", vim.diagnostic.goto_next, opts)
	end,
})
