--[[
Tank horde!
Author: Tanker
--]]

if RemoteDebugEnabled then
  require('RemoteDebug/mobdebug').start()
end

require('customMissionSettings')
require('customMissionLogic')

local big_buildings = {
	"ecosphere",
	"mining",
	"habitat",
}

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then
			return key
		end
    end
    return false
end

function buildingIsBig(unit_id) 
	return inTable(big_buildings, unit_id)
end

function addSmallUnitToSquareWithNoIntersection(unit_list, x1, y1, x2, y2, unit_id)
	do
		for x = x1, x2 do
			for y = y1, y2 do
				local conflict_exists = false;
				for unit_index, unit_item in ipairs(unit_list) do
					local building_extra_size = 0;
					if buildingIsBig(unit_item[3]) then
						building_extra_size = 1;
					end
					if (x == unit_item[1] or x == unit_item[1]+building_extra_size) and (y == unit_item[2] or y == unit_item[2]+building_extra_size) then
						conflict_exists = true;
					end
				end
				if not conflict_exists then
					unit_list[#unit_list+1] = { x, y, unit_id}
				end
			end
		end
	end
end



local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Snow_5.wrl'
testMatchSettings.mapName = 'Tank Horde'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 3, 'Player 1', Color(237, 237, 54, 255), false, '', 0))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 1, 'Player 2', Color(25, 116, 210, 255), true, '', 1))

local gameSettings =
{
    game_name = 'Tank Horde',
    game_description = 'Enemy tank horde is coming to your base! Defend your complex if you can!',
    uniset_name = "Original",
    start_gold = 1,
    ['amoun of material'] = {
        ['raw']  = 2,               -- values:0,1,2
        ['fuel'] = 1,               -- values:0,1,2
        ['gold'] = 1,               -- values:0,1,2
    },
    ['total count of resource placements'] = 280, -- ~500 is max
    ['laying ability'] = true,
    ['enable gasoline'] = false,
    ['survey flag'] = 2,
}
testMatchSettings:applySettings(gameSettings) 



-- Setup API to this instance
TheMatchSettings = testMatchSettings



local testMatchLogic = CustomMissionLogic()

local action_none, action_place, action_placeAndTurnOn = 0, 1, 2


local unitList1 = {
	{38, 36, "ecosphere"},
	{40, 38, "ecosphere"},
	{38, 40, "ecosphere"},
	{38, 38, "mining", action_placeAndTurnOn},
	{37, 37, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{37, 40, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
	{40, 37, "powergen", action_placeAndTurnOn},
	{40, 40, "powergen"},
	{37, 38, "powergen"},
	{37, 39, "powergen"},
	{35, 38, "habitat"},
}


addSmallUnitToSquareWithNoIntersection(unitList1, 34, 35, 42, 42, "road")

addSmallUnitToSquareWithNoIntersection(unitList1, 37, 32, 39, 32, "scout")
addSmallUnitToSquareWithNoIntersection(unitList1, 37, 36, 39, 36, "scout")
addSmallUnitToSquareWithNoIntersection(unitList1, 31, 38, 31, 40, "scout")
addSmallUnitToSquareWithNoIntersection(unitList1, 45, 38, 45, 40, "scout")

unitList1[#unitList1+1] = {34, 35, "miner", UNIT_PARAMETER_TYPE_MATERIAL, 20};
unitList1[#unitList1+1] = {42, 35, "miner", UNIT_PARAMETER_TYPE_MATERIAL, 20};
unitList1[#unitList1+1] = {34, 42, "miner", UNIT_PARAMETER_TYPE_MATERIAL, 20};
unitList1[#unitList1+1] = {42, 42, "miner", UNIT_PARAMETER_TYPE_MATERIAL, 20};
unitList1[#unitList1+1] = {38, 35, "asgun"};
unitList1[#unitList1+1] = {34, 38, "asgun"};
unitList1[#unitList1+1] = {34, 39, "asgun"};
unitList1[#unitList1+1] = {42, 38, "asgun"};
unitList1[#unitList1+1] = {42, 39, "asgun"};
unitList1[#unitList1+1] = {39, 42, "asgun"};
unitList1[#unitList1+1] = {36, 37, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50};
unitList1[#unitList1+1] = {35, 37, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30};



local unitList2 = {

  {57, 26, "scanner"},
  {25, 19, "scanner"},
  {23, 56, "scanner"},
  {47, 28, "scout"},
  {27, 46, "scout"},

}

addSmallUnitToSquareWithNoIntersection(unitList2, 53, 27, 58, 28, "tank")
addSmallUnitToSquareWithNoIntersection(unitList2, 22, 17, 27, 18, "tank")
addSmallUnitToSquareWithNoIntersection(unitList2, 21, 57, 26, 58, "tank")


testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)

local data1 = {gold = 0, cameraX = 39, cameraY = 39, cameraZoom = 1}
local data2 = {gold = 0, cameraX = 50, cameraY = 30, cameraZoom = 1.5}

testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)



function testMatchLogic:onMapLoaded(game, match)

  local map = match:getMap()
  map:placeInitialResources(38, 38)

end



function testMatchLogic:onMatchLoaded(game, match)

  match:playerAtIndex(2):addEnemyLocation(Rect(36, 37, 42, 42), 5)

end



function testMatchLogic:onMatchPrepared(game, match)

end



-- Setup API to this instance
TheMatchLogic = testMatchLogic

-- Unit Tests
if not MAXTouch then
  print()
  print('------ Settings DEBUG ------')
  CustomMatchSettingsDEBUG()
  print('------ Logic DEBUG ------')
  CustomMatchLogicDEBUG()
end
