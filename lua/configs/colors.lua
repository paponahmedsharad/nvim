-- colorscheme for NeoVim
-- colorscheme name : bluloco-dark

-- color palette
-- Background 	#282c34 Foreground 	#abb2bf Comment 	#636d83 Keyword 	#10b1fe Function/Method 	#3fc56b Property 	#ce9887 String 	#f9c859 Number 	#ff78f8 Constant 	#9f7efe Markup Tag 	#3691ff Markup Attribute 	#ff936a Class/Type/Interface 	#ff6480 Operator/Punctuation 	#7a82da
local colors = {
  bg = '#282c34',
  fg = '#abb2bf',
  comment = '#636d83',
  keyword = '#10b1fe',
  functions = '#3fc56b',
  property = '#ce9887',
  string = '#f9c859',
  number = '#ff78f8',
  constant = '#9f7efe',
  markup_tag = '#3691ff',
  markup_attribute = '#ff936a',
  class = '#ff6480',
  operator = '#7a82da',
}

-- colors for html
local html_colors = {
  html_tag = colors.markup_tag,
  html_endTag = colors.markup_tag,
  html_tagN = colors.markup_tag,
  html_arg = colors.markup_attribute,
}

-- colors vibrant color for css
local css_colors = {
  cssBraces = colors.class,
  cssClassName = colors.class,
  cssClassNameDot = colors.class,
  cssColor = colors.class,
  cssDefinition = colors.class,
  cssFontAttr = colors.class,
  cssFontDescriptor = colors.class,
  cssFunctionName = colors.class,
  cssIdentifier = colors.class,
  cssImportant = colors.class,
  cssProp = colors.class,
  cssPseudoClassId = colors.class,
  cssPseudoClassIdFunc = colors.class,
  cssSelectorOp = colors.class,
  cssTagName = colors.class,
  cssValue = colors.class,
  cssVendor = colors.class,
  cssVendorProp = colors.class,
}

-- colors for javascript
local js_colors = {
  jsClassBlock = colors.class,
  jsClassBraces = colors.class,
  jsClassDefinition = colors.class,
  jsClassExtends = colors.class,
  jsClassFunc = colors.class,
  jsClassFuncArgs = colors.class,
  jsClassFuncBlock = colors.class,
  jsClassFuncBraces = colors.class,
  jsClassFuncCall = colors.class,
  jsClassFuncName = colors.class,
  jsClassFuncParens = colors.class,
  jsClassKeyword = colors.class,
  jsClassParens = colors.class,
  jsClassSuper = colors.class,
  jsFunc = colors.functions,
  jsFuncArgs = colors.functions,
  jsFuncBlock = colors.functions,
  jsFuncBraces = colors.functions,
  jsFuncCall = colors.functions,
  jsFuncParens = colors.functions,
}

-- colors for typescript
local ts_colors = {
  tsClassBlock = colors.class,
  tsClassBraces = colors.class,
  tsClassDefinition = colors.class,
  tsClassExtends = colors.class,
  tsClassFunc = colors.class,
  tsClassFuncArgs = colors.class,
  tsClassFuncBlock = colors.class,
  tsClassFuncBraces = colors.class,
  tsClassFuncCall = colors.class,
  tsClassFuncName = colors.class,
  tsClassFuncParens = colors.class,
  tsClassKeyword = colors.class,
  tsClassParens = colors.class,
  tsClassSuper = colors.class,
  tsFunc = colors.functions,
  tsFuncArgs = colors.functions,
  tsFuncBlock = colors.functions,
  tsFuncBraces = colors.functions,
  tsFuncCall = colors.functions,
  tsFuncParens = colors.functions,
}

-- colors for lua
local lua_colors = {
  luaFunc = colors.functions,
  luaFuncArgs = colors.functions,
  luaFuncBlock = colors.functions,
  luaFuncBraces = colors.functions,
  luaFuncCall = colors.functions,
  luaFuncParens = colors.functions,
}

-- all colors combined together in one table
-- apply the colors to the colorscheme
local all_colors = vim.tbl_extend('force', colors, html_colors, css_colors, js_colors, ts_colors, lua_colors)
for group, color in pairs(all_colors) do
  vim.cmd('highlight ' .. group .. ' guifg=' .. color)
end

-- apply lua colors to the colorscheme
for group, color in pairs(lua_colors) do
  vim.cmd('highlight ' .. group .. ' guifg=' .. color)
end
