function fin-balance-r --wraps ledger --description 'my current balance in RUR'
    command ledger b Активы Пассивы -X RUR $argv
end
