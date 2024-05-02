" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

"Bail out if syntax is already loaded
" if exists('b:current_syntax') && b:current_syntax == 'cfscript'
"  finish
" endif

syn case ignore
syn include @cfcommon syntax/cfcommon.vim

" Comments
syn keyword cfCommentTodo   contained TODO FIXME XXX TBD
syn match   cfJavaDoc       contained /@\(.\| \)\+$/ contains=cfJavaDocAttr,cfJavaDocVal
syn match   cfJavaDocAttr   contained /@\([a-z]\)\+/
syn match   cfJavaDocVal    contained / \(.\)+$/
syn match   cfLineComment   /\/\/.*/ contains=cfCommentTodo,cfJavaDoc
syn region  cfComment       start="/\*" end="\*/" contains=cfCommentTodo,cfJavaDoc
syn cluster cfCommentCluster contains=cfCommentTodo,cfJavaDoc,cfJavaDocAttr,cfJavaDocVal,cfLineComment,cfComment

" Definitions
syn keyword	cfComponent     component
syn keyword	cfFunction	    function
syn match	cfBraces	      "[{}\[\]]"
syn match	cfParens	      "[()]"
syn keyword	cfFunctionScope public private protected package
syn keyword	cfType          any array binary boolean component date
syn keyword	cfType          guid numeric query string struct uuid
syn keyword	cfType          void xml
syn cluster cfComponentCluster contains=cfComponent,cfFunction,cfFunctionName,cfArg,cfBraces,cfParens,cfFunctionScope,cfType

" Statements
syn keyword cfStatement     return var
" Conditionals
syn keyword cfCondition     if else switch case
" Loops
syn keyword cfLoop          for do while

syn cluster cfCluster contains=cfStatement,cfString,cfScope,cfCondition,cfLoop

syn region	cfscriptBlock	    start="{" end="}"   contains=@cfExpressionCluster,@cfCluster,@cfCommentCluster,@cfComponentCluster


" Define default highlighting
command -nargs=+ CfHiLink hi def link <args>

" Comments
CfHiLink cfComment			comment
CfHiLink cfLineComment		comment
CfHiLink cfCommentTodo		Todo
" JavaDoc syntax
CfHiLink cfJavaDocAttr		StorageClass
CfHiLink cfJavaDocVal		Function

" Definitions
CfHiLink cfComponent		StorageClass
CfHiLink cfFunction			Function
CfHiLink cfBraces			Function
CfHiLink cfType				Type

" Statements
CfHiLink cfStatement		Statement

" Strings
CfHiLink cfString			String
CfHiLink cfHashRegion		Special
CfHiLink cfBool			    Boolean

" Scopes

" Conditional
CfHiLink cfCondition		Conditional
" Loop
CfHiLink cfLoop				Conditional

" CF Functions
CfHiLink cfFunctionName		Function
CfHiLink cfFunctionScope	StorageClass
CfHiLink cfArg			    Type

" Operators
CfHiLink cfOperator			Operator
CfHiLink cfOperatorMatch	Operator
CfHiLink cfOperatorCluster	Operator

delcommand CfHiLink


" Set the syntax
" if !exists('b:current_syntax')
"   let b:current_syntax = 'cfscript'
" endif
