lib.callback.register("xilo:Payment", function(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= amount then
        xPlayer.removeMoney(amount)
        return true
    else
        return false
    end
end)