-- =============================================================================
-- config/keymaps.lua
-- =============================================================================

local map = vim.keymap.set

local opts = {
	silent = true,
	noremap = true,
}

vim.g.mapleader = ","
-- =============================================================================
-- Window Navigation
-- =============================================================================

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- =============================================================================
-- Window Resize
-- =============================================================================

map("n", "<Left>", "<CMD>vertical resize -4<CR>", opts)
map("n", "<Right>", "<CMD>vertical resize +4<CR>", opts)
map("n", "<Up>", "<CMD>resize +2<CR>", opts)
map("n", "<Down>", "<CMD>resize -2<CR>", opts)

-- =============================================================================
-- Editing
-- =============================================================================

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "U", "<C-r>", opts)

map("v", "<S-s>", ":sort<CR>", opts)

map("n", "m", "%", opts)

map("n", "(", "<<", opts)
map("n", ")", ">>", opts)

-- =============================================================================
-- Oil.nvim
-- =============================================================================

map("n", "<C-a>", "<CMD>Neotree toggle filesystem reveal left<CR>", opts)

-- =============================================================================
-- fzf-lua
-- =============================================================================

map("n", "<C-p>", function()
	require("fzf-lua").files()
end, opts)

map("n", "<leader>b", function()
	require("fzf-lua").buffers()
end, opts)

map("n", "<leader>rg", function()
	require("fzf-lua").live_grep()
end, opts)

map("n", "<leader>ff", function()
	require("fzf-lua").resume()
end, opts)

map("n", "<leader>gs", function()
	require("fzf-lua").git_status()
end, opts)

map("n", "<leader>gc", function()
	require("fzf-lua").git_commits()
end, opts)

map("n", "<leader>sd", function()
	require("fzf-lua").lsp_document_symbols()
end, opts)

map("n", "<leader>sw", function()
	require("fzf-lua").lsp_workspace_symbols()
end, opts)

-- =============================================================================
-- Comment.nvim
-- =============================================================================
-- map("n", "!", function()
--   require("Comment.api").toggle.linewise.current()
-- end, opts)
--
-- map("v", "!", function()
--   vim.api.nvim_feedkeys(
--     vim.api.nvim_replace_termcodes(
--       "<ESC>",
--       true,
--       false,
--       true
--     ),
--     "nx",
--     false
--   )
--
--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
-- end, opts)
--
-- map({ "n", "v" }, "<leader>/", function()
--   require("Comment.api").toggle.linewise.current()
-- end, opts)
--
-- map({ "n", "v" }, "<leader>c", function()
--   require("Comment.api").toggle.linewise.current()
-- end, opts)
-- Normal mode, current line.
map("n", "!", function()
	require("Comment.api").toggle.linewise.current()
end, opts)

-- Visual mode, selected block.
map("v", "!", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

-- Leader Mappings - Separados para funcionar em ambos os casos:
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, opts)
map("n", "<leader>c", function()
	require("Comment.api").toggle.linewise.current()
end, opts)

map("v", "<leader>/", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

map("v", "<leader>c", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)
-- =============================================================================
-- Build / Quickfix
-- =============================================================================

map("n", "<F5>", "<CMD>make<CR>", opts)

map("n", "<F6>", "<CMD>copen<CR>", opts)

map("n", "<F7>", "<CMD>cnext<CR>", opts)

map("n", "<F10>", "<CMD>cprev<CR>", opts)

-- =============================================================================
-- Aerial
-- =============================================================================

map("n", "<F8>", "<CMD>AerialToggle!<CR>", opts)

-- =============================================================================
-- Run Binary
-- =============================================================================

map("n", "<F9>", "<CMD>!./main<CR>", opts)

-- =============================================================================
-- LSP
-- =============================================================================

map("n", "gd", vim.lsp.buf.definition, opts)

map("n", "gr", vim.lsp.buf.references, opts)

map("n", "gi", vim.lsp.buf.implementation, opts)

map("n", "<leader>lh", vim.lsp.buf.hover, opts)

map("n", "<leader>rn", vim.lsp.buf.rename, opts)

map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

map("n", "[d", vim.diagnostic.goto_prev, opts)

map("n", "]d", vim.diagnostic.goto_next, opts)

map("n", "<leader>fm", function()
	vim.lsp.buf.format({
		async = true,
	})
end, opts)

map("n", "<leader>d", vim.lsp.buf.definition, opts)

map("n", "<leader>u", "<C-t>", opts)

-- =============================================================================
-- Diagnostics
-- =============================================================================

map("n", "<leader>xx", function()
	vim.diagnostic.setloclist()
end, opts)

-- =============================================================================
-- Terminal
-- =============================================================================

map("t", "<ESC>", [[<C-\><C-n>]], opts)

map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

-- =============================================================================
-- Quick Save / Quit
-- =============================================================================

map("n", "<leader>w", "<CMD>w<CR>", opts)

map("n", "<leader>q", "<CMD>q<CR>", opts)

map("n", "<leader>x", "<CMD>x<CR>", opts)

-- =============================================================================
-- External Tools
-- =============================================================================

map("n", "<leader>k", "<CMD>!kindcoder<CR>", opts)

map("n", "<leader>t", "<CMD>!ts-deps<CR>", opts)

map("n", "<leader>h", "<CMD>!holefill % %<CR>", opts)

map("n", "<leader>f", "<CMD>!refactor %<CR>", opts)

map("n", "<leader>s", "<CMD>!chatsh<CR>", opts)

map("n", "<leader>a", "<CMD>!agda2kind %<CR>", opts)

-- =============================================================================
-- Silicon
-- =============================================================================

map("x", "P", "<CMD>Silicon<CR>", opts)

map("x", "<leader>p", "<CMD>Silicon!<CR>", opts)

-- =============================================================================
-- Movement
-- =============================================================================
-- Jump to the next or previous non-empty code block.
local function smart_jump(direction)
	local step = direction == "down" and 1 or -1
	local total = vim.fn.line("$")
	local cur = vim.fn.line(".")

	local function is_blank(n)
		return vim.fn.getline(n):match("^%s*$") ~= nil
	end

	local target = cur + step

	if is_blank(cur) then
		-- From a blank line, jump to the next line with content.
		while target >= 1 and target <= total and is_blank(target) do
			target = target + step
		end
	else
		-- From a block, jump after the next blank-line separator.
		local found_blank = false
		while target >= 1 and target <= total do
			if is_blank(target) then
				found_blank = true
			elseif found_blank then
				break
			end
			target = target + step
		end
	end

	target = math.max(1, math.min(total, target))
	vim.cmd("normal! " .. target .. "G")
end

map({ "n", "v" }, "<S-j>", function()
	smart_jump("down")
end, opts)
map({ "n", "v" }, "<S-k>", function()
	smart_jump("up")
end, opts)

-- S-h / S-l: WORD motion, more aggressive than b/e.
map({ "n", "v" }, "<S-h>", "B", opts)
map({ "n", "v" }, "<S-l>", "W", opts)
