local starcoin = require("npcs/ai/starcoin")
--local collected = false

function onTick()
    --if starcoin.getLevelCollected(Level.filename()) >= starcoin.count() and not collected then
    if starcoin.getLevelCollected(Level.filename()) >= starcoin.count() then
        triggerEvent("Show Star")
    else
        triggerEvent("Hide Star")
    end
end

--*All commented code was used in previous versions!
--DISCLAIMER: Thanks to Eclipsed, MrDoubleA and the SMBX community for the help with all .lua scripts used in this episode. If a script is yours, contact me to be credited!