function! extract#variable(visual_mode)
    " Ask for variable name
    let l:varname = input('Name: ')

    if l:varname ==? ''
        redraw
        echo 'No variable extracted'
        return
    endif

    " Determine filetype
    let l:filetype = ''
    if &filetype !=? ''
        let l:filetype = split(&filetype, '\.')[0]
    endif

    " Yank expression to z register
    let l:saved_z = @z
    if a:visual_mode == 1
        execute 'normal! `<v`>"zy'
    else
        if exists('g:wildfire_objects')
            call wildfire#Start(1, g:wildfire_objects)
        else
            execute 'normal! viw'
        endif
        execute 'normal! "zy'
    endif

    " Replace selection with l:varname
    execute 'normal! `<v`>s' . l:varname

    " Define what a variable declaration should look like
    let l:structure = ['', '=', '']
    if has_key(g:extract_variable_filetypes, l:filetype)
        let l:structure = g:extract_variable_filetypes[l:filetype]
    endif
    let l:prefix = l:structure[0]
    let l:operator = ' ' . l:structure[1] . ' '
    let l:suffix = l:structure[2]
    if l:prefix !=? ''
        let l:prefix = l:prefix . ' '
    endif

    " Create variable declaration in the line above
    execute 'normal! O' . l:prefix . l:varname . l:operator . @z . l:suffix

    " Move the cursor to the start of the line
    execute 'normal ^'

    " Restore z register
    let @z = l:saved_z
endfunction

