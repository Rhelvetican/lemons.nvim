local M = {}

-- only enabled when editing theme, NOT when using it
--- MAKE SURE TO DISABLE THIS AFTERWARDS ---
local editing = false

-- stylua: ignore
M.colors = {
    black        = "#040404",
    dark_grey    = "#161616",
    grey         = "#212121",
    light_grey   = "#565656",
    darker_white = "#808080",
    dark_white   = "#cacaca",
    white        = "#F5F5F5",
    red          = "#e33a5b",
    dark_green   = "#0B1B10",
    lime         = "#2ed592",
    green        = "#2ED563",
    dark_yellow  = "#1D190D",
    orange       = "#fa8a49",
    yellow       = "#F0BE42",
    blue         = "#4e70c6",
    pink         = "#e84a85",
    dark_cyan    = "#0C1918",
    cyan         = "#37C3B5",
    light_cyan   = "#6AD8ED",
}

local c = M.colors

---@type table<string, vim.api.keyset.highlight>
local highlights = {
    Normal = { fg = c.white, bg = c.black },
    ColorColumn = { bg = c.dark_grey },
    Conceal = { fg = c.darker_white },
    CurSearch = { bg = c.yellow, fg = c.black },
    Cursor = { bg = c.white, fg = c.black },
    CursorColumn = { bg = c.dark_grey },
    CursorLine = { bg = c.dark_grey },
    Directory = { fg = c.orange },
    DiffAdd = { bg = c.dark_green, fg = c.green },
    DiffChange = { bg = c.grey },
    DiffDelete = { bg = c.grey, fg = c.red },
    DiffText = { bg = c.dark_cyan, fg = c.cyan },
    NonText = { fg = c.light_grey },
    TermCursor = { fg = c.black, bg = c.yellow },
    ErrorMsg = { link = "DiagnosticError" },
    WarningMsg = { link = "DiagnosticWarn" },
    WinSeparator = { fg = c.grey },
    Folded = { bg = c.dark_cyan, fg = c.cyan },
    SignColumn = { fg = c.light_grey },
    LineNr = { fg = c.light_grey },
    CursorLineNr = { fg = c.yellow, bold = true },
    MatchParen = { fg = c.yellow, bold = true },
    Search = { bg = c.dark_yellow, fg = c.yellow },
    ModeMsg = { fg = c.green },
    MoreMsg = { fg = c.yellow },
    NormalFloat = { link = "Normal" },
    FloatBorder = { fg = c.light_grey },
    Title = { fg = c.yellow, bold = true },
    Pmenu = { bg = c.dark_grey, fg = c.white },
    PmenuSel = { fg = c.black, bg = c.yellow },
    PmenuExtra = { fg = c.darker_white },
    PmenuSbar = { bg = c.grey },
    PmenuThumb = { bg = c.dark_white },
    PmenuMatch = { underline = true },
    PmenuMatchSel = { underline = true, sp = c.black },
    Question = { fg = c.yellow },
    QuickFixLine = { bold = true },
    qfFileName = { fg = c.yellow },
    qfLineNr = { fg = c.darker_white },
    SpecialKey = { bg = c.dark_cyan, fg = c.cyan },
    SpellBad = { undercurl = true, sp = c.red },
    SpellCap = { undercurl = true, sp = c.yellow },
    SpellLocal = { undercurl = true, sp = c.green },
    SpellRare = { undercurl = true, sp = c.cyan },
    StatusLine = { bg = c.dark_grey, fg = c.white },
    StatusLineNC = { bg = c.grey, fg = c.dark_white },
    Tabline = { bg = c.grey, fg = c.darker_white },
    TablineFill = { bg = c.grey },
    TablineSel = { bg = c.black, fg = c.white, bold = true },
    Visual = { bg = c.grey, bold = true },
    WinBar = { link = "StatusLine" },
    WinBarNC = { link = "StatusLineNC" },

    Comment = { fg = c.darker_white, italic = true },
    Function = { fg = c.yellow, bold = true },
    String = { fg = c.green },
    Identifier = { fg = c.white },
    -- StorageClass = { fg = c.white, bold = true },
    Type = { fg = c.lime },
    Constant = { fg = c.pink },
    Boolean = { link = "Constant" },
    Character = { link = "String" },
    Number = { fg = c.orange },
    -- Exception = { fg = c.red },
    Label = { fg = c.dark_white },
    Operator = { fg = c.red },
    Special = { fg = c.light_cyan },
    Delimiter = { fg = c.white },
    Statement = { link = "Keyword" },
    Keyword = { fg = c.orange },
    Structure = { fg = c.cyan },
    Todo = { fg = c.cyan },
    PreProc = { fg = c.dark_white, bold = true },

    Error = { fg = c.black, bg = c.red },
    Added = { fg = c.green },
    Removed = { fg = c.red },
    Changed = { fg = c.blue },

    -- Diagnostics
    DiagnosticError = { fg = c.red, bold = true },
    DiagnosticWarn = { fg = c.yellow, bold = true },
    DiagnosticInfo = { fg = c.blue, bold = true },
    DiagnosticHint = { fg = c.cyan, bold = true },
    DiagnosticOk = { fg = c.green, bold = true },
    DiagnosticVirtualTextError = { fg = c.red, bold = true },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bold = true },
    DiagnosticVirtualTextInfo = { fg = c.blue, bold = true },
    DiagnosticVirtualTextHint = { fg = c.cyan, bold = true },
    DiagnosticVirtualTextOk = { fg = c.green, bold = true },
    DiagnosticUnderlineError = { underline = true, sp = c.red },
    DiagnosticUnderlineWarn = { underline = true, sp = c.yellow },
    DiagnosticUnderlineInfo = { underline = true, sp = c.blue },
    DiagnosticUnderlineHint = { underline = true, sp = c.cyan },
    DiagnosticUnderlineOk = { underline = true, sp = c.green },
    DiagnosticDeprecated = { strikethrough = true, fg = c.darker_white },
    DiagnosticUnused = { link = "Comment" },
    DiagnosticSignError = { fg = c.red, bold = true },
    DiagnosticSignWarn = { fg = c.yellow, bold = true },
    DiagnosticSignInfo = { fg = c.blue, bold = true },
    DiagnosticSignHint = { fg = c.cyan, bold = true },
    DiagnosticSignOk = { fg = c.green, bold = true },

    -- LSP
    LspCodeLens = { fg = c.light_grey },
    LspCodeLensSeparator = { fg = c.light_grey },
    LspInlayHint = { bg = c.dark_grey, fg = c.light_grey },
    LspReferenceText = { bg = c.grey },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
    LspSignatureActiveParameter = { bg = c.grey, bold = true },

    -- Treesitter
    ["@variable"] = { fg = c.white },
    ["@type.builtin"] = { link = "Type" },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@markup.heading.1"] = { fg = c.yellow, bold = true },
    ["@markup.heading.2"] = { fg = c.orange, bold = true },
    ["@markup.heading.3"] = { fg = c.red, bold = true },
    ["@markup.heading.4"] = { fg = c.pink },
    ["@markup.heading.5"] = { fg = c.blue },
    ["@markup.heading.6"] = { fg = c.green },
    ["@markup.link"] = { underline = false },
    ["@markup.link.vimdoc"] = { underline = true },
    ["@markup.link.label"] = { underline = true },
    ["@markup.link.url"] = { fg = c.blue, underline = true },
    ["@markup.strikethrough"] = { strikethrough = true, fg = c.dark_white },
    ["@markup.quote"] = { fg = c.dark_white },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@comment.error"] = { link = "DiagnosticError" },
    ["@comment.warning"] = { link = "DiagnosticWarn" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "DiagnosticInfo" },

    -- LSP semantic tokens

    --- PLUGINS ---
    -- blink.cmp
    BlinkCmpMenu = { link = "NormalFloat" },
    BlinkCmpMenuBorder = { link = "FloatBorder" },
    BlinkCmpLabelMatch = { link = "PmenuMatch" },
    BlinkCmpDocBorder = { link = "FloatBorder" },
    BlinkCmpKind = { link = "NormalFloat" },
    BlinkCmpKindFolder = { fg = c.orange },
    BlinkCmpKindFile = { fg = c.white },
    BlinkCmpKindText = { fg = c.dark_white },
    BlinkCmpKindMethod = { fg = c.yellow },
    BlinkCmpKindFunction = { fg = c.yellow },
    BlinkCmpKindField = { fg = c.blue },
    BlinkCmpKindVariable = { fg = c.white },
    BlinkCmpKindProperty = { fg = c.light_cyan },
    BlinkCmpKindClass = { fg = c.lime },
    BlinkCmpKindStruct = { fg = c.lime },
    BlinkCmpKindEnum = { fg = c.lime },
    BlinkCmpKindInterface = { fg = c.lime },
    BlinkCmpKindModule = { fg = c.cyan },
    BlinkCmpKindPackage = { fg = c.orange },
    BlinkCmpKindNameSpace = { fg = c.cyan },
    BlinkCmpKindObject = { fg = c.blue },
    BlinkCmpKindValue = { fg = c.pink },
    BlinkCmpKindNumber = { fg = c.orange },
    BlinkCmpKindConstant = { fg = c.pink },
    BlinkCmpKindEnumMember = { fg = c.pink },
    BlinkCmpKindNull = { fg = c.white },
    BlinkCmpKindSnippet = { fg = c.dark_white },
    BlinkCmpKindColor = { fg = c.red },
    BlinkCmpKindKeyword = { fg = c.orange },
    BlinkCmpKindString = { fg = c.green },
    BlinkCmpKindTypeParameter = { fg = c.lime },
    BlinkCmpKindEvent = { fg = c.yellow },
    BlinkCmpKindOperator = { fg = c.red },
    BlinkCmpKindReference = { fg = c.light_cyan },

    -- lazy.nvim
    LazyButtonActive = { bg = c.grey, bold = true },
    LazyReasonEvent = { fg = c.yellow },
    LazyReasonFt = { fg = c.cyan },
    LazyReasonImport = { fg = c.green },

    -- leap.nvim
    LeapBackdrop = { fg = c.darker_white },

    -- mini.icons
    MiniIconsAzure = { fg = c.light_cyan },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.dark_white },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.pink },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },

    -- treesitter-context
    TreesitterContextBottom = { underline = true, sp = c.light_grey },
    TreesitterContextLineNumber = { fg = c.darker_white },

    -- vim-illuminate
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },

    -- oil.nvim
    OilHidden = { fg = c.darker_white },
    OilLink = { fg = c.cyan },
    OilCreate = { fg = c.green },
    OilMove = { fg = c.blue },
    OilCopy = { fg = c.cyan },
    OilChange = { fg = c.yellow },
    OilRestore = { fg = c.green },
    OilPurge = { link = "Error" },
}

function M.load()
    if not editing then -- hi clear removes nvim-colorizer colors
        vim.cmd.highlight("clear")
    end
    vim.cmd.syntax("reset")

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.colors_name = "lemons"

    for name, val in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, val)
    end

    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.pink
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.dark_white
    vim.g.terminal_color_8 = c.light_grey
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.lime
    vim.g.terminal_color_11 = c.orange
    vim.g.terminal_color_12 = c.blue
    vim.g.terminal_color_13 = c.pink
    vim.g.terminal_color_14 = c.light_cyan
    vim.g.terminal_color_15 = c.white
end

if editing then -- reload theme with :so
    M.load()
end

return M
