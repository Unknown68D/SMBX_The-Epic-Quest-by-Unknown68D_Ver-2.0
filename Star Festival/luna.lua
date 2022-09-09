-- Credit to @MrDoubleA#3124 on Discord for the following code

-- Purple coin HUD
do
    local textplus = require("textplus")

    local img = Graphics.loadImageResolved("purpleCoins.png")
    local npcID = 251


    local function getNPCCount(id)
        local count = 0

        for _,npc in NPC.iterate(id) do
            if not npc.isGenerator then
                count = count + 1
            end
        end

        return count
    end


    local totalCount = 0
    function onStart()
        totalCount = getNPCCount(npcID)
    end


    local textFont = textplus.loadFont("textplus/font/1.ini")
    local textLayouts = {}

    local offset = vector(0,80)
    local gapSize = 8

    local function purpleCoinCounter(camIdx,priority,isSplit)
        -- Get some stuff
        local c = Camera(camIdx)

        local text = (totalCount-getNPCCount(npcID)).. "/".. totalCount

        textLayouts[text] = textLayouts[text] or textplus.layout(text,nil,{font = textFont,plaintext = true})
        local layout = textLayouts[text]


        local totalWidth = (img.width+Graphics.sprites.hardcoded["33-1"].img.width+layout.width+(gapSize*2))
        local left = (c.width/2)-(totalWidth/2)+offset.x


        -- Draw it!
        Graphics.drawImageWP(img,left,offset.y-2,priority)
        Graphics.drawImageWP(Graphics.sprites.hardcoded["33-1"].img,left+img.width+gapSize,offset.y,priority)

        textplus.render{
            layout = layout,priority = priority,
            x = left+totalWidth-layout.width,y = offset.y,
        }
    end

    Graphics.addHUDElement(purpleCoinCounter)
end