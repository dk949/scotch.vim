" Vim syntax file
" Language: Scotch
" Maintainer: dk949
" Latest Revision: 2022-03-09

" Adapted from zig.vim syntax file (https://github.com/ziglang/zig.vim/blob/master/syntax/zig.vim)

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim


let s:scotchSyntax = {
            \   'scotchBoolean': [ "true", "false" ]
            \ , 'scotchBuiltinFn': []
            \
            \ , 'scotchConditional':[ "if", "case" ]
            \ , 'scotchConstant': []
            \ , 'scotchDummyVariable': ["_"]
            \ , 'scotchException': [ "fail" , "err" ]
            \ , 'scotchExecution': [ "break", "continue", "return" ]
            \ , 'scotchKeyword': [ "module", "import", "def" ]
            \ , 'scotchMacro': []
            \ , 'scotchNull': []
            \ , 'scotchPreProc': []
            \ , 'scotchRepeat': []
            \ , 'scotchStructure': []
            \ , 'scotchType': ["i32", "i64", "f32", "f64"]
            \ , 'scotchVarDecl': ["const", "let", "static"]
            \ }

function! s:syntax_keyword(dict)
    for key in keys(a:dict)
        if !(a:dict[key]->empty())
            execute 'syntax keyword' key join(a:dict[key], ' ')
        endif
    endfor
endfunction

call s:syntax_keyword(s:scotchSyntax)

syntax match scotchOperator display "\V\[~&|!/%*+-:;>=<]"

syntax match scotchWholeNum display "\v<\d+[ilfd]?"
syntax match scotchDotNum display   "\v<\d+\.\d*[ilfd]?"

syntax region scotchBlock start="{" end="}" transparent fold

syntax region scotchComment start="--" end="$" contains=scotchTodo

syntax keyword scotchTodo contained TODO


highlight default link scotchWholeNum scotchNum
highlight default link scotchDotNum scotchNum

highlight default link scotchBoolean Boolean
highlight default link scotchBuiltinFn Statement
highlight default link scotchComment Comment
highlight default link scotchComparatorWord Keyword
highlight default link scotchConditional Conditional
highlight default link scotchConstant Constant
highlight default link scotchDummyVariable Comment
highlight default link scotchException Exception
highlight default link scotchExecution Special
highlight default link scotchKeyword Keyword
highlight default link scotchMacro Macro
highlight default link scotchNull Boolean
highlight default link scotchNum Number
highlight default link scotchOperator Operator
highlight default link scotchPreProc PreProc
highlight default link scotchRepeat Repeat
highlight default link scotchStructure Structure
highlight default link scotchTodo Todo
highlight default link scotchType Type
highlight default link scotchVarDecl Keyword

delfunction s:syntax_keyword

let b:current_syntax = "scot"

let &cpo = s:cpo_save
unlet! s:cpo_save
