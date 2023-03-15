local t = {
  bg                   = "#1a1b26",
  bgFloat              = "#1c1d2a",
  fg                   = "#ABB2BF",
  cursor               = "#FFCC00",
  keyword              = "#10B1FE",
  comment              = "#636D83",
  punctuation          = "#7A82DA",
  method               = "#3FC56B",
  type                 = "#FF6480",
  string               = "#F9C859",
  number               = "#FF78F8",
  constant             = "#9F7EFE",
  tag                  = "#3691FF",
  attribute            = "#FF936A",
  property             = "#CE9887",
  parameter            = "#8bcdef",
  label                = "#50acae",
  ----> workspace
  primary              = "#3691ff",
  selection            = "#274670",
  selectiondim         = "#122938",
  black                = "000000",
  search               = "#1A7247",
  diffAdd              = "#105B3D",
  diffChange           = "#10415B",
  diffDelete           = "#522E34",
  added                = "#177F55",
  changed              = "#1B6E9B",
  deleted              = "#A14D5B",
  error                = "#ff2e3f",
  errorBG              = "#FDCFD1",
  warning              = "#da7a43",
  warningBG            = "#F2DBCF",
  info                 = "#3691ff",
  infoBG               = "#D4E3FA",
  hint                 = "#7982DA",
  mergeCurrent         = "#4B3D3F",
  mergeCurrentLabel    = "#604B47",
  mergeIncoming        = "#2F476B",
  mergeIncomingLabel   = "#305C95",
  mergeParent          = "#ffffff",
  mergeParentLabel     = "#ffffff",
  split                = "#356191",
}

local highlight = {
  Normal               = { fg = t.fg, bg = t.bg }, -- normal text
  Pmenu                = { bg = t.bg },
  PmenuSbar            = { bg = t.bg }, -- Popup menu: scrollbar.
  PmenuThumb           = { bg = t.bg }, -- Popup menu: Thumb of the scrollbar.
  StatusLine           = { bg = t.bg, fg = t.split }, -- status line of current window
  StatusLineNC         = { bg = t.bg, fg = t.split }, -- status lines of not-current windows
  VertSplit            = { fg = t.split }, -- the column separating vertically split windows
  SignColumn           = { bg = t.bg }, -- column where |signs| are displayed
  Question             = { fg = t.primary }, -- |hit-enter| prompt and yes/no questions
  QuickFixLine         = { bg = t.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  SpecialKey           = { fg = t.attribute }, -- Unprintable characters: text displayed differently from what it really is.
  NormalFloat          = { bg = t.bg }, -- Normal text in floating windows.
  NormalSB             = { bg = t.bgFloat }, -- Normal text in floating windows.
  NormalNC             = { bg = t.bg, fg = t.fg }, -- normal text in non-current windows
  Visual               = { fg = t.selection },
  VisualNOS            = { fg = t.selection },
  FloatBorder          = { fg = t.punctuation },
  Directory            = { fg = t.keyword },
  DiffAdd              = { fg = t.diffAdd },
  DiffChange           = { fg = t.diffChange },
  DiffDelete           = { fg = t.diffDelete },
  DiffText             = { fg = t.diffChange },
  Tabline              = { bg = t.bg, fg = t.dim },
  TablineSel           = { bg = t.bg, fg = t.dim },
  TablineFill          = { bg = t.bg },
  EndOfBuffer          = { fg = t.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  TermCursor           = { fg = t.cursor }, -- cursor in a focused terminal
  ModeMsg              = { bg = t.bg, fg = t.fg }, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea              = { fg = t.primary }, -- Area for messages and cmdline
  WarningMsg           = { fg = t.warning },
  WildMenu             = { fg = t.selection }, -- current match in 'wildmenu' completion
  Constant             = { fg = t.constant }, -- (preferred) any constant
  String               = { fg = t.string }, --   a string constant: "this is a string"
  Character            = { fg = t.attribute }, --  a character constant: 'c', '\n'
  Number               = { fg = t.number }, --   a number constant: 234, 0xff
  Boolean              = { fg = t.boolean }, --  a boolean constant: TRUE, false
  Identifier           = { fg = t.fg }, -- (preferred) any variable name
  Function             = { fg = t.method }, -- function name (also: methods for classes)
  Method               = { fg = t.method }, -- function name (also: methods for classes)
  Property             = { fg = t.property },
  Field                = { fg = t.property },
  Parameter            = { fg = t.parameter },
  Statement            = { fg = t.keyword }, -- (preferred) any statement
  Punctuation          = { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
  Operator             = { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
  Keyword              = { fg = t.keyword }, --  any other keyword
  PreProc              = { fg = t.keyword }, -- (preferred) generic Preprocessor
  Type                 = { fg = t.type }, -- (preferred) int, long, char, etc.
  Struct               = { fg = t.type },
  Class                = { fg = t.type },
  Special              = { fg = t.attribute }, -- (preferred) any special symbol
  Attribute            = { fg = t.attribute }, -- (preferred) any special symbol
  Tag                  = { fg = t.tag }, --    you can use CTRL-] on this
  Underlined           = { "gui=underline" }, -- (preferred) text that stands out, HTML links
  Bold                 = { "gui=bold" },
  Italic               = { "gui=italic" },
  Ignore               = { bg = t.bg }, -- (preferred) left blank, hidden  |hl-Ignore|
  Error                = { fg = t.error }, -- (preferred) any erroneous construct
  Todo                 = { bg = t.attribute, fg = t.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  ----> diagonstics
  DiagnosticError      = { fg = t.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticWarn       = { fg = t.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticInfo       = { fg = t.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticHint       = { fg = t.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

  GitSignsAdd          = { fg = t.added },
  GitSignsChange       = { fg = t.changed },
  GitSignsDelete       = { fg = t.deleted },

  ----> telescope
  TelescopeMatching    = { fg = t.string },
  TelescopeSelection   = { bg = t.selectiondim, gui = "bold" },
  TelescopeBorder      = { fg = t.punctuation },

  ----> js
  javaScript           = { fg = t.fg },
  javaScriptIdentifier = { fg = t.keyword },
  javaScriptFunction   = { fg = t.keyword },
  javaScriptParens     = { fg = t.punctuation },
  javaScriptBraces     = { fg = t.punctuation },
  javaScriptNumber     = { fg = t.number },
}



----> apply highlights
for group, colors in pairs(highlight) do
  local fg = colors.fg and "guifg=" .. colors.fg or "gui=NONE"
  local bg = colors.bg and "guibg=" .. colors.bg or "gui=NONE"
  local sp = colors.sp and "guisp=" .. colors.sp or ""
  local gui = colors.gui and "gui=" .. colors.gui or "gui=NONE"
  vim.api.nvim_command("highlight " .. group .. " " .. fg .. " " .. bg .. " " .. sp .. " " .. gui)
end
