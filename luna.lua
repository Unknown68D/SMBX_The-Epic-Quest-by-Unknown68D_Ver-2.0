require("altpsystem")
--require("starCoinWarps") (Unused in favour of a different star coin system)
require("starcoin")
require("coyotetime")
require("peachspinjump")

local starcoin = require("npcs/ai/starcoin")
local collected = false

function onTick()
    if starcoin.getLevelCollected(Level.filename()) >= starcoin.count() and not collected then
        triggerEvent("Show Star")
        collected = true
    end
end

--DISCLAIMER: Thanks to Eclipsed, MrDoubleA and the SMBX community for the help with all .lua scripts used in this episode. If a script is yours, contact me to be credited!