" Vim colorscheme file: torch
" Author:   Takahiro Yoshihara <tacahiroy@gmail.com>
" License: Copyright 2015 Takahiro Yoshihara
"          Distributed under the same terms as Vim itself. See :help license.
" Description: This colorscheme is most useless ever

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'torch'

function! s:getting_dark()
  redir => list
    silent highlight
  redir END

  " TODO: each highlight config should be saved for restoration
  for i in range(1, 20)
    for h in split(list, '\n')
      let item = matchstr(h, '^\S\+')
      if len(item) == 0
        continue
      endif
      execute printf('hi %s gui=NONE guifg=Grey%d guibg=Black', item, i)
    endfor
    sleep 300m
    redraw!
  endfor
endfunction

let save_lz = &lazyredraw
let &lazyredraw = 0

hi clear
call s:getting_dark()

let &cursorline = 1
for i in range(1, 50)
  execute printf('hi Cursor guifg=Grey%d', i)
  execute printf('hi CursorLineNr gui=NONE guifg=Grey%d', i)
  execute printf('hi CursorLine gui=NONE guifg=Grey%d', i)
  sleep 50m
  redraw!
endfor
let &lazyredraw = save_lz
