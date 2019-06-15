if exists('g:loaded_extract_variable')
    finish
endif
let g:loaded_extract_variable = 1

let g:extract_variable_filetypes = {
    \ 'java': ['var', '=', ';'],
    \ 'javascript': ['const', '=', ''],
    \ 'typescript': ['const', '=', ''],
    \ 'scala': ['val', '=', '']
    \ }

nnoremap <unique> <Plug>(extractVariableNormal) :call extract#variable(0)<CR>
vnoremap <unique> <Plug>(extractVariableVisual) :<C-U>call extract#variable(1)<CR>

