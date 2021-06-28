1. Use `cscope -Rbqk` to generate related files of current directory. (like `ctags -R .`)
2. My [vim mappings](http://cscope.sourceforge.net/cscope_maps.vim): 
  * `zs`: symbol, find all references to the token under cursor
  * `zg`: global, find global definition(s) of the token under cursor
  * `zc`: calls,  find all calls to the function name under cursor
  * `zt`: text,   find all instances of the text under cursor
  * `ze`: egrep,  egrep search for the word under cursor
  * `zf`: file,   open the filename under cursor
  * `zi`: includes, find files that include the filename under cursor
  * `zd`: called, find functions that function under cursor calls


debug kernel: `make tags cscope TAGS`
