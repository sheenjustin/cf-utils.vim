" Language:					cfml
" Original Maintainer:		Dave Long <http://davejlong.com>
" Original URL:				http://github.com/davejlong/coldfusion.vim
" New Maintainer:			Sheen Justin
" New URL:					https://github.com/sheenjustin/cf-utils.vim
" License:					WTFPL
" Notes:					Sheen- added newer CFML tags and functions. Fixed syntax highlighting for strings and cfscript blocks

" Bail if out syntax is already loaded
if exists('b:current_syntax') && b:current_syntax == 'cfml'
	finish
endif

if exists("d_noinclude_html")
	" Define alternatives to the HTML syntax file.

	" Copied from html.vim - the rules for matching a CF tag match	those for HTML/SGML.
	" CFML syntax is more permissive when it comes to superfluous <> chars.
	syn region	htmlString		start=+"+			end=+"+			contained					contains=@htmlPreproc
	syn region	htmlString		start=+'+			end=+'+			contained					contains=@htmlPreproc
	syn match	htmlValue		"=[\t ]*[^'" \t>][^ \t>]*"hs=s+1	contained					contains=@htmlPreproc

	" Hacked htmlTag so that it only matches cf tags and not random <> chars.
	syn region  htmlEndTag		start=+</+			end=+>+										contains=htmlTagN,htmlTagError
	syn region  htmlTag			start=+<\s*[^/]+	end=+>+										contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,@htmlPreproc,@htmlArgCluster
	syn match   htmlTagN		+<\s*[-a-zA-Z0-9]\++hs=s+1			contained					contains=htmlTagName,@htmlTagNameCluster
	syn match   htmlTagN		+</\s*[-a-zA-Z0-9]\++hs=s+2			contained					contains=htmlTagName,@htmlTagNameCluster
	syn match   htmlTagError	contained "[^>]<"ms=s+1
	syn region	htmlComment		start='<!--'		end='-->' 		containedin=cfOutputRegion	contains=cfExpressionCluster,cfSetRegion,cfHashRegion

else
	" Use all the stuff from the HTML syntax file.
	runtime! syntax/html.vim
endif

syn sync	fromstart
syn sync	maxlines=200
syn case	ignore

" Add to the HTML clusters.
syn cluster	htmlTagNameCluster	add=cfTagName,cfCustomTagName,cfDeprecatedTag
syn cluster	htmlArgCluster		add=cfArg,cfHashRegion,cfScope,cfDeprecatedArg
syn cluster	htmlPreproc			add=cfHashRegion

" CF comments: similar to SGML comments, but can be nested.  
syn region	htmlComment		start='<!--'
						\	end='-->'
						\	fold
						\	containedin=cfOutputRegion
						\	contains=cfSetRegion,cfHashRegion,cfComment
syn region	cfComment		start='<!---'
						\	end='--->'
						\	fold
						\	extend
						\	matchgroup=NONE
						\	contains=cfCommentTodo,cfComment
syn keyword	cfCommentTodo	contained TODO FIXME XXX TBD WTF 

" cfoutput tags may be nested indefinitely.
syn region	cfOutputRegion	matchgroup=NONE transparent start=+<cfoutput>+ end=+</cfoutput>+ fold contains=TOP

" <cfset>, <cfif>, <cfelseif>, <cfreturn> are analogous to hashmarks (implicit
" evaluation) and have 'var'
syn region	cfSetRegion		start="<cfset\s\_[^>]*>"	start="<cfreturn\s\_[^>]*>"	start="<cfelseif\s\_[^>]*>"	start="<cfif\s\_[^>]*>"	end='>'			keepend				contains=@cfExpressionCluster,cfSetRegion,cfSetTagEnd,cfString,cfComment,cfTagName

" CFscript 
syn include @cfscript		syntax/cfscript.vim
syn region	cfscriptBlock	start=+<cfscript\_[^>]*>+ end=+</cfscript>+me=s-1 keepend matchgroup=NONE contains=@cfscript,cfComment,cfHashRegion,@cfExpressionCluster,@htmlTagNameCluster,@htmlArgCluster,cfString

" CFML
syn cluster	cfmlCluster		contains=cfComment,@htmlTagNameCluster,@htmlPreproc,cfSetRegion,cfscriptBlock,cfOutputRegion

" cfquery = sql syntax
if exists("b:current_syntax")
	unlet b:current_syntax
endif

syn include @cfSql $VIMRUNTIME/syntax/sql.vim

if exists("b:current_syntax")
	unlet b:current_syntax
endif

syn region	cfSqlregion	start=+<cfquery\_[^>]*>+ end=+</cfquery>+me=s-1 keepend matchgroup=NONE contains=@cfSql,cfComment,@htmlTagNameCluster,cfHashRegion,cfQueryArgs,cfParamArgs

"moved keyword definitions and other common syntax definitions for modularity
syn include @cfcommon syntax/cfcommon.vim
syn match	cfSetTagEnd		'>'		contained
syn match	cfSetTagEnd		'/>'	contained

if !exists('b:current_syntax')
	let b:current_syntax = 'cfml'
endif