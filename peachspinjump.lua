local PeachSpin = {} --Package table

function PeachSpin.onInitAPI() --Is called when the api is loaded by loadAPI.
    registerEvent(PeachSpin, "onInputUpdate", "onInputUpdate", true);
end

function PeachSpin.onInputUpdate()
    if player.altJumpKeyPressing == true and player:mem(0x12E, FIELD_WORD) == 0 and (player:mem(0x146, FIELD_WORD) ~= 0 or player:mem(0x48, FIELD_WORD) ~= 0 or player:mem(0x176, FIELD_WORD) ~= 0) then
        player:mem(0x50, FIELD_WORD, -1)
        local myTailSound = Audio.SfxOpen("tail.ogg")
        Audio.sounds[1].sfx = myTailSound
    end
    if player.jumpKeyPressing == true then
        Audio.sounds[1].sfx = nil
    end
end

return PeachSpin --Return the package when the api is getting loaded.

--DISCLAIMER: Thanks to Eclipsed, MrDoubleA and the SMBX community for the help with all .lua scripts used in this episode. If a script is yours, contact me to be credited!