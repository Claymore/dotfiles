function fin-net-income --wraps ledger --description 'my net income this month'
    command ledger b Доходы Расходы -p 'this month' --effective $argv
end
