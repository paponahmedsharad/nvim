----> colorscheme for CSS
local cssColor = {
  left                  = 'guifg=#778cd9',
  -- right                 = 'guifg=#ff6480 gui=italic',
  dim                   = 'guifg=#9999ff',
  -- braces                = 'guifg=#494a55',
  braces                = 'guifg=#e6e633',
  -- selector              = 'guifg=#ff814d guibg=#252631 gui=bold',
  selector              = 'guifg=#d4d419 guibg=#3B4252 gui=bold,underline',
  pesudo                = 'guifg=#b3b31a guibg=#3B4252 gui=bold,underline',
  new                   = 'guifg=#996480 gui=italic',
  link                  = 'guifg=#9980e6 gui=italic,underline',
  white                 = 'guifg=#e6cce6',
  red                   = 'guifg=#cc643e gui=italic,underline',
  rightHighlight        = 'guifg=#ff8080 gui=italic',
  selcetHighlight       = 'guifg=#1accff guibg=#3B4252 gui=bold,underline',

  --------------------------- VARIENT------------------------------------
  right                      = 'guifg=#af973e gui=italic',
  rightlighten1              = 'guifg=#b7a154 gui=italic',
  rightlighten2              = 'guifg=#bfac69 gui=italic,underline',
  rightlighten2i              = 'guifg=#bfac69 gui=italic',
  rightlighten3              = 'guifg=#c6b67c gui=italic',


  -----------------------------------------------------------
  left                       = 'guifg=#8498e5',
  right                      = 'guifg=#af973e ',
  rightlighten1              = 'guifg=#b7a154',
  rightlighten2              = 'guifg=#bfac69',
  rightlighten2i              = 'guifg=#bfac69 ',
  rightlighten3              = 'guifg=#c6b67c ',
  --------------------------- VARIENT 2------------------------------------
  -- left                       = 'guifg=#efbd5d',
  -- braces                     = 'guifg=#efcccc',
  -- selector                   = 'guifg=#ffff00 guibg=#3B4252 gui=bold,underline',
  -- right                      = 'guifg=#34BFD0 gui=none',
  -- rightlighten1              = 'guifg=#EF5DD8 gui=none',
  -- rightlighten2              = 'guifg=#EF5DD8 gui=none,underline',
  -- rightlighten2i             = 'guifg=#EF5DD8 gui=none',
  -- rightlighten3              = 'guifg=#c6b67c gui=none',
  --------------------------- VARIENT 3------------------------------------
  -- left                       = 'guifg=#EFBD5D',
  -- braces                     = 'guifg=#efcccc',
  -- selector                   = 'guifg=#ffff00 guibg=#3B4252 gui=bold,underline',
  -- right                      = 'guifg=#34BFD0 gui=none',
  -- rightlighten1              = 'guifg=#EF5DD8 gui=none',
  -- rightlighten2              = 'guifg=#EF5DD8 gui=none,underline',
  -- rightlighten2              = 'guifg=#ef6e91 gui=none,',
  -- rightlighten2i             = 'guifg=#EF5DD8 gui=none',
  -- rightlighten3              = 'guifg=#c6b67c gui=none',
  ---------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  -- left                  = 'guifg=#8B7EC8',
  -- left                  = 'guifg=#4d4d80',
  -- selector              = 'guifg=#FEB941 guibg=#3B4252 gui=bold,underline',


  -- left                  = 'guifg=#e2b86b',
  -- right                 = 'guifg=#bf68d9 gui=italic',
}

local cssHighlight = {
  cssBraces             = cssColor.braces,                    --> selector block bracket
  cssClassName          = cssColor.selector,                  --> class name
  -- cssPseudoClassId      = cssColor.selector,                  --> pseudo class id
  cssPseudoClass        = cssColor.selector,                  --> pseudo class
  cssTagName            = cssColor.selector,                  --> tag name
  -- cssClassNameDot       = cssColor.selector,                  --> class name dot
  cssImportant          = cssColor.right,                     --> !important keyword color
  cssAttr               = cssColor.right,                     --> css attribute like none , color, font-size
  -- number                = cssColor.right,                     --> any number
  -- string             = cssColor.right,                     --> for every file type

  cssUnitDecorators     = cssColor.right,                     --> rem, px etc
  cssColor              = cssColor.right,                     --> css color for transparent,
  cssFontAttr           = cssColor.right,                     --> css font like sans-serif, serif
  -- cssFunction           = cssColor.right,                         --> var, deg
  -- cssFunctionName       = cssColor.left,                     --> url/rbga keyword
  cssSelectorOp         = cssColor.left,                      --> selector operator like > +
  cssSelectorOp2        = cssColor.left,                      --> second selector operator
  cssProp               = cssColor.left, -- everything left                      --> css property
  cssNoise              = cssColor.dim,                       --> things like :,;
  -- cssAttrComma          = cssColor.left,                      --> attribute comma


  -- new
  -- cssFunctionName        = cssColor.rightHighlight, --> var,
  cssFunction            = cssColor.rightlighten1, --> var,
  cssFunctionName        = cssColor.rightlighten1, --> var,
  cssStringQ             = cssColor.link, --> font name in brac, linner gradinet, drop shadow
  -- cssStringQQ            = cssColor.rightHighlight, --> font name in brac, linner gradinet, drop shadow
  cssStringQQ            = cssColor.rightlighten1, --> font name in brac, linner gradinet, drop shadow
  cssAttrComma           = cssColor.right,                      --> attribute comma
  cssCommonAttr          = cssColor.right, --> none
  cssCustomProp          = cssColor.rightlighten2, -- variable name
  cssValueNumber         = cssColor.right, -- 0 pixel but not 5px
  cssValueLength         = cssColor.right, --  5px
  cssPseudoClassId       = cssColor.pesudo, --  :hover
  cssClassNameDot        = cssColor.selector, --  class name dot
  cssAttrRegion          = cssColor.right, --  position, realitve, absolote, solid, clockwise
  cssDefinition          = cssColor.new, --  position, realitve, absolote, solid, clockwise
  cssMathParens          = cssColor.new, --  position, realitve, absolote, solid, clockwise
  cssAtRule              = cssColor.selcetHighlight, --  position, realitve, absolote, solid, clockwise
  -- cssKeyFrameProp        = cssColor.white, --  position, realitve, absolote, solid, clockwise
  cssKeyFrameProp        = cssColor.rightlighten3, --  position, realitve, absolote, solid, clockwise
  cssValueTime          = cssColor.right, --  position, realitve, absolote, solid, clockwise
  cssValueAngle          = cssColor.right, --  rotate(360)

  cssAtKeyword          = cssColor.braces, --  rotate(360)
  cssIdentifier         = cssColor.selector,
  cssTransitionAttr     = cssColor.right,
  cssMediaAttr          = cssColor.right,

  -- cssMediaProp          = cssColor.selector,                  --> class name
  cssMediaType          = cssColor.selcetHighlight,                  --> screen
  cssATRuleLogical          = cssColor.selcetHighlight,                  --> and
  cssAtRule              = cssColor.selcetHighlight, --  position, realitve, absolote, solid, clockwise
}

for group, color in pairs(cssHighlight) do
  vim.cmd('highlight ' .. group .. ' ' .. color)
end
