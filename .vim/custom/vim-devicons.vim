let g:NERDTreeHighlightFolders = 1
let g:DevIconsEnableFoldersOpenClose = v:true

" Enable folder glyph flag.
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" Use one space after a glyph instead of two.
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Custom colors
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let s:yarn_blue = '488DB7'
let s:travis_green = '39AA56'

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['yarn.lock'] = s:yarn_blue
let g:NERDTreeExactMatchHighlightColor['.travis.yml'] = s:travis_green
let g:NERDTreeExactMatchHighlightColor['spec'] = s:rspec_red

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['spec/*'] = s:rspec_red " sets the color for files ending with _spec.rb

