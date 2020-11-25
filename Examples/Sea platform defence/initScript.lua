--[[
Sea platform defence
Author: Tanker
--]]

if RemoteDebugEnabled then
  require('RemoteDebug/mobdebug').start()
end

require('customMissionSettings')
require('customMissionLogic')



-- resources should be placed first!
function putUnitMiningWithDefaultSettings(match, player_index, x, y)
  local unit_mining = match:playerAtIndex(player_index):createUnit(x, y, 'mining')
  unit_mining:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, unit_mining:getParameterMaxValue(UNIT_PARAMETER_TYPE_MATERIAL))
  unit_mining:turnOn()
  unit_mining:placeUnitOnMap(false)
  return unit_mining
end

function putFilledAndEnabledMiningWithResoucesOnMap(match, player_index, x, y)
  local map = match:getMap()
  map:placeInitialResources(x, y)
  return putUnitMiningWithDefaultSettings(match, player_index, x, y)
end


local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Green_5.wrl'
testMatchSettings.mapName = 'Sea platform defence'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 5, 'Player 1', Color(97, 36, 4, 255), false, '', 0))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 1, 'Player 2', Color(48, 93, 4, 255), true, '', 1))

local gameSettings =
{
    game_name = testMatchSettings.mapName,
    game_description = 'A huge enemy sea fleet is coming when just a small enemy air fleet was expected in the area! You have plenty of resources from mining on your water platform. Is it enough to build the defence?',
    uniset_name = "M.A.X.Touch",
    uniset_id = 44,
    start_gold = 1,
    ['amoun of material'] = {
        ['raw']  = 2,               -- values:0,1,2
        ['fuel'] = 1,               -- values:0,1,2
        ['gold'] = 1,               -- values:0,1,2
    },
    ['total count of resource placements'] = 280, -- ~500 is max
    ['laying ability'] = true,
    ['enable gasoline'] = true,
    ['survey flag'] = 1,
}
testMatchSettings:applySettings(gameSettings) 



-- Setup API to this instance
TheMatchSettings = testMatchSettings



local testMatchLogic = CustomMissionLogic()

local action_none, action_place, action_placeAndTurnOn = 0, 1, 2


local unitList1 = {
  
  {54, 57, "plat"},
  {55, 57, "plat"},
  {56, 57, "plat"},
  {57, 57, "plat"},
  {58, 57, "plat"},
  {61, 57, "plat"},
  {62, 57, "plat"},
  {63, 57, "plat"},
  {64, 57, "plat"},
  {65, 57, "plat"},
  {66, 57, "plat"},
  {67, 57, "plat"},
  {67, 56, "plat"},
  {66, 56, "plat"},
  {65, 56, "plat"},
  {64, 56, "plat"},
  {63, 56, "plat"},
  {62, 56, "plat"},
  {61, 56, "plat"},
  {60, 56, "plat"},
  {59, 56, "plat"},
  {58, 56, "plat"},
  {57, 56, "plat"},
  {56, 56, "plat"},
  {55, 56, "plat"},
  {54, 56, "plat"},
  {65, 55, "plat"},
  {66, 54, "plat"},
  {66, 55, "plat"},
  {65, 54, "plat"},
  {67, 54, "plat"},
  {67, 55, "plat"},
  {65, 53, "plat"},
  {66, 53, "plat"},
  {67, 53, "plat"},
  {67, 52, "plat"},
  {67, 51, "plat"},
  {67, 50, "plat"},
  {67, 49, "plat"},
  {66, 49, "plat"},
  {65, 49, "plat"},
  {65, 50, "plat"},
  {66, 50, "plat"},
  {66, 51, "plat"},
  {66, 52, "plat"},
  {65, 52, "plat"},
  {65, 51, "plat"},
  {66, 58, "plat"},
  {66, 59, "plat"},
  {66, 60, "plat"},
  {66, 61, "plat"},
  {66, 62, "plat"},
  {66, 63, "plat"},
  {65, 64, "plat"},
  {65, 63, "plat"},
  {66, 64, "plat"},
  {65, 62, "plat"},
  {65, 61, "plat"},
  {65, 60, "plat"},
  {65, 59, "plat"},
  {65, 58, "plat"},
  {64, 58, "plat"},
  {64, 59, "plat"},
  {64, 60, "plat"},
  {64, 61, "plat"},
  {64, 62, "plat"},
  {64, 63, "plat"},
  {64, 64, "plat"},
  {54, 55, "plat"},
  {53, 54, "plat"},
  {52, 53, "plat"},
  {51, 53, "plat"},
  {50, 53, "plat"},
  {50, 54, "plat"},
  {50, 55, "plat"},
  {53, 55, "plat"},
  {52, 54, "plat"},
  {51, 54, "plat"},
  {51, 55, "plat"},
  {52, 55, "plat"},
  {53, 53, "plat"},
  {54, 53, "plat"},
  {54, 54, "plat"},
  {54, 52, "plat"},
  {53, 52, "plat"},
  {52, 52, "plat"},
  {51, 52, "plat"},
  {50, 52, "plat"},
  {49, 52, "plat"},
  {49, 53, "plat"},
  {49, 54, "plat"},
  {49, 55, "plat"},
  {49, 56, "plat"},
  {49, 57, "plat"},
  {63, 58, "plat"},
  {63, 59, "plat"},
  {63, 60, "plat"},
  {63, 61, "plat"},
  {63, 62, "plat"},
  {63, 63, "plat"},
  {63, 64, "plat"},
  {64, 55, "plat"},
  {64, 54, "plat"},
  {64, 53, "plat"},
  {64, 52, "plat"},
  {64, 51, "plat"},
  {64, 50, "plat"},
  {64, 49, "plat"},
  {65, 45, "bridge"},
  {65, 44, "bridge"},
  {65, 46, "bridge"},
  {65, 47, "bridge"},
  {65, 48, "bridge"},
  {49, 59, "bridge"},
  {49, 60, "bridge"},
  {49, 61, "bridge"},
  {49, 62, "bridge"},
  {49, 63, "bridge"},
  
  {68, 57, "bridge"},
  {69, 57, "bridge"},
  {70, 57, "bridge"},
  {70, 58, "bridge"},

  {48, 52, "bridge"},
  {47, 52, "bridge"},
  {46, 52, "bridge"},
  {45, 52, "bridge"},
  {44, 52, "bridge"},
  
  {62, 58, "plat"},
  {61, 58, "plat"},
  {61, 59, "plat"},
  {62, 59, "plat"},
  {61, 59, "radar"},
  
  {53, 57, "plat"},
  {53, 55, "conn"},
  {54, 56, "conn"},
  {55, 56, "conn"},
  {56, 56, "conn"},
  {57, 56, "conn"},
  {58, 56, "conn"},
  {59, 56, "conn"},
  {60, 56, "conn"},
  {61, 56, "conn"},
  {62, 56, "conn"},
  {63, 56, "conn"},
  {64, 56, "conn"},
  {65, 57, "conn"},
  {65, 56, "conn"},
  {66, 49, "conn"},
  {66, 48, "conn"},
  {66, 47, "conn"},
  {66, 46, "conn"},
  {66, 45, "conn"},
  {66, 44, "conn"},
  {66, 43, "conn"},
  {66, 42, "conn"},
  {65, 40, "lightplant"},
  {67, 40, "hvplant"},
  {53, 56, "plat"},
  {52, 56, "plat"},
  {51, 56, "plat"},
  {50, 56, "plat"},
  {50, 58, "plat"},
  {50, 57, "plat"},
  {51, 57, "plat"},
  {52, 57, "plat"},
  {54, 58, "plat"},
  {53, 58, "plat"},
  {52, 58, "plat"},
  {51, 58, "plat"},
  {49, 58, "plat"},
  {52, 56, "powerpl", action_placeAndTurnOn},
  {50, 56, "powerpl", action_placeAndTurnOn},
  {55, 58, "plat"},
  {56, 58, "plat"},
  {57, 58, "plat"},
  {58, 58, "plat"},
  {59, 58, "plat"},
  {60, 58, "plat"},
  {59, 57, "plat"},
  {60, 57, "plat"},
  
  
  {55, 57, "engineer"},
  {59, 58, "repair"},
  {59, 54, "seacargo"},
  {59, 55, "seafuel"},
  
  {59, 57, "matstore"},
  {58, 57, "matstore"},
  {57, 57, "matstore"},
  {56, 57, "matstore"},
  {60, 57, "fuelstore"},
  {61, 57, "fuelstore"},
  {49, 52, "road"},
  {50, 52, "road"},
  {51, 52, "road"},
  {52, 52, "road"},
  {53, 52, "road"},
  {54, 52, "road"},
  {54, 53, "road"},
  {54, 54, "road"},
  {54, 55, "road"},
  {54, 56, "road"},
  {54, 57, "road"},
  {54, 58, "road"},
  {53, 58, "road"},
  {52, 58, "road"},
  {51, 58, "road"},
  {50, 58, "road"},
  {49, 58, "road"},
  {49, 57, "road"},
  {49, 56, "road"},
  {49, 55, "road"},
  {49, 54, "road"},
  {49, 53, "road"},
  {50, 55, "road"},
  {51, 55, "road"},
  {52, 55, "road"},
  {53, 55, "road"},
  {64, 49, "road"},
  {65, 49, "road"},
  {66, 49, "road"},
  {67, 49, "road"},
  {67, 50, "road"},
  {67, 51, "road"},
  {67, 52, "road"},
  {67, 53, "road"},
  {67, 54, "road"},
  {67, 55, "road"},
  {67, 56, "road"},
  {67, 57, "road"},
  {66, 57, "road"},
  {66, 58, "road"},
  {66, 59, "road"},
  {66, 60, "road"},
  {66, 61, "road"},
  {66, 62, "road"},
  {66, 63, "road"},
  {66, 64, "road"},
  {65, 64, "road"},
  {64, 64, "road"},
  {63, 64, "road"},
  {63, 63, "road"},
  {63, 62, "road"},
  {63, 61, "road"},
  {63, 60, "road"},
  {63, 59, "road"},
  {63, 58, "road"},
  {63, 57, "road"},
  {63, 56, "road"},
  {64, 56, "road"},
  {65, 56, "road"},
  {66, 56, "road"},
  {65, 57, "road"},
  {64, 57, "road"},
  {64, 55, "road"},
  {64, 54, "road"},
  {64, 53, "road"},
  {64, 52, "road"},
  {64, 51, "road"},
  {64, 50, "road"},
  {62, 56, "road"},
  {61, 56, "road"},
  {60, 56, "road"},
  {59, 56, "road"},
  {58, 56, "road"},
  {57, 56, "road"},
  {56, 56, "road"},
  {55, 56, "road"},
  {55, 57, "road"},
  {55, 58, "road"},
  {56, 58, "road"},
  {57, 58, "road"},
  {58, 58, "road"},
  {59, 58, "road"},
  {60, 58, "road"},
  {61, 58, "road"},
  {62, 58, "road"},
  {62, 57, "road"},
  {62, 59, "road"},
  {65, 43, "road"},
  {65, 42, "road"},
  {66, 42, "road"},
  {67, 42, "road"},
  {68, 42, "road"},
  {26, 56, "scout"},
  {26, 68, "scout"},
  {31, 76, "scout"},
  {54, 79, "scout"},
  {65, 78, "scout"},
  {46, 79, "scout"},
  {68, 69, "scout"},
  {68, 43, "scanner"},
  {38, 45, "scout"},
  {47, 64, "asgun"},
  {46, 64, "asgun"},
  {45, 64, "asgun"},
  {44, 64, "asgun"},
  {43, 64, "asgun"},
  {42, 64, "aagunm"},
  {42, 63, "aagunm"},
  {63, 40, "aagunm"},
  {63, 41, "aagunm"},
  --{64, 40, "aagunm"},
  --{64, 41, "aagunm"},
  --{41, 63, "aagunm"},
  --{41, 64, "aagunm"},
  {48, 58, "plat"},
  {49, 51, "plat"},
  {68, 49, "plat"},
  {66, 65, "plat"},
  {48, 58, "zenit"},
  {49, 51, "zenit"},
  {68, 49, "zenit"},
  {66, 65, "zenit"},
  {63, 45, "escort"},
  {62, 45, "escort"},
  {52, 66, "escort"},
  {53, 66, "escort"},
  {31, 57, "escort"},
  {32, 57, "escort"},
  {33, 57, "corvette"},
  {34, 57, "corvette"},
  {54, 66, "corvette"},
  {55, 66, "corvette"},
  {61, 45, "corvette"},
  {60, 45, "corvette"},
  {59, 45, "gunboat"},
  {58, 45, "gunboat"},
  {35, 57, "gunboat"},
  {36, 57, "gunboat"},
  {56, 66, "gunboat"},
  {57, 66, "gunboat"},
  {64, 57, "engineer"},
  {68, 42, "asgun"},
  {67, 42, "asgun"},
  {66, 42, "asgun"},
  {65, 42, "asgun"},
  {64, 42, "asgun"},
  
  {40, 48, "asgun"},
  {42, 48, "aagunm"},
  
  
  {74, 62, "asgun"},
  {72, 62, "aagunm"},
  {76, 63, "scout"},
  
}





local unitList2 = {

  {48, 7, "awac"},
  {46, 7, "bomber"},
  {45, 7, "bomber"},
  {44, 7, "bomber"},
  {43, 7, "bomber"},
  {42, 7, "bomber"},
  {41, 7, "bomber"},
  {49, 29, "awac"},
  {37, 34, "awac"},
  
  {96, 9, "corvette"},
  {97, 9, "corvette"},
  {98, 9, "corvette"},
  {99, 9, "corvette"},
  {100, 9, "corvette"},
  {101, 9, "corvette"},
  {96, 11, "gunboat"},
  {97, 11, "gunboat"},
  {98, 11, "gunboat"},
  {99, 11, "gunboat"},
  {100, 11, "gunboat"},
  {101, 11, "gunboat"},
  {95, 17, "corvette"},
  {95, 18, "corvette"},
  {95, 19, "corvette"},
  {95, 20, "corvette"},
  {95, 21, "corvette"},
  {95, 22, "corvette"},
  {95, 23, "corvette"},
  {105, 9, "gunboat"},
  {105, 10, "gunboat"},
  {105, 11, "gunboat"},
  {105, 12, "gunboat"},
  {105, 13, "gunboat"},
  {105, 14, "gunboat"},
  {109, 9, "rokcr"},
  {109, 10, "rokcr"},
  {109, 11, "rokcr"},
  {109, 12, "rokcr"},
  {109, 13, "rokcr"},
  {109, 14, "rokcr"},
  {77, 31, "awac"},
  {100, 16, "awac"},

  {79, 109, "sub"},
  {80, 109, "sub"},
  {81, 109, "sub"},
  {82, 109, "sub"},
  {83, 109, "sub"},
  {84, 109, "sub"},
  {85, 109, "sub"},
  {86, 109, "sub"},
  {87, 109, "sub"},
  {88, 109, "sub"},
  
  {86, 107, "corvette"},
  {85, 107, "corvette"},
  {84, 107, "corvette"},
  {87, 107, "corvette"},
  {88, 107, "corvette"},
  
  {71, 89, "awac"},
  
  {90, 109, "awac"},
  {92, 109, "bomber"},
  {93, 109, "bomber"},
  {94, 109, "bomber"},
  
  --{57, 52, "sub"},
  --{57, 51, "corvette"},
  
  {18, 66, "awac"},
  {3, 51, "awac"},
  {3, 78, "awac"},
  {3, 53, "bomber"},
  {3, 54, "bomber"},
  {3, 55, "bomber"},
  {3, 59, "gunboat"},
  {3, 60, "gunboat"},
  {3, 61, "gunboat"},
  {3, 62, "gunboat"},
  {3, 63, "gunboat"},
  {3, 64, "gunboat"},
  {3, 65, "gunboat"},
  {5, 59, "corvette"},
  {5, 60, "corvette"},
  {5, 61, "corvette"},
  {5, 62, "corvette"},
  {5, 63, "corvette"},

}


testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)

local data1 = {gold = 0, cameraX = 50, cameraY = 50, cameraZoom = 1}
local data2 = {gold = 0, cameraX = 50, cameraY = 30, cameraZoom = 1.5}

testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)



function testMatchLogic:onMapLoaded(game, match)

  --local map = match:getMap()
  --map:placeInitialResources(38, 38)

end



function testMatchLogic:onMatchLoaded(game, match)
  
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 65, 50)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 65, 52)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 65, 54)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 64, 62)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 64, 60)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 64, 58)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 50, 53)
  putFilledAndEnabledMiningWithResoucesOnMap(match, 1, 52, 53)

  --match:playerAtIndex(1):addUnitTypeUpgrade("turret", UNIT_PARAMETER_TYPE_ATTACK, 2)
  --match:playerAtIndex(1):addUnitTypeUpgrade("turret", UNIT_PARAMETER_TYPE_HEALTH, 2)
  --match:playerAtIndex(1):addUnitTypeUpgrade("arturret", UNIT_PARAMETER_TYPE_ATTACK, 2)
  --match:playerAtIndex(1):addUnitTypeUpgrade("arturret", UNIT_PARAMETER_TYPE_HEALTH, 2)
  match:playerAtIndex(2):addEnemyLocation(Rect(50, 50, 10, 10), 5)

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
