local function menu()
    local teleportoptions = {}
    for key, value in pairs(Config.spawnloc) do
        table.insert(teleportoptions, {
            label = key,
            icon = value.icon,
            args = {
                location = value.loc,
                label = key
            }
        })
    end
    lib.registerMenu({
        id = "xilo_main_menu",
        title = Config.menu.title,
        position = Config.menu.position,
        options = teleportoptions
    }, function(selected, scrollIndex, args)
        if Config.misc.enablepay then
            local callback = lib.callback.await("xilo:Payment", false, Config.misc.amount)
            if callback then
                DoScreenFadeOut(900)
                Wait(900)
                DoScreenFadeIn(900)
                SetEntityCoords(PlayerPedId(), args.location)
                lib.notify({
                    title = "Notification",
                    description = "Sucessfully Teleported to "..args.label,
                    type = "success"
                })
            else
                lib.notify({
                    title = "Notification",
                    description = "You cannot afford this, maybe get some money?",
                    type = "error"
                })
            end
        else
            DoScreenFadeOut(900)
            Wait(900)
            DoScreenFadeIn(900)
            SetEntityCoords(PlayerPedId(), args.location)
            lib.notify({
                title = "Notification",
                description = "Sucessfully Teleported to "..args.label,
                type = "success"
            })
        end
    end)
    lib.showMenu("xilo_main_menu")
end

for key, value in pairs(Config.menuloc) do
    local point = lib.points.new({
        coords = value.loc,
        distance = 3,
    })
     
    function point:onEnter()
        lib.showTextUI('[E] - Open Teleports')
    end
     
    function point:onExit()
        if lib.isTextUIOpen() then
            lib.hideTextUI()
        end
    end
     
    function point:nearby()
        DrawMarker(27, value.loc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 0, 106, 254, 100, false, true, 2, false, nil, nil, false)
        if IsControlJustPressed(0, 38) then
            menu()
        end
    end
end

RegisterCommand("testteleports", function()
    menu()
end)