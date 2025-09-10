os.execute('ver')
--- STEAMODDED HEADER
--- MOD_NAME: Test
--- MOD_ID: TEST_STAS
--- MOD_AUTHOR: [solidusgadget_]
--- MOD_DESCRIPTION: 101 guys
--- PREFIX: xmpl
--- 
--- MOD CODE ---

local function checkOS(linux, windows, other)

end

SMODS.Atlas{
    key = "stas",
    path = "Stas.png",
    px=71,
    py=95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Joker{
    key = "stas",
    loc_txt = {
        name = "Bacon and Games Joker",
        text = {
            "{C:red}+4{} and {X:red,C:white}X1.5{} Mult on Windows",
            "or {C:red}+2{} and {X:red,C:white}X2.5{} Mult on Linux",
        }
    },
    atlas = "stas",
    pos = {x = 0, y=0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config =
        {extra =
            {
                -- умножение множителя
                Xmult = 1,
                -- плюс к множителю
                mult = 1,
            }
        },
    loc_vars = function(self,info_queue,center)
        return {vars =
            {
                center.ability.extra.Xmult,
                center.ability.extra.mult
            }
        }
    end,

    -- прок карты
    calculate = function(self,card,context)
        if context.joker_main then
            return{
                func = function()
                    -- линукс
                    if os.execute('uname -a') then
                        print(os.execute('uname -a'))
                        card.ability.extra.mult = 2
                        card.ability.extra.Xmult = 2.5

                        SMODS.calculate_effect({message = "linux"}, card)

                        SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                    -- винда
                    elseif os.execute("ver") then
                        card.ability.extra.mult = 4
                        card.ability.extra.Xmult = 1.5

                        SMODS.calculate_effect({message = "windows"}, card)

                        SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                    else
                        SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                    end
                end
            }
        end
    end,
}

--- MOD CODE END ---