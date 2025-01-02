return {
  "lervag/vimtex",
  config = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_method = "latexmk"

    vim.cmd [[
    let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-bibtex',
      \   '-pdfxe',
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
    ]]
  end
}
