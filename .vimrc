set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start
let mapleader = ','			                "Change the leader to comma.	
set nonumber				                "No numbers by default, I'll call them if i need	
set noerrorbells visualbell t_vb=           "No damn bells!
set autowriteall                            "Automatically write the file when switching buffers.
set complete=.,w,b,u                        "Set up auto-complete
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase                              "ignore case when searching
set smartcase                               "ignore case if all lowercase

 


"--------------Visuals-------------"
colorscheme atom-dark
set t_CO=256				"256 colors forced"
set macligatures			"Ligature support"
set guifont=Fira_Code:h15 
set guioptions-=e			"no gui tabs"
set linespace=15			"1.5 line height (MacVim specific)"

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"fake padding on the left
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"get rid of ugly split borders
hi vertsplit guifg=bg guibg=bg


"--------------Split Management-------------"

set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nmap vs :vsp<cr>
nmap sp :split<cr>



"--------------Search-------------"
set hlsearch					"Highlights search terms
set incsearch					"Incremental search functionality
nmap <Leader><space> :nohlsearch <cr>		"Easily remove highlights



"--------------Mappings-------------"
"Make it easy to edit the Vimrc.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Edit the snippets
nmap <Leader>es :e ~/.vim/snippets/

"Edit plugins
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"Fast saving is good
nmap <Leader>w :w!<cr>

"Make nerdtree easier to toggle
nmap <D-1> :NERDTreeToggle<cr>

"Find a specific tag
nmap <Leader>f :tag<space>

"Find and replace with Greplace
nmap <Leader>r :Gsearch<cr>


"----------------Laravel-Specific----------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>


"----------------Plugins----------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>


"/
"/ GReplace.vim
"/
"/ We want to use Ag for the search.  It's deprecated, so may Ack will go here
"/ in the future.
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"=====Uncomment to set up GReplace to use Ack if needed========="
" set grepprg=ack						"
" let g:grep_cmd_opts = '--noheading'				"
"================================================================

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0


"/
"/ Syntastic 
"/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"/
"/ NERDCommenter 
"/
nmap <Leader>/ <Leader>c<space>

"/
"/ php-cs-fixer
"/

let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"         " make the path work
let g:php_cs_fixer_level = "psr2"                                       " Set level to psr2. 
let g:php_cs_fixer_fixers_list = "-psr0"                                " disable PSR-0.
nnoremap <silent><Leader>l :call PhpCsFixerFixFile()<CR>                " fix the current file                


"/
"/ pdv
"/

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"/
"/ Emmet.vim
"/
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")             "set tab as autoexpander



"--------------Auto-Commands-------------"
"Automatically source the Vimrc on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Automatic use statements
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"Fully qualified namespaces
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
