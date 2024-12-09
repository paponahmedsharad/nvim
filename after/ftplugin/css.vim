set tabstop=4
set shiftwidth=4
set softtabstop=4

"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>
" imap df <C-j><CR> <Esc>
" imap fd <C-j><CR> <Esc>

"---> make a lsp snippets
" im fr : ;<Left>
" im rf : ;<Left>

" nmap jp <Esc>yisvis<Space>/}p
" nmap pj <Esc>yisvis<Space>/}p


" im <A-n> <Esc>}o


" AUTO SAVE
" autocmd TextChanged,TextChangedI <buffer> silent write


"================colorscheme===============
" hi Normal		guifg=#8099e6  			guibg=#1a1b26
" hi Comment	term=bold		ctermfg=white		guifg=#4d6680
" hi Type	term=underline		ctermfg=Black	guifg=#5bdb00  gui=bold







" hi Normal guifg=#778cd9





" """""""""""""""""""""""""""""""""""""""""""""""""""""""
" " colorscheme
" """"""""""""""""""""""""""""""""""""""""""""""""""""""
" hi Normal                          guibg=#1a1b26
" " hi Boolean                         guibg=NONE
" " hi Character                       guifg=#9f7efe guibg=NONE
" hi Comment                         guifg=#636d83 guibg=NONE
" " hi Conditional                     guifg=#10b1fe guibg=NONE
" " hi Constant                        guifg=#9f7efe guibg=NONE
" " hi Define                          guifg=#10b1fe guibg=NONE
" " hi DiffAdd                         guibg=#27543a
" " hi DiffChange                      guibg=#004766
" " hi DiffText                        guibg=#00608a
" " hi DiffDelete                      guifg=#803434 ctermbg=NONE guibg=NONE
" " hi diffAdded                       guibg=#2b663f
" " hi diffRemoved                     guibg=#803434 ctermfg=NONE guifg=NONE
" " hi ErrorMsg                        guifg=#fc2f52 guibg=#3e4451
" " hi Error                           guifg=#fc2f52 guibg=#3e4451
" " hi WarningMsg                      guifg=#fc2f52 guibg=#3e4451
" " hi Float                           guifg=#ff78f8 guibg=NONE
" " hi Function                        guifg=#3fc56b guibg=NONE
" " hi Identifier                      guifg=#ce9887 guibg=NONE
" hi Keyword                         guifg=#10b1fe guibg=NONE
" " hi Label                           guifg=#f9c859 guibg=NONE
" " hi NonText                         guifg=#545862 guibg=#282c34
" " hi Number                          guifg=#ff78f8 guibg=NONE
" hi Number                          guifg=#8584f8 guibg=NONE
" hi Operator                        guifg=#7a82da guibg=NONE
" hi Parameter                       guifg=#8bcdef
" hi PreProc                         guifg=#10b1fe guibg=NONE
" hi Special                         guifg=#ff936a guibg=NONE
" hi SpecialKey                      guifg=#545862 guibg=#353942
" " hi Statement                       guifg=#10b1fe guibg=NONE
" " hi StorageClass                    guifg=#10b1fe guibg=NONE
" " hi String                          guifg=#f9c859 guibg=NONE
" hi StringCss                          guifg=#8a94ff guibg=NONE
" hi Tag                             guifg=#3691ff guibg=NONE
" " hi Tag                             guifg=#8ce633 guibg=NONE gui=italic
" hi Tagi                             guifg=#8ce633 guibg=NONE gui=italic
" hi TagB                             guifg=#8c3ea6 guibg=NONE gui=bold
" hi TagName                           guifg=#ad5fc7 guibg=NONE gui=bold
" " hi Title                           guifg=#abb2bf guibg=NONE gui=bold
" " hi Todo                            guifg=#636d83 guibg=NONE gui=inverse
" " hi Type                            guifg=#ff6480 guibg=NONE
" " hi Underlined                      guifg=NONE guibg=NONE gui=underline
" hi PunctuationDim                  guifg=#636489 guibg=NONE

" "--> css
" hi cssURL                          guifg=#8bcdef guibg=NONE
" hi cssFunctionName                 guifg=#3fc56b guibg=NONE
" hi cssColor                        guifg=#f9c859 guibg=NONE
" hi cssPseudoClassId                guifg=#ff936a guibg=NONE
" " hi cssClassName                    guifg=#ff936a guibg=NONE
" hi cssClassName                    guifg=#8689d7 guibg=NONE gui=bold
" hi cssValueLength                  guifg=#ff78f8 guibg=NONE
" hi cssCommonAttr                   guifg=#f9c859 guibg=NONE
" " hi cssBraces                       guifg=#ff6480 guibg=NONE





" "----------------------------------------------------


" " css
" hi link cssAttributeSelector       Attribute
" hi link cssFontDescriptor          Keyword
" hi link cssImportant               Keyword
" hi link cssTagName                 TagName
" " hi link cssClassName               TagName
" hi link cssBraces                  TagB
" hi link cssProp                    Field
" hi link cssSelectorOp              Operator
" hi link cssSelectorOp2             Operator
" " hi link cssAttrComma               Punctuation
" " hi link cssNoise                   Punctuation
" " hi link cssFunctionComma           Punctuation
" hi link cssAttrComma               PunctuationDim
" hi link cssNoise                   PunctuationDim
" hi link cssFunctionComma           PunctuationDim
" hi link cssAttrRegion              Operator
" hi link cssIdentifier              Class
" hi link cssAttr                    StringCss
" hi link cssFontDescriptorFunction  StringCss
" hi link cssUnitDecorators          StringCss
" hi link cssNumber                  Number
