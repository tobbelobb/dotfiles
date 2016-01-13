" Vim syntax file
au BufNewFile,BufRead *.clj setf clojure
au BufNewFile,BufRead *.cljs setf clojure
autocmd BufNewFile,BufRead *.cypher setfiletype cypher
autocmd BufNewFile,BufRead *.cyph setfiletype cypher
autocmd BufNewFile,BufRead *.grass setfiletype css
autocmd BufNewFile,BufRead *.scad setf openscad
autocmd BufNewFile,BufRead *.asd setf lisp
autocmd BufNewFile,BufRead *.gp setfiletype GNUplot
autocmd BufNewFile,BufRead *.dgp setfiletype GNUplot
autocmd BufNewFile,BufRead *.plt setfiletype GNUplot
au BufRead,BufNewFile *.ino,*.pde set filetype=arduino
autocmd BufNewFile,BufRead calendar.* setfiletype calendar
