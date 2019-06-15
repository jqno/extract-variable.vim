# vim-extract-variable

Vim plugin to extract an expression into a local variable. Heavily inspired by, and equally heavily modified from, [fvictorio/vim-extract-variable](https://github.com/fvictorio/vim-extract-variable).

## Usage

Add mappings:

```
nmap <leader>e <Plug>(extractVariableNormal)
vmap <leader>e <Plug>(extractVariableVisual)
```

The visual mode mapping will extract the selection as a variable.

The normal mode mapping will first select something, and then extract that selection as a variable. If [gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim) is installed, it will use that to select the closest text object. If not, it will select an [inner word](http://vimdoc.sourceforge.net/htmldoc/motion.html#iw).

## Supported languages

By default, a variable declaration will look like this:

`varname = expression`

This works for many languages, such as Python and Ruby. Some of the other languages are also supported:

| language   | statement |
| --- | --- |
| Java (10+) | `var varname = expression;`  |
| Javascript | `const varname = expression` |
| Typescript | `const varname = expression` |
| Scala      | `val varname = expression`   |

