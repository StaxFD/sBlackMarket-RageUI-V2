ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

Citizen.CreateThread(function()
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

local main = false
local menu = RageUI.CreateMenu('Vendeur d\'Armes', 'Choisis une catÉgorie')
menu.Closed = function()
    main = false
    RageUI.CloseAll()
end

OpenMenu = function()
    if main then 
        main = false
        RageUI.CloseAll()
        RageUI.Visible(menu, false)
        return
    else
        main = true 
        RageUI.Visible(menu, true)
            Citizen.CreateThread(function()
                while main do 
                    RageUI.IsVisible(menu,function()
                        RageUI.List('Catégories Armes',Config.Categories, List, nil, {}, true, {
                            onListChange = function(Index, Items)
                                List = Index;
                            end,
                        })
                    if List == 1 then
                        for k,v in pairs (VendeurIllegale.Categories.ArmesdeMelee) do
                            RageUI.Button(v.label, nil, {RightLabel = ""..v.color..""..v.Prix.." $~s~"}, true, {
                                onSelected = function()
                                    local number = Visual.KeyboardNumber("Nombres ?", "", 2)
                                    if number == 0 or number == nil then
                                        ESX.ShowNotification("~r~Montant Invalide")
                                    else
                                        Item =  v.name
                                        Stax =  v.label
                                        price = v.PriceNumber
                                        TriggerServerEvent('StaxBuy',Item,Stax,price,number)
                                    end 
                                end,
                            })
                        end
                    elseif List == 2 then
                        for k,v in pairs (VendeurIllegale.Categories.ArmesdePoing) do
                            RageUI.Button(v.label, nil, {RightLabel = ""..v.color..""..v.Prix.." $~s~"}, true, {
                                onSelected = function()
                                    local number = Visual.KeyboardNumber("Nombres ?", "", 2)
                                    if number == 0 or number == nil then
                                        ESX.ShowNotification("~r~Montant Invalide")
                                    else
                                        Item =  v.name
                                        Stax =  v.label
                                        price = v.PriceNumber
                                        TriggerServerEvent('StaxBuy',Item,Stax,price,number)
                                    end 
                                end,
                            })
                        end
                    elseif List == 3 then
                        for k,v in pairs (VendeurIllegale.Categories.Mitrailleuses) do
                            RageUI.Button(v.label, nil, {RightLabel = ""..v.color..""..v.Prix.." $~s~"}, true, {
                                onSelected = function()
                                    local number = Visual.KeyboardNumber("Nombres ?", "", 2)
                                    if number == 0 or number == nil then
                                        ESX.ShowNotification("~r~Montant Invalide")
                                    else
                                        Item =  v.name
                                        Stax =  v.label
                                        price = v.PriceNumber
                                        TriggerServerEvent('StaxBuy',Item,Stax,price,number)
                                    end 
                                end,
                            })
                        end
                    elseif List == 4 then
                        for k,v in pairs (VendeurIllegale.Categories.FusilsaPompes) do
                            RageUI.Button(v.label, nil, {RightLabel = ""..v.color..""..v.Prix.." $~s~"}, true, {
                                onSelected = function()
                                    local number = Visual.KeyboardNumber("Nombres ?", "", 2)
                                    if number == 0 or number == nil then
                                        ESX.ShowNotification("~r~Montant Invalide")
                                    else
                                        Item =  v.name
                                        Stax =  v.label
                                        price = v.PriceNumber
                                        TriggerServerEvent('StaxBuy',Item,Stax,price,number)
                                    end 
                                end,
                            })
                        end
                    elseif List == 5 then
                        for k,v in pairs (VendeurIllegale.Categories.Fusilsdassault) do
                            RageUI.Button(v.label, nil, {RightLabel = ""..v.color..""..v.Prix.." $~s~"}, true, {
                                onSelected = function()
                                    local number = Visual.KeyboardNumber("Nombres ?", "", 2)
                                    if number == 0 or number == nil then
                                        ESX.ShowNotification("~r~Montant Invalide")
                                    else
                                        Item =  v.name
                                        Stax =  v.label
                                        price = v.PriceNumber
                                        TriggerServerEvent('StaxBuy',Item,Stax,price,number)
                                    end 
                                end,
                            })
                        end
                    end
                    end,function()
                    end)
                Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    for _,v in ipairs(VendeurIllegale.Position) do
        if v.ped then
            RequestModel(v.modelped)
            while not HasModelLoaded(v.modelped) do
                RequestModel(v.modelped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, v.modelped, v.pos.x,v.pos.y,v.pos.z-1, 0.0, false, true)
            SetEntityHeading(Peds, v.heading)
            SetEntityInvincible(Peds, true)
            SetBlockingOfNonTemporaryEvents(Peds, true)
            FreezeEntityPosition(Peds,true)
        end
    end
    while true do
        local player = PlayerPedId()
        local playerPos = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for k,v in pairs(VendeurIllegale.Position) do
            local dst5 = GetDistanceBetweenCoords(playerPos, v.pos, true)
            if dst5 < 2.0 then
                activerfps = true
                    ESX.ShowHelpNotification(v.notif)
                if IsControlJustReleased(0, 38) then
                    OpenMenu()
                end
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(500)
        end
    end
end)

