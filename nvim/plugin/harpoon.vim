lua require("vellankiindeevar")

" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <C-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-;> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>t :lua require("harpoon.term").gotoTerminal(1)<CR>
