# vim-addon-sql: run sql queries and provide simple alias aware SQL completion

## supported databases

- MySQL (also completes mysql builtin functions showing documentation)
- SQLITE
- Postgresql
- Firebird

## SETUP

Also have a look at the VimL code.

  call vim_addon_sql#Connect('mysql',{'host':'127.0.0.1','database':'DATABASE', 'user':'USER', 'password' : 'PASSWORT'})
  call vim_addon_sql#Connect('sqlite',{'database':'filepath'})

I recommend using vim-addon-local-vimrc like this:

    augroup SQL
      " completion support etc
      autocmd BufRead,BufNewFile .sql,.php,*.haml call vim_addon_sql#Connect('mysql', {'database':'', 'user':'', 'password' : ''})

      " user interface providing to query mappings (see code):
      autocmd BufRead,BufNewFile .sql call vim_addon_sql#UI()
    augroup end

completion setup see plugin/vim-addon-sql.vim.

## completion examples

Example:

1)
  SELECT *, CURSOR FROM table1, table2
  Now CURSOR will only contain fields found in either table1 or table2

2)
  SELECT *, a.CURSOR FROM table1 as a, table2
  Now the completion will only contain fields of table1

camel case like completion is also supported. eg d_u -> db_users

## NOTES

Expect some minor bugs - however this it works quite nicely in practise.

## Details about the implementation

A connection only initializes b:db_conn which is a simple VimL object providing
functions for querying the database.

For each query the executable (psql,isql,mysql,sqlite3) is run once.
Thus there is no support for transactions yet.
It should be easy to add an implementation utilizing python or rubies
database modules.

## alternative projects:
[dbext](http://www.vim.org/scripts/script.php?script_id=356) might be the most
famous one, however in the past it didn't provide alias aware completion which
is why I wrote this project.

In non visual mode the query start / end is determined by either ; or empty lines.
In visual mode the selection will be executed
