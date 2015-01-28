"=============================================================================
" File: xmpfilter.vim
" Author: t9md <taqumd@gmail.com>
" WebPage: http://github.com/t9md/vim-ruby-xmpfilter
" License: BSD
" Version: 0.1

" GUARD: {{{
"============================================================

if exists('g:loaded_seeing_is_believing')
  finish
endif
let g:loaded_seeing_is_believing = 1

let s:old_cpo = &cpo
set cpo&vim
"}}}

" KEYMAP: {{{
"=================================================================
nnoremap <silent> <Plug>(seeing-is-believing-run)        :call seeing_is_believing#run('n')<CR>
nnoremap <silent> <Plug>(seeing-is-believing-myrun) :call seeing_is_believing#myrun('n')<CR>
nnoremap <silent> <Plug>(seeing-is-believing-clear) :call seeing_is_believing#clear('n')<CR>

nnoremap <silent> <Plug>(seeing-is-believing-mark)      :call seeing_is_believing#toggle_mark('n')<CR>
"}}}

let &cpo = s:old_cpo
" vim: foldmethod=marker
