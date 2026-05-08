-- =============================================================================
-- config/options.lua
-- =============================================================================

local opt = vim.opt

vim.g.mapleader = ","

-- =============================================================================
-- Core
-- =============================================================================

opt.encoding = "UTF-8"
opt.termguicolors = true

-- =============================================================================
-- Performance
-- =============================================================================

opt.synmaxcol = 200
opt.redrawtime = 10000
opt.updatetime = 200
opt.timeoutlen = 300

-- =============================================================================
-- File Handling
-- =============================================================================

opt.autoread = true
opt.history = 1000
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- =============================================================================
-- Search
-- =============================================================================

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.grepprg = "rg --vimgrep --smart-case --hidden"

-- =============================================================================
-- Completion
-- =============================================================================

opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}

-- =============================================================================
-- Editing
-- =============================================================================

opt.backspace = {
	"indent",
	"eol",
	"start",
}

opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- =============================================================================
-- UI
-- =============================================================================

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.colorcolumn = "90"

opt.wrap = true
opt.linebreak = true

opt.splitright = true
opt.splitbelow = true

opt.laststatus = 3
opt.showmode = false
opt.ruler = false

opt.fillchars = {
	vert = "¦",
	fold = " ",
	eob = " ",
}

-- =============================================================================
-- Wildmenu
-- =============================================================================

opt.path:append("**")

opt.wildignore:append({
	"*/node_modules/*",
	"*/dist/*",
	"*/build/*",
	"*/.git/*",
	"*.o",
	"*.pyc",
})

-- =============================================================================
-- Build
-- =============================================================================

opt.makeprg = "make"

opt.errorformat = {
	"%f:%l:%c: %t%*[^:]: %m",
	"%f:%l: %t%*[^:]: %m",
	"%f:%l:%c: %m",
	"%f:%l: %m",
}
