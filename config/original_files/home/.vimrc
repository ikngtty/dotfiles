" Displaying
"" Display line numbers.
set number
"" Display cursor position information on the right bottom.
set ruler
"" Display an inputting command.
set showcmd

" Searching
set ignorecase
"" When searching text contains upper case charcters,
"" the case is not ignored.
set smartcase
"" Search when inputting searching text.
set incsearch
"" Highlight hit words.
set hlsearch
"" Cancel highlights by <Esc><Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" Mapping
nnoremap <CR> o<Esc>

" Other
"" Yank to the clipboard automatically.
set clipboard=unnamed,autoselect
