local U = require("onehalfmatte.util")

local M = {}

function M.apply(p)
	local bg_alt = p.bg_alt or p.ui
	local bg_soft = p.bg_soft or p.cursorline
	local border = p.border or p.ui
	local fg_soft = p.fg_soft or p.comment

	-- base
	U.h("Normal", { fg = p.fg, bg = p.bg })
	U.h("NormalNC", { fg = p.fg, bg = p.bg })
	U.h("Cursor", { fg = p.bg, bg = p.fg })
	U.h("CursorLine", { bg = p.cursorline })
	U.h("CursorColumn", { bg = p.cursorline })
	U.h("ColorColumn", { bg = bg_soft })

	U.h("LineNr", { fg = p.gutter, bg = p.bg })
	U.h("CursorLineNr", { fg = p.func, bg = p.cursorline })
	U.h("SignColumn", { fg = p.gutter, bg = p.bg })
	U.h("FoldColumn", { fg = p.gutter, bg = p.bg })
	U.h("Folded", { fg = fg_soft, bg = bg_alt })
	U.h("EndOfBuffer", { fg = p.bg, bg = p.bg })

	U.h("VertSplit", { fg = border, bg = p.bg })
	U.h("WinSeparator", { fg = border, bg = p.bg })
	U.h("Visual", { bg = p.visual })

	-- syntax (vim)
	U.h("Comment", { fg = p.comment, italic = true })
	U.h("Constant", { fg = p.number })
	U.h("String", { fg = p.string })
	U.h("Character", { fg = p.string })
	U.h("Number", { fg = p.number })
	U.h("Boolean", { fg = p.number })
	U.h("Float", { fg = p.number })

	U.h("Identifier", { fg = p.variable })
	U.h("Function", { fg = p.func, bold = true })

	U.h("Statement", { fg = p.keyword })
	U.h("Conditional", { fg = p.keyword })
	U.h("Repeat", { fg = p.keyword })
	U.h("Label", { fg = p.keyword })
	U.h("Operator", { fg = p.fg })
	U.h("Keyword", { fg = p.keyword, bold = true })
	U.h("Exception", { fg = p.keyword })

	U.h("PreProc", { fg = p.func })
	U.h("Include", { fg = p.keyword })
	U.h("Define", { fg = p.keyword })
	U.h("Macro", { fg = p.func })

	U.h("Type", { fg = p.number })
	U.h("StorageClass", { fg = p.keyword })
	U.h("Structure", { fg = p.keyword })
	U.h("Typedef", { fg = p.keyword })

	U.h("Special", { fg = p.variable })
	U.h("Delimiter", { fg = p.fg })

	-- UI
	U.h("Search", { fg = p.fg, bg = p.search })
	U.h("IncSearch", { fg = p.bg, bg = p.number })
	U.h("CurSearch", { fg = p.bg, bg = p.number })

	U.h("StatusLine", { fg = p.fg, bg = bg_alt })
	U.h("StatusLineNC", { fg = p.comment, bg = bg_alt })
	U.h("StatusLineTerm", { fg = p.fg, bg = bg_alt })
	U.h("StatusLineTermNC", { fg = p.comment, bg = bg_alt })
	U.h("TabLine", { fg = fg_soft, bg = bg_alt })
	U.h("TabLineFill", { fg = border, bg = bg_alt })
	U.h("TabLineSel", { fg = p.fg, bg = p.bg })

	U.h("NormalFloat", { fg = p.fg, bg = bg_alt })
	U.h("FloatBorder", { fg = border, bg = bg_alt })
	U.h("FloatTitle", { fg = p.func, bg = bg_alt })
	U.h("FloatFooter", { fg = p.comment, bg = bg_alt })
	U.h("Pmenu", { fg = p.fg, bg = bg_alt })
	U.h("PmenuSel", { fg = p.fg, bg = p.visual })
	U.h("PmenuSbar", { bg = bg_soft })
	U.h("PmenuThumb", { bg = border })
	U.h("WildMenu", { fg = p.fg, bg = p.visual })
	U.h("QuickFixLine", { bg = p.visual })
	U.h("MsgArea", { fg = p.fg, bg = p.bg })
	U.h("ModeMsg", { fg = p.func })
	U.h("MoreMsg", { fg = p.string })
	U.h("Question", { fg = p.string })

	-- diff
	U.h("DiffAdd", { bg = p.diff_add })
	U.h("DiffChange", { bg = p.diff_change })
	U.h("DiffText", { bg = p.diff_change })
	U.h("DiffDelete", { fg = p.variable, bg = p.diff_delete })

	-- diagnostics
	U.h("DiagnosticError", { fg = p.variable })
	U.h("DiagnosticWarn", { fg = p.number })
	U.h("DiagnosticInfo", { fg = p.func })
	U.h("DiagnosticHint", { fg = p.comment })
	U.h("DiagnosticVirtualTextError", { fg = p.variable, bg = bg_soft })
	U.h("DiagnosticVirtualTextWarn", { fg = p.number, bg = bg_soft })
	U.h("DiagnosticVirtualTextInfo", { fg = p.func, bg = bg_soft })
	U.h("DiagnosticVirtualTextHint", { fg = p.comment, bg = bg_soft })
	U.h("DiagnosticSignError", { fg = p.variable, bg = p.bg })
	U.h("DiagnosticSignWarn", { fg = p.number, bg = p.bg })
	U.h("DiagnosticSignInfo", { fg = p.func, bg = p.bg })
	U.h("DiagnosticSignHint", { fg = p.comment, bg = p.bg })
	U.h("DiagnosticFloatingError", { fg = p.variable, bg = bg_alt })
	U.h("DiagnosticFloatingWarn", { fg = p.number, bg = bg_alt })
	U.h("DiagnosticFloatingInfo", { fg = p.func, bg = bg_alt })
	U.h("DiagnosticFloatingHint", { fg = p.comment, bg = bg_alt })

	-- Treesitter (full base coverage)
	U.h("@comment", { fg = p.comment, italic = true })
	U.h("@keyword", { fg = p.keyword })
	U.h("@string", { fg = p.string })
	U.h("@function", { fg = p.func })
	U.h("@function.builtin", { fg = p.func })
	U.h("@variable", { fg = p.variable })
	U.h("@variable.builtin", { fg = p.variable })
	U.h("@number", { fg = p.number })
	U.h("@boolean", { fg = p.number })
	U.h("@operator", { fg = p.fg })
	U.h("@type", { fg = p.number })
	U.h("@type.builtin", { fg = p.number })
	U.h("@property", { fg = p.variable })
	U.h("@field", { fg = p.variable })
	U.h("@parameter", { fg = p.variable })
	U.h("@constructor", { fg = p.func })
	U.h("@punctuation.delimiter", { fg = p.fg })
	U.h("@punctuation.bracket", { fg = p.fg })

	-- markdown
	U.h("@markup.heading", { fg = p.variable, bold = true })
	U.h("@markup.italic", { italic = true })
	U.h("@markup.strong", { bold = true })
	U.h("@markup.link", { fg = p.func })
	U.h("@markup.raw", { fg = p.string })

	-- plugins

	-- GitSigns
	U.h("GitSignsAdd", { fg = p.string })
	U.h("GitSignsChange", { fg = p.number })
	U.h("GitSignsDelete", { fg = p.variable })

	-- fzf-lua
	U.h("FzfLuaNormal", { fg = p.fg, bg = bg_alt })
	U.h("FzfLuaBorder", { fg = border, bg = bg_alt })
	U.h("FzfLuaTitle", { fg = p.func, bg = bg_alt })
	U.h("FzfLuaPreviewNormal", { fg = p.fg, bg = p.bg })
	U.h("FzfLuaPreviewBorder", { fg = border, bg = p.bg })
	U.h("FzfLuaCursorLine", { bg = p.visual })
	U.h("FzfLuaSearch", { fg = p.func })
	U.h("FzfLuaHeaderBind", { fg = p.keyword })
	U.h("FzfLuaHeaderText", { fg = fg_soft })

	-- Neo-tree
	U.h("NeoTreeNormal", { fg = p.fg, bg = bg_alt })
	U.h("NeoTreeNormalNC", { fg = p.fg, bg = bg_alt })
	U.h("NeoTreeEndOfBuffer", { fg = bg_alt, bg = bg_alt })
	U.h("NeoTreeWinSeparator", { fg = border, bg = bg_alt })
	U.h("NeoTreeCursorLine", { bg = p.visual })
	U.h("NeoTreeDirectoryName", { fg = p.func })
	U.h("NeoTreeDirectoryIcon", { fg = p.func })
	U.h("NeoTreeRootName", { fg = p.keyword })
	U.h("NeoTreeFileName", { fg = p.fg })
	U.h("NeoTreeFileNameOpened", { fg = p.func })
	U.h("NeoTreeGitAdded", { fg = p.string })
	U.h("NeoTreeGitModified", { fg = p.number })
	U.h("NeoTreeGitDeleted", { fg = p.variable })
	U.h("NeoTreeIndentMarker", { fg = border })

	-- completion
	U.h("BlinkCmpMenu", { fg = p.fg, bg = bg_alt })
	U.h("BlinkCmpMenuBorder", { fg = border, bg = bg_alt })
	U.h("BlinkCmpMenuSelection", { fg = p.fg, bg = p.visual })
	U.h("BlinkCmpDoc", { fg = p.fg, bg = bg_alt })
	U.h("BlinkCmpDocBorder", { fg = border, bg = bg_alt })
	U.h("BlinkCmpLabel", { fg = p.fg })
	U.h("BlinkCmpLabelMatch", { fg = p.func })
	U.h("BlinkCmpKind", { fg = p.keyword })
	U.h("BlinkCmpSource", { fg = p.comment })
	U.h("CmpItemAbbr", { fg = p.fg })
	U.h("CmpItemKind", { fg = p.func })

	-- misc
	U.h("MatchParen", { fg = p.fg, bg = p.visual })
	U.h("MiniIndentscopeSymbol", { fg = border })
end

return M
