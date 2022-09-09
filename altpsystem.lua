--Alternate Power-up System (NSMB-style)
--by PixelPest

local altpsystem = {};

local storedPower = false; --true if player has power-up other than mushroom
local canChange = false; --true if it is safe to change the player's power-up
local needChange = false; --true if the player's power-up needs to be changed

altpsystem.wii = false; --one of three possible power-up systems based on NSMBWii
altpsystem.ds = false; --one of three possible power-up systems based on NSMBDS
altpsystem.smw = false; --one of three possible power-up systems based on SMW

function altpsystem.onInitAPI()
   registerEvent(altpsystem, "onTick", "onTick", false);
end

function altpsystem.onTick()
	if player.powerup ~= PLAYER_BIG and player.powerup ~= PLAYER_SMALL then --if the player has a power-up other than a mushroom
		storedPower = true;
	end
	
	if player:mem(0x122,FIELD_WORD) == 2 and storedPower then --if the player is powering down (hit by an ememy but not killed)
		needChange = true; --the player's power-up needs to be changed from default, but cannot be yet, as it will cause an error while powering down
	end
	
	if player:mem(0x122,FIELD_WORD) ~= 2 and needChange then --if the player is not powering down
		canChange = true; --deem that it is safe to change the player's power-up
	end
	
	if canChange and needChange then --if the player's power-up needs to be changed and it is safe to change it
		player.powerup = PLAYER_BIG; --the player is now Big Mario
		canChange = false; --reset all values to false
		needChange = false;
		storedPower = false;
	end
	
	if (altpsystem.ds) and (altpsystem.wii == false) then
		if player.reservePowerup == 1 then
			player.reservePowerup = 0;
		end
	end
	
	if (altpsystem.wii) and (altpsystem.ds == false) then
		player.reservePowerup = 0;
	end
	
	if (player:mem(0x122,FIELD_WORD) == 2) and (altpsystem.smw) then
		player.dropItemKeyPressing = true;
	end
end

return altpsystem

--DISCLAIMER: Thanks to Eclipsed, MrDoubleA and the SMBX community for the help with all .lua scripts used in this episode. If a script is yours, contact me to be credited!