exec 'inoremap <silent><exec> '.(exists('g:addon_sql.complete_lhs') ? g:addon_sql.complete_lhs : "<c-x><c-q>" )
      \ .' vim_addon_completion#CompleteUsing("vim_addon_sql#Complete","preview,menu,menuone")'
