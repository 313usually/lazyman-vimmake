command Setmakeprg
  \ let &l:makeprg=b:compile_cmd . b:execute_cmd . b:infile_cmd . b:outfile_cmd

command Initmakeprg
  \ if filereadable("./Makefile")    |
  \   let b:compile_cmd="make"       |
  \   let b:execute_cmd="; ./\"%<\"" |
  \ endif                            |
  \ let b:infile="input.txt"         |
  \ let b:outfile="output.txt"       |
  \ let b:infile_cmd=""              |
  \ let b:outfile_cmd=""             |
  \ Setmakeprg

autocmd BufNewFile,BufRead *.py
  \ let b:compile_cmd="" |
  \ let b:execute_cmd="python \"%\"" |
  \ Initmakeprg

autocmd BufNewFile,BufRead *.cpp
  \ let b:compile_cmd="rm -f \"%<.out\"; g++ -std=c++11 \"%\" -o \"%<.out\"" |
  \ let b:execute_cmd="; ./\"%<.out\"" |
  \ Initmakeprg

autocmd BufNewFile,BufRead *.c
  \ let b:compile_cmd="rm -f \"%<.out\"; gcc \"%\" -o \"%<.out\"" |
  \ let b:execute_cmd="; ./\"%<.out\"" |
  \ Initmakeprg

autocmd BufNewFile,BufRead *.tex
  \ let b:compile_cmd="pdflatex \"%<\"" |
  \ let b:execute_cmd="" |
  \ Initmakeprg

command Setinfile     let b:infile_cmd =" < " . b:infile  | Setmakeprg
command Unsetinfile   let b:infile_cmd =""                | Setmakeprg

command Setoutfile    let b:outfile_cmd=" > " . b:outfile | Setmakeprg
command Unsetoutfile  let b:outfile_cmd=""                | Setmakeprg
