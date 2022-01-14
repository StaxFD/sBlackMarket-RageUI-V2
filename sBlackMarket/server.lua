ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent("StaxBuy")
AddEventHandler("StaxBuy", function(Items,Stax,price,number)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xMoney = xPlayer.getAccount('black_money').money
    local totalprice = math.ceil(price*number)
        if xMoney >= totalprice then
            xPlayer.removeAccountMoney('black_money',totalprice)
            xPlayer.addWeapon(Items,number)
            TriggerClientEvent('esx:showAdvancedNotification', source, 'Information', '~o~Vendeur d\'armes~s~','Vous avez acheté [~o~ x ' ..number..'~s~ ~y~'..Stax..' ~s~] pour ~r~'..totalprice..'$~s~','CHAR_ARTHUR', 8)
        else
            TriggerClientEvent('esx:showNotification', _source, "~r~Vous n'avez pas assez d'argent")
        end
end)