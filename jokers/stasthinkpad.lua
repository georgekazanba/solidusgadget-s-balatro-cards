SMODS.Joker{
    key = "stas",
    loc_txt = {
        ["name"] = "ThinkPad Stas",
        ["text"] = {
            "{C:red}+2{} and {X:red,C:white}X2.5{} Mult on Windows",
            "or {C:red}+4{} and {X:red,C:white}X3{} Mult on any other OS",
            "but you instantly {C:red}lose the game{}."
        },
        ["unlock"] = {"Unlocked by default."}
    },

    atlas = "CustomJokers",
    pos = {x = 0, y=0},

    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    config =
        {extra =
            {
                -- умножение множителя
                XmultWin = 2.5,
                XmultOther = 3,
                -- плюс к множителю
                multWin = 2,
                multOther = 4,
            }
        },

    -- прок карты
    calculate = function(self,card,context)
        if context.cardarea == G.jokers and context.joker_main then
            if love.system.getOS() == "Windows" then
                return {
                    Xmult = card.ability.extra.XmultWin,
                    mult = card.ability.extra.multWin
                }
            else
                return {
                    Xmult = card.ability.extra.XmultOther,
                    mult = card.ability.extra.multOther,
                    extra = {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.5,
                                func = function()
                                    if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                    end
                                end
                            }))
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end,
}