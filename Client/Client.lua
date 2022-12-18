local devEnabled = false

RegisterCommand("toggledev", function(source)
    if devEnabled then
        devEnabled = false
    else
        devEnabled = true
    end
end)

-- Weapon Hash
local weaponHashList = {
    WEAPON_UNARMED = 0xA2719263,2725352035,
    WEAPON_ANIMAL = 0xF9FBAEBE,4194021054,
    WEAPON_COUGAR = 0x08D4BE52,148160082,
    WEAPON_KNIFE = 0x99B507EA,2578778090,
    WEAPON_NIGHTSTICK = 0x678B81B1,1737195953,
    WEAPON_HAMMER = 0x4E875F73,1317494643,
    WEAPON_BAT = 0x958A4A8F,2508868239,
    WEAPON_GOLFCLUB = 0x440E4788,1141786504,
    WEAPON_CROWBAR = 0x84BD7BFD,2227010557,
    WEAPON_PISTOL = 0x1B06D571,453432689,
    WEAPON_COMBATPISTOL = 0x5EF9FEC4,1593441988,
    WEAPON_APPISTOL = 0x22D8FE39,584646201,
    WEAPON_PISTOL50 = 0x99AEEB3B,2578377531,
    WEAPON_MICROSMG = 0x13532244,324215364,
    WEAPON_SMG = 0x2BE6766B,736523883,
    WEAPON_ASSAULTSMG = 0xEFE7E2DF,4024951519,
    WEAPON_ASSAULTRIFLE = 0xBFEFFF6D,3220176749,
    WEAPON_CARBINERIFLE = 0x83BF0278,2210333304,
    WEAPON_ADVANCEDRIFLE = 0xAF113F99,2937143193,
    WEAPON_MG = 0x9D07F764,2634544996,
    WEAPON_COMBATMG = 0x7FD62962,2144741730,
    WEAPON_PUMPSHOTGUN = 0x1D073A89,487013001,
    WEAPON_SAWNOFFSHOTGUN = 0x7846A318,2017895192,
    WEAPON_ASSAULTSHOTGUN = 0xE284C527,3800352039,
    WEAPON_BULLPUPSHOTGUN = 0x9D61E50F,2640438543,
    WEAPON_STUNGUN = 0x3656C8C1,911657153,
    WEAPON_SNIPERRIFLE = 0x05FC3C11,100416529,
    WEAPON_HEAVYSNIPER = 0x0C472FE2,205991906,
    WEAPON_REMOTESNIPER = 0x33058E22,856002082,
    WEAPON_GRENADELAUNCHER = 0xA284510B,2726580491,
    WEAPON_GRENADELAUNCHER_SMOKE = 0x4DD2DC56,1305664598,
    WEAPON_RPG = 0xB1CA77B1,2982836145,
    WEAPON_PASSENGER_ROCKET = 0x166218FF,375527679,
    WEAPON_AIRSTRIKE_ROCKET = 0x13579279,324506233,
    WEAPON_STINGER = 0x687652CE,1752584910,
    WEAPON_MINIGUN = 0x42BF8A85,1119849093,
    WEAPON_GRENADE = 0x93E220BD,2481070269,
    WEAPON_STICKYBOMB = 0x2C3731D9,741814745,
    WEAPON_SMOKEGRENADE = 0xFDBC8A50,4256991824,
    WEAPON_BZGAS = 0xA0973D5E,2694266206,
    WEAPON_MOLOTOV = 0x24B17070,615608432,
    WEAPON_FIREEXTINGUISHER = 0x060EC506,101631238,
    WEAPON_PETROLCAN = 0x34A67B97,883325847,
    WEAPON_DIGISCANNER = 0xFDBADCED,4256881901,
    WEAPON_BRIEFCASE = 0x88C78EB7,2294779575,
    WEAPON_BRIEFCASE_02 = 0x01B79F17,28811031,
    WEAPON_BALL = 0x23C9F95C,600439132,
    WEAPON_FLARE = 0x497FACC3,1233104067,
    WEAPON_VEHICLE_ROCKET = 0xBEFDC581,3204302209,
    WEAPON_BARBED_WIRE = 0x48E7B178,1223143800,
    WEAPON_DROWNING = 0xFF58C4FB,4284007675,
    WEAPON_DROWNING_IN_VEHICLE = 0x736F5990,1936677264,
    WEAPON_BLEEDING = 0x8B7333FB,2339582971,
    WEAPON_ELECTRIC_FENCE = 0x92BD4EBB,2461879995,
    WEAPON_EXPLOSION = 0x2024F4E8,539292904,
    WEAPON_FALL = 0xCDC174B0,3452007600,
    WEAPON_EXHAUSTION = 0x364A29EC,910830060,
    WEAPON_HIT_BY_WATER_CANNON = 0xCC34325E,3425972830,
    WEAPON_RAMMED_BY_CAR = 0x07FC7D7A,133987706,
    WEAPON_RUN_OVER_BY_CAR = 0xA36D413E,2741846334,
    WEAPON_HELI_CRASH = 0x145F1012,341774354,
    WEAPON_FIRE = 0xDF8E89EB,3750660587,
    
    WEAPON_SNSPISTOL = 0xBFD21232,3218215474,
    WEAPON_BOTTLE = 0xF9E6AA4B,4192643659,
    
    WEAPON_GUSENBERG = 0x61012683,1627465347,
    
    WEAPON_SPECIALCARBINE = 0xC0A3098D,3231910285,
    WEAPON_HEAVYPISTOL = 0xD205520E,3523564046,
    
    WEAPON_BULLPUPRIFLE = 0x7F229F94,2132975508,
    
    WEAPON_DAGGER = 0x92A27487,2460120199,
    WEAPON_VINTAGEPISTOL = 0x083839C4,137902532,
    
    WEAPON_FIREWORK = 0x7F7497E5,2138347493,
    WEAPON_MUSKET = 0xA89CB99E,2828843422,
    
    WEAPON_HEAVYSHOTGUN = 0x3AABBBAA,984333226,
    WEAPON_MARKSMANRIFLE = 0xC734385A,3342088282,
    
    WEAPON_HOMINGLAUNCHER = 0x63AB0442,1672152130,
    WEAPON_PROXMINE = 0xAB564B93,2874559379,
    WEAPON_SNOWBALL = 0x787F0BB,126349499,
    
    WEAPON_FLAREGUN = 0x47757124,1198879012,
    WEAPON_GARBAGEBAG = 0xE232C28C,3794977420,
    WEAPON_HANDCUFFS = 0xD04C944D,3494679629,
    
    WEAPON_COMBATPDW = 0x0A3D4D34,171789620,
    
    WEAPON_MARKSMANPISTOL = 0xDC4DB296,3696079510,
    WEAPON_KNUCKLE = 0xD8DF3C3C,3638508604,
    
    WEAPON_HATCHET = 0xF9DCBF2D,4191993645,
    WEAPON_RAILGUN = 0x6D544C99,1834241177,
    
    WEAPON_MACHETE = 0xDD5DF8D9,3713923289,
    WEAPON_MACHINEPISTOL = 0xDB1AA450,3675956304,
    
    WEAPON_AIR_DEFENCE_GUN = 0x2C082D7D,738733437,
    WEAPON_SWITCHBLADE = 0xDFE37640,3756226112,
    WEAPON_REVOLVER = 0xC1B3C3D1,3249783761,
    
    WEAPON_DBSHOTGUN = 0xEF951FBB,4019527611,
    WEAPON_COMPACTRIFLE = 0x624FE830,1649403952,
    
    WEAPON_AUTOSHOTGUN = 0x12E82D3D,317205821,
    WEAPON_BATTLEAXE = 0xCD274149,3441901897,
    WEAPON_COMPACTLAUNCHER = 0x0781FE4A,125959754,
    WEAPON_MINISMG = 0xBD248B55,3173288789,
    WEAPON_PIPEBOMB = 0xBA45E8B8,3125143736,
    WEAPON_POOLCUE = 0x94117305,2484171525,
    WEAPON_WRENCH = 0x19044EE0,419712736
}
-- Weapon Hash
function getWeaponSpawnName(weaponHash)
    local finalWeaponName
    for k, v in pairs(weaponHashList) do
        if v == weaponHash then
            finalWeaponName = k
        end
    end
    if finalWeaponName ~= nil and finalWeaponName ~= "" then
        return(finalWeaponName)
    end
    return "UNKOWN"
end

local invailidChars = {
    "~r~",
    "~b~",
    "~g~",
    "~y~",
    "~p~",
    "~c~",
    "~m~",
    "~u~",
    "~o~",
}

function removeAllInvailidChars(coords)
    local coords = coords
    for k, v in pairs(invailidChars) do
        coords = coords:gsub(v, "")
    end
    return coords
end

local thisObjects = {}
local Content = {}

table.insert(thisObjects, {name = "ID", method = "playerId"}) -- 1
table.insert(thisObjects, {name = "Coords", method = "playerCoords"}) -- 2
table.insert(thisObjects, {name = "Heading", method = "heading"}) -- 3
table.insert(thisObjects, {name = "WeaponHash", method = "playerWeaponHash"}) -- 4
table.insert(thisObjects, {name = "WeaponName", method = "playerWeaponName"}) -- 5
table.insert(thisObjects, {name = "VehicleHash", method = "vehicleHash"}) -- 6
table.insert(thisObjects, {name = "VehicleDisplayName", method = "vehicleDisplayName"}) -- 7
table.insert(thisObjects, {name = "Vehicle Body Health", method = "vehicleBodyHealth"}) -- 8
table.insert(thisObjects, {name = "Vehicle Engine Health", method = "vehicleEngineHealth"}) -- 9
table.insert(thisObjects, {name = "Vehicle Fuel", method = "vehicleFuel"}) -- 0
-- WARNING: DO NOT ADD MORE THEN 10!!!

Citizen.CreateThread(function()
    while true do
        if devEnabled then
            local plyId = GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))
            local plyCoords = GetEntityCoords(PlayerPedId())
            local plyHeading = GetEntityHeading(PlayerPedId())
            local plyWeaponHash = GetSelectedPedWeapon(PlayerPedId())
            if IsPedInAnyVehicle(PlayerPedId()) then
                plyCarHash = GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))
            else
                plyCarHash = "UNKOWN VEHICLE"
            end
            local finalValue
            local posX = 0.04
            local posY = 0.4
            local count = 0
            for k, v in pairs(thisObjects) do 
                count = count + 1
                if v.method == "playerId" then
                    finalValue = plyId .. " "
                elseif v.method == "playerCoords" then
                    finalValue = "~g~" .. plyCoords.x .. ",~b~" .. plyCoords.y .. ",~o~" .. plyCoords.z
                elseif v.method == "heading" then
                    finalValue = plyHeading
                elseif v.method == "playerWeaponHash" then
                    if plyWeaponHash then
                        finalValue = plyWeaponHash
                    else
                        finalValue = "NULL"
                    end
                elseif v.method == "playerWeaponName" then
                    finalValue = getWeaponSpawnName(plyWeaponHash)
                elseif v.method == "vehicleHash" then
                    finalValue = plyCarHash
                elseif v.method == "vehicleDisplayName" then
                    if GetDisplayNameFromVehicleModel(plyCarHash) then
                        finalValue = GetDisplayNameFromVehicleModel(plyCarHash)
                    else
                        finalValue = "UNKOWN VEHICLE"
                    end
                elseif v.method == "vehicleBodyHealth" then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        finalValue = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId(), false))
                    else
                        finalValue = "NOT IN A VEHICLE"
                    end
                elseif v.method == "vehicleEngineHealth" then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        finalValue = GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), false))
                    else
                        finalValue = "NOT IN A VEHICLE"
                    end
                elseif v.method == "vehicleFuel" then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        finalValue = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))
                    else
                        finalValue = "NOT IN A VEHICLE"
                    end
                end

                if count == 10 then
                    count = 0
                end

                Content[count] = finalValue

                posY = posY + 0.02
                SetTextScale(0.42, 0.42)        
                SetTextFont(4)        
                SetTextOutline()        
                BeginTextCommandDisplayText("STRING")
                if count == 0 then
                    AddTextComponentSubstringPlayerName("~r~" .. v.name .."~o~: ~y~" .. finalValue.. " ~w~| Copy with: ALT + " .. "CAPSLOCK")        
                else
                    AddTextComponentSubstringPlayerName("~r~" .. v.name .."~o~: ~y~" .. finalValue.. " ~w~| Copy with: ALT + " .. count)        
                end
                EndTextCommandDisplayText(posX, posY)
            end

            if IsControlPressed(1, 19) then
                if IsControlJustPressed(1, 157) then
                    SendNUIMessage({
                        copyThis = Content[1]
                    })
                elseif IsControlJustPressed(1, 158) then
                    local coordsContent = Content[2]
                    coordsContent = removeAllInvailidChars(coordsContent)
                    SendNUIMessage({
                        copyThis = coordsContent
                    })
                elseif IsControlJustPressed(1, 160) then
                    SendNUIMessage({
                        copyThis = Content[3]
                    })
                elseif IsControlJustPressed(1, 164) then
                    SendNUIMessage({
                        copyThis = Content[4]
                    })
                elseif IsControlJustPressed(1, 165) then
                    SendNUIMessage({
                        copyThis = Content[5]
                    })
                elseif IsControlJustPressed(1, 159) then
                    SendNUIMessage({
                        copyThis = Content[6]
                    })
                elseif IsControlJustPressed(1, 161) then
                    SendNUIMessage({
                        copyThis = Content[7]
                    })
                elseif IsControlJustPressed(1, 162) then
                    SendNUIMessage({
                        copyThis = Content[8]
                    })
                elseif IsControlJustPressed(1, 163) then
                    SendNUIMessage({
                        copyThis = Content[9]
                    })
                elseif IsControlJustPressed(1, 217) then
                    SendNUIMessage({
                        copyThis = Content[0]
                    })
                end
            end
        end
    Wait(0)
    end
end)

--[[
- Created by zImSkillz
- Created at 02:59 GMT+1
- DD/MM/YYYY
- 18.12.2022
]]--