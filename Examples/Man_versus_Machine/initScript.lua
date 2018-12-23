--[[
Man versus Machine!
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


local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Desert_4.wrl'
testMatchSettings.mapName = 'Man versus Machine'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 2, 'Player 1', Color(97, 36, 4, 255), false, '', 0))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 4, 'Player 2', Color(48, 93, 4, 255), true, '', 1))

local gameSettings =
{
    game_name = testMatchSettings.mapName,
    game_description = 'The enemy is on the attack with tanks and rocket launchers. You have a handful of infiltrators, infantry units, and a few scouts. Can it be done? Can human units prevail against these war machines?',
    uniset_name = "Original",
    start_gold = 1,
    ['amoun of material'] = {
        ['raw']  = 2,               -- values:0,1,2
        ['fuel'] = 1,               -- values:0,1,2
        ['gold'] = 1,               -- values:0,1,2
    },
    ['total count of resource placements'] = 200, -- ~500 is max
    ['laying ability'] = true,
    ['enable gasoline'] = false,
    ['survey flag'] = 1,
}
testMatchSettings:applySettings(gameSettings) 



-- Setup API to this instance
TheMatchSettings = testMatchSettings



local testMatchLogic = CustomMissionLogic()

local action_none, action_place, action_placeAndTurnOn = 0, 1, 2




local unitList1 = {
  --{37, 66, "mining", action_placeAndTurnOn},
  {38, 68, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {36, 69, "zenit"},
  {37, 68, "radar"},
  
  {36, 68, "powergen", action_placeAndTurnOn},
  {36, 67, "powergen"},
  {36, 66, "powergen"},
  
  {39, 66, "conn"},
  {37, 69, "turret"},
  {40, 66, "zenit"},
  {41, 65, "habitat"},
  {41, 63, "ecosphere"},
  {43, 65, "ecosphere"},
  {44, 64, "conn"},
  {45, 64, "conn"},
  {42, 67, "conn"},
  {43, 63, "zenit"},
  {42, 68, "turret"},
  {46, 64, "turret"},
  {38, 65, "conn"},
  {38, 62, "conn"},
  {37, 63, "pehplant"},
  {38, 60, "barrak"},
  {36, 60, "barrak"},
  {40, 60, "conn"},
  {41, 60, "conn"},
  {42, 60, "turret"},
  {36, 59, "turret"},
  {35, 66, "conn"},
  {33, 66, "powerpl"},
  {31, 65, "pehplant"},
  {33, 63, "lightplant"},
  {34, 65, "radar"},
  {33, 65, "zenit"},
  {30, 66, "conn"},
  {30, 67, "conn"},
  {29, 67, "conn"},
  {30, 64, "conn"},
  {29, 64, "conn"},
  {30, 63, "conn"},
  {30, 62, "conn"},
  {30, 61, "conn"},
  {27, 64, "barrak"},
  {27, 66, "barrak"},
  {30, 68, "turret"},
  {26, 64, "turret"},
  {30, 60, "turret"},
  {26, 62, "pcan"},
  {26, 68, "pcan"},
  {44, 56, "pcan"},
  {37, 57, "pcan"},
  {35, 60, "pcan"},
  {49, 66, "pcan"},
  {44, 68, "surveyor"},
  {34, 68, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 20},
  {32, 63, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 0},
  {35, 63, "scout"},
  {36, 63, "scout"},
  {36, 64, "scout"},
  {35, 64, "scout"},
  {47, 64, "scout"},
  {43, 68, "scout"},
  {43, 60, "scout"},
  {37, 59, "scout"},
  {31, 60, "scout"},
  {31, 68, "scout"},
  {26, 65, "scout"},
  {38, 69, "scout"},
  
  {46, 65, "infantry"},
  {47, 65, "infantry"},
  {48, 65, "infantry"},
  {48, 66, "infantry"},
  {47, 66, "infantry"},
  {46, 66, "infantry"},
  {43, 56, "infantry"},
  {42, 56, "infantry"},
  {41, 56, "infantry"},
  {42, 57, "infantry"},
  {43, 57, "infantry"},
  {41, 57, "infantry"},
  {29, 68, "infantry"},
  {28, 68, "infantry"},
  {27, 68, "infantry"},
  {27, 69, "infantry"},
  {28, 69, "infantry"},
  {29, 69, "infantry"},
  {32, 60, "infantry"},
  {33, 60, "infantry"},
  {34, 60, "infantry"},
  {34, 61, "infantry"},
  {33, 61, "infantry"},
  {32, 61, "infantry"},
  {38, 57, "infil"},
  {38, 58, "infil"},
  {27, 61, "infil"},
  {27, 62, "infil"},

  
  {89, 49, "scout"},
  {90, 49, "scout"},
}



local unitList2 = {

  {78, 29, "bridge"},
  --{71, 31, "bridge"},
  --{74, 31, "bridge"},
  --{75, 31, "bridge"},
  
  {70, 30, "bridge"},
  {71, 30, "bridge"},
  {72, 30, "bridge"},
  {73, 30, "bridge"},
  {74, 30, "bridge"},
  {75, 30, "bridge"},
  {76, 30, "bridge"},
  {77, 30, "bridge"},
  {78, 30, "bridge"},
  {79, 30, "bridge"},
  
  {70, 31, "bridge"},
  {71, 31, "bridge"},
  {72, 31, "bridge"},
  {73, 31, "bridge"},
  {74, 31, "bridge"},
  {75, 31, "bridge"},
  {76, 31, "bridge"},
  {77, 31, "bridge"},
  {78, 31, "bridge"},
  {79, 31, "bridge"},
  {80, 31, "bridge"},
  
  {70, 32, "bridge"},
  {71, 32, "bridge"},
  {72, 32, "bridge"},
  {73, 32, "bridge"},
  {74, 32, "bridge"},
  {75, 32, "bridge"},
  {76, 32, "bridge"},
  {77, 32, "bridge"},
  {78, 32, "bridge"},
  {79, 32, "bridge"},
  {80, 32, "bridge"},
  {81, 32, "bridge"},
  
  {70, 33, "bridge"},
  {71, 33, "bridge"},
  {72, 33, "bridge"},
  {73, 33, "bridge"},
  {74, 33, "bridge"},
  {75, 33, "bridge"},
  {76, 33, "bridge"},
  {77, 33, "bridge"},
  {78, 33, "bridge"},
  {79, 33, "bridge"},
  {80, 33, "bridge"},
  {81, 33, "bridge"},
  {82, 33, "bridge"},
  {83, 33, "bridge"},
  
  {78, 28, "conn"},
  {77, 28, "conn"},
  {77, 29, "conn"},
  {76, 29, "conn"},
  {75, 29, "conn"}, 
  {74, 29, "conn"},
  {73, 29, "conn"},
  {72, 29, "conn"},
  {71, 29, "conn"},
  {70, 29, "conn"},
  {69, 29, "conn"},
  {68, 29, "conn"},
  {67, 29, "conn"},
  {66, 29, "conn"},
  {65, 29, "conn"},
  {79, 28, "conn"},
  {79, 27, "conn"},
  {80, 27, "conn"},
  {81, 27, "conn"},
  {82, 27, "conn"},
  {83, 27, "conn"},
  {84, 27, "conn"},
  {64, 30, "hvplant"},
  {62, 30, "lightplant"},
  {60, 30, "airplant"},
  {62, 32, "conn"},
  {62, 33, "conn"},
  {63, 34, "hang"},
  {61, 34, "store"},
  {60, 29, "powergen"},
  {62, 29, "powergen"},
  {61, 29, "radar"},
  {85, 27, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
  {88, 27, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
  {86, 27, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {87, 27, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  --{85, 25, "mining", action_placeAndTurnOn},
  {87, 25, "habitat"},
  {89, 25, "powergen", action_placeAndTurnOn},
  {89, 26, "powergen"},
  {87, 28, "conn"},
  {87, 29, "conn"},
  {85, 30, "radar"},
  {85, 31, "powergen", action_placeAndTurnOn},
  --{86, 30, "mining", action_placeAndTurnOn},
  {87, 42, "bridge"},
  {87, 43, "bridge"},
  {87, 44, "bridge"},
  {87, 45, "bridge"},
  {87, 46, "bridge"},
  {87, 47, "bridge"},
  {87, 48, "bridge"},
  {86, 45, "bridge"},
  {88, 42, "bridge"},
  {88, 43, "bridge"},
  
  

  
  {66, 32, "constructor", UNIT_PARAMETER_TYPE_MATERIAL, 20},
  {85, 29, "constructor", UNIT_PARAMETER_TYPE_MATERIAL, 20},
  {85, 35, "constructor", UNIT_PARAMETER_TYPE_MATERIAL, 20},
  {87, 33, "surveyor"},
  {86, 29, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 20},
  {85, 36, "tank"},
  {87, 36, "tank"},
  {88, 36, "tank"},
  {86, 36, "tank"},
  {50, 32, "tank"},
  {49, 32, "tank"},
  {48, 32, "tank"},
  {47, 32, "tank"},
  {47, 33, "tank"},
  {48, 33, "tank"},
  {49, 33, "tank"},
  {50, 33, "tank"},
  {87, 24, "tank"},
  {50, 45, "scanner"},
  {49, 31, "repair"},
  {50, 31, "scanner"},
  {51, 32, "rocket"},
  {52, 32, "rocket"},
  {87, 35, "rocket"},
  {88, 35, "rocket"},
  {51, 33, "scout"},
  {52, 33, "scout"},
  {53, 33, "scout"},
  {88, 24, "scout"},
  {86, 34, "scout"},
  {87, 34, "scout"},
  {88, 34, "scout"},
  {80, 28, "scout"},
  {81, 28, "scout"},
  
  
  
  {6, 73, "tank"},
  {6, 72, "tank"},
  {6, 71, "tank"},
  {6, 70, "tank"},
  {6, 69, "tank"},
  {6, 68, "tank"},
  {5, 69, "scout"},
  {5, 70, "scout"},
  {5, 71, "scout"},
  {5, 72, "scout"},
  {4, 70, "scout"},
  {4, 71, "rocket"},
  {3, 70, "repair"},
  {3, 71, "scanner"},

  {66, 60, "tank"},
  {66, 61, "tank"},
  {66, 62, "tank"},
  {65, 61, "scout"},
  {67, 61, "scout"},
  
  {38, 110, "scout"},
  {39, 110, "scout"},
  
  {101, 103, "scout"},
  {102, 103, "scout"},

}
-- rocket  tank


testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)

local total_units = #unitList1 + #unitList2

local data1 = {gold = 0, cameraX = 32, cameraY = 65, cameraZoom = 1}
local data2 = {gold = 0, cameraX = 50, cameraY = 30, cameraZoom = 1.5}

testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)



function testMatchLogic:onMapLoaded(game, match)

  local map = match:getMap()

  map:placeInitialResources(37, 66)
  
  map:placeInitialResources(85, 25)
  map:placeInitialResources(86, 30)
  
end



function testMatchLogic:onMatchLoaded(game, match)
  
  putUnitMiningWithDefaultSettings(match, 1, 37, 66) 
  
  putUnitMiningWithDefaultSettings(match, 2, 85, 25)
  putUnitMiningWithDefaultSettings(match, 2, 86, 30)
  
  match:playerAtIndex(2):addEnemyLocation(Rect(30, 50, 30, 20), 5)
  
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
