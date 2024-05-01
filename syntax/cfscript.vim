" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

"Bail out if syntax is already loaded
" if exists('b:current_syntax') && b:current_syntax == 'cfscript'
"  finish
" endif

syn case ignore
syn include @cfkeywords syntax/cfkeywords.vim


" Comments
syn keyword cfCommentTodo   contained TODO FIXME XXX TBD
syn match   cfJavaDoc       contained /@\(.\| \)\+$/ contains=cfJavaDocAttr,cfJavaDocVal
syn match   cfJavaDocAttr   contained /@\([a-z]\)\+/
syn match   cfJavaDocVal    contained / \(.\)+$/
syn match   cfLineComment   /\/\/.*/ contains=cfCommentTodo,cfJavaDoc
syn region  cfComment       start="/\*" end="\*/" contains=cfCommentTodo,cfJavaDoc


" Definitions
syn keyword cfComponent     component
syn keyword cfFunction	    function
syn match	  cfBraces	      "[{}\[\]]"
syn match	  cfParens	      "[()]"
syn keyword cfFunctionScope public private protected package
syn keyword cfType          any array binary boolean component date
syn keyword cfType          guid numeric query string struct uuid
syn keyword cfType          void xml

" Statements
syn keyword cfStatement     return var

" Strings
syn region  cfHash          contained start=+#+ end=+#+
syn region  cfStringD       start=+"+ end=+"+ contains=cfHash
syn region  cfStringS       start=+'+ end=+'+ contains=cfHash
syn keyword cfBoolean       true false

" Scopes
syn keyword cfScope         application arguments attributes caller cgi client
syn keyword cfScope         cookie flash form request server session this
syn keyword cfScope         thread url variables

" Conditionals
syn keyword cfCondition     if else switch case
syn keyword cfCondition     is gt gte lt lte not contains
" Loops
syn keyword cfLoop          for do while


" Define default highlighting
command -nargs=+ CfHiLink hi def link <args>

" Comments
CfHiLink cfComment        comment
CfHiLink cfLineComment    comment
CfHiLink cfCommentTodo    Todo
" JavaDoc syntax
CfHiLink cfJavaDocAttr    StorageClass
CfHiLink cfJavaDocVal     Function

" Definitions
CfHiLink cfComponent      StorageClass
CfHiLink cfFunction       Function
CfHiLink cfBraces         Function
CfHiLink cfType           Type

" Statements
CfHiLink cfStatement      Statement


" Strings
CfHiLink cfStringD        String
CfHiLink cfStringS        String
CfHiLink cfHash           PreProc
CfHiLink cfBoolean        Boolean

" Scopes
CfHiLink cfScope          Keyword

" Conditional
CfHiLink cfCondition      Conditional
" Loop
CfHiLink cfLoop           Conditional

" CF Functions
CfHiLink cfFunctions      Function
CfHiLink cfFunctionScope  StorageClass

" Operators
CfHiLink cfOperator        Operator
CfHiLink cfOperatorMatch   Operator
CfHiLink cfOperatorCluster	Operator

delcommand CfHiLink


" Set the syntax
" if !exists('b:current_syntax')
"   let b:current_syntax = 'cfscript'
" endif
