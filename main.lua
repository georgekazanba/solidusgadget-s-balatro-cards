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
        name = "Stas ThinkPad",
        text = {
            "{X:red,C:white}X1.5{} Mult on Windows",
            "or {X:red,C:white}X2.5{} Mult on Linux",
        }
    },
    atlas = "stas",
    pos = {x = 0, y=0},
    config =
        {extra =
            {
                Xmult = function()
                    if os.execute('uname -a') then
                        return 2.5
                    elseif os.execute("ver") then
                        return 1.25
                    else
                        return 1
                    end
                end,
                multvar = function ()
                    if os.execute('uname -a') then
                        return 2.5
                    elseif os.execute("ver") then
                        return 1.25
                    else
                        return 1
                    end
                end
            }
        },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return{
                card=card,
                
                Xmult_mod = card.ability.extra.Xmult,
                message = "X" .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end,
}

--- MOD CODE END ---