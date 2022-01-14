Config = {}
Config.Categories = {"Armes de Melee","Armes de Poing","Mitrailleuses","Fusils à Pompes","Fusils d'assault"}
List = 1
VendeurIllegale = {
    Categories = {
        ArmesdeMelee = {
            {name = "gadget_parachute", label = "Parachute", PriceNumber = 50000, Prix = "50 000", color = "~r~"},
            {name = "weapon_molotov", label = "Molotov", PriceNumber = 50000,Prix = "50 000", color = "~r~"},
            {name = "weapon_molotov", label = "Couteau", PriceNumber = 160000,Prix = "160 000", color = "~r~"},
            {name = "weapon_hammer", label = "Marteau", PriceNumber = 210000,Prix = "210 000", color = "~r~"},
            {name = "weapon_machete", label = "Machete", PriceNumber = 280000,Prix = "280 000", color = "~r~"},
        },
        ArmesdePoing = {
            {name = "weapon_pistol", label = "Pistolet", PriceNumber = 360000,Prix = "360 000", color = "~r~"},
            {name = "weapon_pistol50", label = "Pistolet 50", PriceNumber = 410000,Prix = "410 000", color = "~r~"},
            {name = "weapon_doubleaction", label = "Pistolet double action", PriceNumber = 480000,Prix = "480 000", color = "~r~"},
        },
        Mitrailleuses = {
            {name = "weapon_doubleaction", label = "Tec-9", PriceNumber = 560000,Prix = "560 000", color = "~r~"},
            {name = "weapon_microsmg", label = "Mini-uzi", PriceNumber = 610000,Prix = "610 000", color = "~r~"},
            {name = "weapon_minismg", label = "Scorpion", PriceNumber = 680000,Prix = "680 000", color = "~r~"},
        },
        FusilsaPompes = {
            {name = "weapon_sawnoffshotgun", label = "Pompe", PriceNumber = 750000,Prix = "750 000", color = "~r~"},
        },
        Fusilsdassault = {
            {name = "weapon_compactrifle", label = "Mini AK-47", PriceNumber = 1050000,Prix = "1 050 000", color = "~r~"},
            {name = "weapon_assaultrifle", label = "AK-47", PriceNumber = 1350000,Prix = "1 350 000", color = "~r~"},
        },
    },
    Position = {
        {
            notif = "Appuyez sur [~b~E~s~] pour parler au vendeur",
            pos = vector3(2817.45, 1444.34, 24.74),
            ped = true, 
            modelped = "cs_andreas",
        },
    }
}
