function fin-budget --wraps ledger --description 'budget for this month'
    command ledger b Доходы Расходы -p 'this month' --effective --budget $argv
end
