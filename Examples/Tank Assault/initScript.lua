--[[
Tank Assault
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

function putFilledAndEnabledMiningWithRawAndFuelResourcesOnMap(match, player_index, x, y, raw, fuel)
  local map = match:getMap()
  if ( raw ~= 0 ) then
    map:placeResources(x, y, RESOURCE_TYPE_RAW, raw)
  end
  if ( fuel ~= 0 ) then
    map:placeResources(x+1, y+1, RESOURCE_TYPE_FUEL, fuel)
  end

  return putUnitMiningWithDefaultSettings(match, player_index, x, y)
end

function putFilledAndEnabledMiningWithInitialResourcesOnMap(match, player_index, x, y)
  local map = match:getMap()
  map:placeInitialResources(x, y)
  return putUnitMiningWithDefaultSettings(match, player_index, x, y)
end

function putPlantAndStartProduction(match, player_index, x, y, plant, production, speed)
  local plantUnit = match:playerAtIndex(player_index):createUnit(x, y, plant)
  plantUnit:placeUnitOnMap(false)
  if production ~= nil then
    if speed ~= nil then
      plantUnit:setBuildUnit(production, speed)
    else
      plantUnit:setBuildUnit(production, 1)
    end
    
  end
end



local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Desert_6.wrl'
testMatchSettings.mapName = 'Tank Assault'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 4, 'Player 1', Color(0, 75, 0, 255), false, '', 1))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 5, 'Player 2', Color(75, 0, 0, 255), true, '', 0))


local gameSettings =
{
    game_name = testMatchSettings.mapName,
    game_description = 'The enemy is well prepared for your attack, and you have just few tanks to crush the defense. Upgrade the tanks wisely, assault carefully and fast, because your resources are limited and your enemy can produce units endlessly, so the time is playing against you too.',
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
    ['survey flag'] = 2,
}
testMatchSettings:applySettings(gameSettings) 



-- Setup API to this instance
TheMatchSettings = testMatchSettings



local testMatchLogic = CustomMissionLogic()

local action_none, action_place, action_placeAndTurnOn = 0, 1, 2

local unitList1 = {
	{10, 105, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {9, 105, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  --{8, 105, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  --{7, 105, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {10, 103, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {9, 103, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {8, 103, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {7, 103, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {10, 107, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
  {9, 107, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
  --{8, 107, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
  --{7, 107, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
  
  --{10, 109, "gtruck", UNIT_PARAMETER_TYPE_GOLD, 50},
  --{9, 109, "gtruck", UNIT_PARAMETER_TYPE_GOLD, 50},
  --{8, 109, "gtruck", UNIT_PARAMETER_TYPE_GOLD, 50},
  --{7, 109, "gtruck", UNIT_PARAMETER_TYPE_GOLD, 50},
  
  {10, 101, "scanner"},
  {9, 101, "scanner"},
  {8, 101, "scanner"},
  {7, 101, "scanner"},
  --{10, 109, "engineer"},
  --{9, 109, "engineer"},
  --{8, 109, "engineer"},
  --{7, 109, "engineer"},
  
  
  
  
  
  {14, 100, "tank"},
  {15, 100, "tank"},
  {16, 100, "tank"},
  {17, 100, "tank"},
  {14, 101, "tank"},
  {17, 101, "tank"},
  --{12, 103, "tank"},
  --{13, 103, "tank"},
  --{14, 103, "tank"},
  --{15, 103, "tank"},
  --{16, 103, "tank"},
  --{12, 105, "tank"},
  --{13, 105, "tank"},
  --{14, 105, "tank"},
  --{15, 105, "tank"},
  --{16, 105, "tank"},
  --{12, 107, "tank"},
  --{13, 107, "tank"},
  --{14, 107, "tank"},
  --{15, 107, "tank"},
  --{16, 107, "tank"},
  --{12, 109, "tank"},
  --{13, 109, "tank"},
  --{14, 109, "tank"},
  --{15, 109, "tank"},
  --{16, 109, "tank"},
  {15, 101, "store"}, -- Depot
  {15, 103, "gref"}, -- Gold Refinery
  {15, 105, "matstore"},
  --{15, 105, "powerpl"},
  
  --{17, 101, "gref"}, -- Gold Refinery
  --{17, 103, "gref"}, -- Gold Refinery
  --{17, 105, "gref"}, -- Gold Refinery
  --{17, 107, "gref"}, -- Gold Refinery
  --{17, 109, "gref"}, -- Gold Refinery
  --{19, 101, "gref"}, -- Gold Refinery
  --{19, 103, "gref"}, -- Gold Refinery
  --{19, 105, "gref"}, -- Gold Refinery
  --{19, 107, "gref"}, -- Gold Refinery
  --{19, 109, "gref"}, -- Gold Refinery
  --{15, 107, "goldstore"},
  --{16, 107, "goldstore"},
  --{15, 108, "matstore"},
  --{16, 108, "fuelstore"},
  
  
}


local unitListEnv1 = {
}
for unit_i,unit in pairs(unitListEnv1) do
  table.insert(unitList1, unit)
end

local playerMinings1 = {

}

local unitList2 = {
	
  -- top base
  {19, 51, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
  {19, 52, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {20, 51, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {20, 52, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  
  {23, 54, "powerpl", action_placeAndTurnOn},
  {8, 48, "powerpl", action_placeAndTurnOn},
  
  {4, 56, "radar"},
  {26, 57, "radar"},
  {6, 46, "radar"},
  {26, 45, "radar"},
  
  {9, 51, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {10, 51, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {11, 51, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {12, 49, "scanner"},
  {27, 44, "scanner"},
  {3, 50, "scanner"},
  {21, 55, "scanner"},
  {5, 49, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {6, 49, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {7, 49, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  
  {18, 59, "arturret"},
  {7, 59, "arturret"},
  {26, 61, "arturret"},
  {30, 51, "arturret"},
  {36, 43, "arturret"},
  {33, 40, "arturret"},
  {19, 43, "arturret"},
  {8, 43, "arturret"},
  
  {34, 40, "turret"},
  {19, 42, "turret"},
  {9, 42, "turret"},
  {38, 40, "turret"},
  {25, 61, "turret"},
  {7, 60, "turret"},
  {18, 60, "turret"},
  
  {48, 93, "turret"},
  {48, 103, "turret"},
  --{, , "turret"},
  --{, , "turret"},
  
  {14, 50, "asgun"},
  {15, 50, "asgun"},
  {16, 50, "asgun"},
  {17, 50, "asgun"},
  {14, 52, "scout"},
  {15, 52, "scout"},
  {16, 52, "scout"},
  {17, 52, "scout"},
  
  -- right base
	{58, 94, "powerpl", action_placeAndTurnOn},
  {60, 94, "powerpl", action_placeAndTurnOn},
  {58, 82, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {58, 83, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {57, 82, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {57, 83, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
  {52, 100, "radar"},
  {65, 93, "radar"},
  {53, 79, "radar"},
  {55, 82, "scanner"},
  {62, 97, "scanner"},
  {46, 91, "scanner"},
  {57, 93, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {57, 94, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {57, 95, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {57, 96, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},

  {49, 103, "arturret"},
  {66, 103, "arturret"},
  {49, 93, "arturret"},
  {49, 84, "arturret"},
  {51, 84, "arturret"},
  {57, 78, "arturret"},
  {67, 92, "arturret"},
  
  {55, 84, "asgun"},
  {55, 85, "asgun"},
  {55, 87, "scout"},
  {55, 88, "scout"},
}

local unitListEnv2 = {
  
  {0, 96, "road"},
  {1, 96, "road"},
  {2, 96, "road"},
  {3, 96, "road"},
  {4, 96, "road"},
  {5, 96, "road"},
  {6, 96, "road"},
  {7, 96, "road"},
  {8, 96, "road"},
  {9, 96, "road"},
  {10, 96, "road"},
  {11, 96, "road"},
  {12, 96, "road"},
  {13, 96, "road"},
  {14, 96, "road"},
  {15, 96, "road"},
  {16, 96, "road"},
  {17, 96, "road"},
  {18, 96, "road"},
  {19, 96, "road"},
  {20, 96, "road"},
  
  {0, 97, "road"},
  {1, 97, "road"},
  {2, 97, "road"},
  {3, 97, "road"},
  {4, 97, "road"},
  {5, 97, "road"},
  {6, 97, "road"},
  {7, 97, "road"},
  {8, 97, "road"},
  {9, 97, "road"},
  {10, 97, "road"},
  {11, 97, "road"},
  {12, 97, "road"},
  {13, 97, "road"},
  {14, 97, "road"},
  {15, 97, "road"},
  {16, 97, "road"},
  {17, 97, "road"},
  {18, 97, "road"},
  {19, 97, "road"},
  {20, 97, "road"},
  
  
  {5, 65, "landmine"},
  {6, 65, "landmine"},
  {7, 65, "landmine"},
  {8, 65, "landmine"},
  {9, 65, "landmine"},
  
  {16, 65, "landmine"},
  {17, 65, "landmine"},
  {18, 65, "landmine"},
  {19, 65, "landmine"},
  {20, 65, "landmine"},
  {21, 65, "landmine"},
  {22, 65, "landmine"},
  {23, 65, "landmine"},
  
  {45, 89, "landmine"},
  {45, 90, "landmine"},
  {45, 91, "landmine"},
  {45, 92, "landmine"},
  {45, 93, "landmine"},
  {45, 94, "landmine"},
  {45, 95, "landmine"},
  {45, 96, "landmine"},
  {45, 97, "landmine"},
  {45, 98, "landmine"},
  {45, 99, "landmine"},
  {45, 100, "landmine"},
  {45, 101, "landmine"},
  {45, 102, "landmine"},
  {45, 103, "landmine"},
  {45, 104, "landmine"},
  
  
  {18, 54, "conn"},
  {55, 86, "conn"},
  {56, 86, "conn"},
  {34, 74, "road"},
  {33, 74, "road"},
  {33, 75, "road"},
  {33, 76, "road"},
  {33, 77, "road"},
  {33, 78, "road"},
  {33, 79, "road"},
  {33, 80, "road"},
  {33, 81, "road"},
  {33, 82, "road"},
  {33, 83, "road"},
  {33, 84, "road"},
  {33, 85, "road"},
  {33, 86, "road"},
  {33, 87, "road"},
  {33, 88, "road"},
  {33, 89, "road"},
  {33, 90, "road"},
  {33, 91, "road"},
  {33, 92, "road"},
  {33, 93, "road"},
  {33, 94, "road"},
  {33, 95, "road"},
  {34, 95, "road"},
  {34, 94, "road"},
  {34, 93, "road"},
  {34, 92, "road"},
  {34, 91, "road"},
  {34, 90, "road"},
  {34, 89, "road"},
  {34, 88, "road"},
  {34, 87, "road"},
  {34, 86, "road"},
  {34, 85, "road"},
  {34, 84, "road"},
  {34, 83, "road"},
  {34, 82, "road"},
  {34, 81, "road"},
  {34, 80, "road"},
  {34, 79, "road"},
  {34, 78, "road"},
  {34, 77, "road"},
  {34, 76, "road"},
  {34, 75, "road"},
  {35, 80, "road"},
  {35, 81, "road"},
  {35, 82, "road"},
  {35, 83, "road"},
  
  {34, 96, "road"},
  {33, 96, "road"},
  {32, 96, "road"},
  {31, 96, "road"},
  {30, 96, "road"},
  {29, 96, "road"},
  {28, 96, "road"},
  {27, 96, "road"},
  {26, 96, "road"},
  {25, 96, "road"},
  {24, 96, "road"},
  {23, 96, "road"},
  {22, 96, "road"},
  {34, 97, "road"},
  {33, 97, "road"},
  {32, 97, "road"},
  {31, 97, "road"},
  {30, 97, "road"},
  {29, 97, "road"},
  {28, 97, "road"},
  {27, 97, "road"},
  {26, 97, "road"},
  {25, 97, "road"},
  {24, 97, "road"},
  {23, 97, "road"},
  {22, 97, "road"},
  {21, 97, "road"},
  {21, 96, "road"},
  {35, 83, "landmine"},
  {34, 82, "landmine"},
  {33, 81, "landmine"},
  {36, 82, "landmine"},
  {35, 81, "landmine"},
  {34, 80, "landmine"},
  {33, 79, "landmine"},
  {34, 84, "landmine"},
  {33, 83, "landmine"},
  {34, 87, "landmine"},
  {33, 86, "landmine"},
  {34, 77, "landmine"},
  {33, 76, "landmine"},
  
  {52, 81, "conblock"},
  {53, 81, "conblock"},
  {54, 81, "conblock"},
  {55, 81, "conblock"},
  {56, 81, "conblock"},
  {57, 81, "conblock"},
  {58, 81, "conblock"},
  {59, 81, "conblock"},
  {59, 82, "conblock"},
  {59, 83, "conblock"},
  {59, 84, "conblock"},
  {59, 85, "conblock"},
  {59, 86, "conblock"},
  {59, 87, "conblock"},
  {59, 88, "conblock"},
  {59, 89, "conblock"},
  {59, 90, "conblock"},
  {59, 91, "conblock"},
  {59, 92, "conblock"},
  {58, 92, "road"},
  {57, 92, "road"},
  {56, 92, "road"},
  {56, 91, "road"},
  {56, 90, "road"},
  {56, 89, "road"},
  {56, 88, "road"},
  {56, 87, "road"},
  {56, 86, "road"},
  {56, 85, "road"},
  {56, 84, "road"},
  {56, 83, "road"},
  {56, 82, "road"},
  {55, 82, "road"},
  {55, 83, "road"},
  {55, 84, "road"},
  {55, 85, "road"},
  {55, 86, "road"},
  {55, 87, "road"},
  {55, 88, "road"},
  {55, 89, "road"},
  {55, 90, "road"},
  {55, 91, "road"},
  {54, 84, "road"},
  {53, 84, "road"},
  {54, 87, "road"},
  {53, 87, "road"},
  {54, 90, "road"},
  {53, 90, "road"},
  {52, 82, "road"},
  {52, 83, "road"},
  {52, 84, "road"},
  {52, 85, "road"},
  {52, 86, "road"},
  {52, 87, "road"},
  {52, 88, "road"},
  {52, 89, "road"},
  {52, 90, "road"},
  {56, 93, "road"},
  {56, 94, "road"},
  {56, 95, "road"},
  {56, 96, "road"},
  {56, 97, "road"},
  {56, 98, "road"},
  {56, 99, "road"},
  {54, 91, "road"},
  {53, 91, "road"},
  {52, 91, "road"},
  {51, 91, "road"},
  {50, 91, "road"},
  {49, 91, "road"},
  {48, 91, "road"},
  {47, 91, "road"},
  {51, 90, "road"},
  {50, 90, "road"},
  {49, 90, "road"},
  {48, 90, "road"},
  {47, 90, "road"},
  {46, 91, "road"},
  {46, 90, "road"},
  {46, 89, "road"},
  {46, 88, "road"},
  {46, 87, "road"},
  {46, 86, "road"},
  {46, 85, "road"},
  {46, 84, "road"},
  {46, 83, "road"},
  {46, 82, "road"},
  {45, 82, "road"},
  {44, 82, "road"},
  {46, 81, "road"},
  {45, 81, "road"},
  {44, 81, "road"},
  {43, 81, "road"},
  {42, 81, "road"},
  {41, 81, "road"},
  {43, 82, "road"},
  {42, 82, "road"},
  {41, 82, "road"},
  {40, 82, "road"},
  {39, 82, "road"},
  {38, 82, "road"},
  {37, 82, "road"},
  {40, 81, "road"},
  {39, 81, "road"},
  {38, 81, "road"},
  {37, 81, "road"},
  {36, 81, "road"},
  {36, 82, "road"},
  {43, 104, "landmine"},
  {43, 103, "landmine"},
  {43, 102, "landmine"},
  {43, 101, "landmine"},
  {43, 100, "landmine"},
  {43, 99, "landmine"},
  {43, 98, "landmine"},
  {43, 97, "landmine"},
  {43, 96, "landmine"},
  {43, 95, "landmine"},
  {43, 94, "landmine"},
  {43, 93, "landmine"},
  {43, 92, "landmine"},
  {43, 91, "landmine"},
  {43, 90, "landmine"},
  {43, 89, "landmine"},
  {43, 88, "landmine"},
  {43, 87, "landmine"},
  {43, 86, "landmine"},
  {43, 85, "landmine"},
  {43, 84, "landmine"},
  {43, 80, "landmine"},
  {43, 79, "landmine"},
  {43, 78, "landmine"},
  {43, 83, "landmine"},
  {42, 83, "landmine"},
  {42, 80, "landmine"},
  {41, 80, "landmine"},
  {41, 83, "landmine"},
  {43, 106, "seamine"},
  {44, 107, "seamine"},
  {45, 108, "seamine"},
  {46, 109, "seamine"},
  {47, 110, "seamine"},
  {48, 111, "seamine"},
  {49, 110, "seamine"},
  {50, 109, "seamine"},
  {51, 108, "seamine"},
  {52, 107, "seamine"},
  {53, 108, "seamine"},
  {54, 109, "seamine"},
  {55, 110, "seamine"},
  {56, 111, "seamine"},
  {48, 73, "seamine"},
  {49, 72, "seamine"},
  {50, 71, "seamine"},
  {51, 70, "seamine"},
  {52, 71, "seamine"},
  {53, 72, "seamine"},
  {54, 73, "seamine"},
  {55, 74, "seamine"},
  {56, 75, "seamine"},
  {57, 74, "seamine"},
  {58, 73, "seamine"},
  {59, 72, "seamine"},
  {60, 71, "seamine"},
  {61, 72, "seamine"},
  {62, 73, "seamine"},
  {63, 74, "seamine"},
  {64, 75, "seamine"},
  {65, 76, "seamine"},
  {66, 77, "seamine"},
  {67, 78, "seamine"},
  {68, 79, "seamine"},
  {69, 80, "seamine"},
  {70, 81, "seamine"},
  {71, 82, "seamine"},
  {72, 83, "seamine"},
  {73, 84, "seamine"},
  {74, 85, "seamine"},
  {75, 86, "seamine"},
  {76, 87, "seamine"},
  {75, 88, "seamine"},
  {74, 89, "seamine"},
  {73, 90, "seamine"},
  {72, 91, "seamine"},
  {73, 92, "seamine"},
  {74, 93, "seamine"},
  {75, 94, "seamine"},
  {76, 95, "seamine"},
  {57, 97, "road"},
  {58, 97, "road"},
  {59, 97, "road"},
  {60, 97, "road"},
  {61, 97, "road"},
  {62, 97, "road"},
  {62, 98, "road"},
  {62, 99, "road"},
  {62, 100, "road"},
  {61, 100, "road"},
  {60, 100, "road"},
  {59, 100, "road"},
  {58, 100, "road"},
  {57, 100, "road"},
  {56, 100, "road"},
  {57, 99, "road"},
  {57, 98, "road"},
  {45, 105, "landmine"},
  {44, 77, "landmine"},
  {43, 76, "landmine"},
  {42, 75, "landmine"},
  {41, 74, "landmine"},
  {42, 73, "landmine"},
  {43, 72, "landmine"},
  {44, 71, "landmine"},
  {45, 70, "landmine"},
  
  {54, 84, "conn"},
  {54, 87, "conn"},
  {54, 90, "conn"},
  {54, 91, "conn"},
  {55, 94, "conn"},
  {55, 95, "conn"},
  {55, 83, "conn"},
  {56, 83, "conn"},
  {58, 92, "conn"},
  {58, 93, "conn"},
  {60, 96, "conn"},
  {60, 97, "conn"},
  {57, 98, "conn"},
  {56, 98, "conn"},
  {55, 98, "conn"},
  {56, 92, "conn"},
  {57, 92, "conn"},
  {44, 104, "conblock"},
  {44, 103, "conblock"},
  {44, 102, "conblock"},
  {44, 101, "conblock"},
  {44, 100, "conblock"},
  {44, 99, "conblock"},
  {44, 98, "conblock"},
  {44, 97, "conblock"},
  {44, 96, "conblock"},
  {44, 95, "conblock"},
  {44, 94, "conblock"},
  {44, 93, "conblock"},
  {44, 92, "conblock"},
  {44, 91, "conblock"},
  {44, 90, "conblock"},
  {44, 89, "conblock"},
  {44, 88, "conblock"},
  {44, 87, "conblock"},
  {44, 86, "conblock"},
  {44, 85, "conblock"},
  {44, 84, "conblock"},
  {48, 79, "conblock"},
  {47, 79, "conblock"},
  {46, 79, "conblock"},
  {45, 79, "conblock"},
  {44, 79, "conblock"},
  {48, 80, "conblock"},
  {48, 81, "conblock"},
  {48, 82, "conblock"},
  {48, 83, "conblock"},
  {48, 84, "conblock"},
  {48, 85, "conblock"},
  {48, 86, "conblock"},
  {48, 87, "conblock"},
  {48, 88, "conblock"},
  {48, 89, "conblock"},
  
  {30, 37, "conblock"},
  {31, 37, "conblock"},
  {32, 37, "conblock"},
  {33, 37, "conblock"},
  {34, 37, "conblock"},
  {35, 37, "conblock"},
  {36, 37, "conblock"},
  {37, 37, "conblock"},
  {38, 37, "conblock"},
  {39, 37, "conblock"},
  {40, 37, "conblock"},
  {41, 37, "conblock"},
  {41, 38, "conblock"},
  {41, 39, "conblock"},
  {41, 40, "conblock"},
  {14, 36, "road"},
  {13, 36, "road"},
  {13, 35, "road"},
  {13, 34, "road"},
  {13, 33, "road"},
  {14, 32, "road"},
  {14, 33, "road"},
  {14, 34, "road"},
  {14, 35, "road"},
  {13, 32, "road"},
  {12, 32, "road"},
  {11, 32, "road"},
  {10, 32, "road"},
  {9, 32, "road"},
  {8, 32, "road"},
  {12, 33, "road"},
  {11, 33, "road"},
  {10, 33, "road"},
  {9, 33, "road"},
  {8, 33, "road"},
  {41, 42, "road"},
  {40, 42, "road"},
  {39, 42, "road"},
  {38, 42, "road"},
  {37, 42, "road"},
  {36, 42, "road"},
  {35, 42, "road"},
  {34, 42, "road"},
  {33, 42, "road"},
  {32, 42, "road"},
  {31, 42, "road"},
  {30, 42, "road"},
  {29, 42, "road"},
  {28, 42, "road"},
  {27, 42, "road"},
  {27, 43, "road"},
  {27, 44, "road"},
  {26, 44, "road"},
  {25, 44, "road"},
  {25, 45, "road"},
  {24, 45, "road"},
  {23, 45, "road"},
  {22, 45, "road"},
  {21, 45, "road"},
  {20, 45, "road"},
  {19, 45, "road"},
  {18, 45, "road"},
  {17, 45, "road"},
  {17, 46, "road"},
  {17, 47, "road"},
  {17, 48, "road"},
  {14, 70, "road"},
  {15, 70, "road"},
  {16, 70, "road"},
  {17, 70, "road"},
  {18, 70, "road"},
  {19, 70, "road"},
  {20, 70, "road"},
  {21, 70, "road"},
  {14, 69, "road"},
  {15, 69, "road"},
  {16, 69, "road"},
  {17, 69, "road"},
  {18, 69, "road"},
  {19, 69, "road"},
  {20, 69, "road"},
  {21, 69, "road"},
  {22, 69, "road"},
  {23, 69, "road"},
  {24, 69, "road"},
  {25, 69, "road"},
  {26, 69, "road"},
  {27, 69, "road"},
  {22, 70, "road"},
  {23, 70, "road"},
  {24, 70, "road"},
  {25, 70, "road"},
  {26, 70, "road"},
  {27, 70, "road"},
  {28, 69, "road"},
  {29, 69, "road"},
  {30, 69, "road"},
  {31, 69, "road"},
  {32, 69, "road"},
  {28, 70, "road"},
  {29, 70, "road"},
  {30, 70, "road"},
  {31, 70, "road"},
  {32, 70, "road"},
  {33, 70, "road"},
  {34, 70, "road"},
  {33, 69, "road"},
  {34, 69, "road"},
  {34, 71, "road"},
  {34, 72, "road"},
  {34, 73, "road"},
  {33, 71, "road"},
  {33, 72, "road"},
  {33, 73, "road"},
  {0, 72, "landmine"},
  {1, 73, "landmine"},
  {2, 72, "landmine"},
  {3, 73, "landmine"},
  {4, 72, "landmine"},
  {5, 73, "landmine"},
  {6, 72, "landmine"},
  {7, 73, "landmine"},
  {8, 32, "landmine"},
  {9, 32, "landmine"},
  {10, 32, "landmine"},
  {11, 32, "landmine"},
  {12, 32, "landmine"},
  {13, 32, "landmine"},
  {14, 32, "landmine"},
  {14, 33, "landmine"},
  {13, 33, "landmine"},
  {12, 33, "landmine"},
  {11, 33, "landmine"},
  {10, 33, "landmine"},
  {9, 33, "landmine"},
  {8, 33, "landmine"},
  {11, 37, "landmine"},
  {12, 37, "landmine"},
  {12, 38, "landmine"},
  {15, 37, "landmine"},
  {16, 37, "landmine"},
  {15, 38, "landmine"},
  {14, 43, "landmine"},
  {13, 43, "landmine"},
  {11, 44, "landmine"},
  {16, 44, "landmine"},
  {7, 32, "landmine"},
  {6, 33, "landmine"},
  {5, 32, "landmine"},
  {4, 33, "landmine"},
  {3, 32, "landmine"},
  {2, 33, "landmine"},
  {1, 32, "landmine"},
  {0, 33, "landmine"},
  {41, 36, "landmine"},
  {41, 41, "landmine"},
  {41, 42, "landmine"},
  {39, 42, "landmine"},
  {39, 41, "landmine"},
  {39, 40, "landmine"},
  {37, 42, "landmine"},
  {37, 41, "landmine"},
  {38, 38, "landmine"},
  {37, 39, "landmine"},
  {35, 41, "landmine"},
  {34, 42, "landmine"},
  {33, 43, "landmine"},
  {32, 42, "landmine"},
  {31, 41, "landmine"},
  {30, 40, "landmine"},
  {29, 39, "landmine"},
  {17, 56, "landmine"},
  {10, 58, "landmine"},
  {15, 58, "landmine"},
  {13, 59, "landmine"},
  {12, 59, "landmine"},
  {10, 65, "landmine"},
  {11, 64, "landmine"},
  {11, 65, "landmine"},
  {14, 64, "landmine"},
  {14, 65, "landmine"},
  {15, 65, "landmine"},
  {13, 68, "landmine"},
  {13, 69, "landmine"},
  {13, 70, "landmine"},
  {12, 68, "landmine"},
  {12, 69, "landmine"},
  {12, 70, "landmine"},
  {13, 67, "landmine"},
  {12, 67, "landmine"},
  {14, 70, "landmine"},
  {15, 69, "landmine"},
  {17, 70, "landmine"},
  {18, 69, "landmine"},
  {20, 70, "landmine"},
  {21, 69, "landmine"},
  {23, 70, "landmine"},
  {24, 69, "landmine"},
  {26, 70, "landmine"},
  {27, 69, "landmine"},
  {29, 70, "landmine"},
  {30, 69, "landmine"},
  {32, 70, "landmine"},
  {33, 69, "landmine"},
  {33, 70, "landmine"},
  {34, 69, "landmine"},
  {34, 73, "landmine"},
  {33, 72, "landmine"},
  {34, 71, "landmine"},
  {36, 62, "landmine"},
  {37, 63, "landmine"},
  {37, 61, "landmine"},
  {36, 60, "landmine"},
  {36, 64, "landmine"},
  {37, 65, "landmine"},
  {36, 66, "landmine"},
  {37, 67, "landmine"},
  {36, 68, "landmine"},
  {37, 69, "landmine"},
  {36, 70, "landmine"},
  {37, 71, "landmine"},
  
  {20, 53, "conn"},
  {20, 50, "conn"},
  {20, 49, "conn"},
  {18, 46, "conblock"},
  {19, 46, "conblock"},
  {20, 46, "conblock"},
  {21, 46, "conblock"},
  {22, 46, "conblock"},
  {23, 46, "conblock"},
  {24, 46, "conblock"},
  {25, 46, "conblock"},
  {25, 47, "conblock"},
  {25, 48, "conblock"},
  {25, 49, "conblock"},
  {25, 50, "conblock"},
  {25, 51, "conblock"},
  {25, 52, "conblock"},
  {25, 53, "conblock"},
  {25, 54, "conblock"},
  {25, 55, "conblock"},
  {25, 56, "conblock"},
  {24, 56, "conblock"},
  {23, 56, "conblock"},
  {22, 56, "conblock"},
  {21, 56, "conblock"},
  {20, 56, "conblock"},
  {19, 56, "conblock"},
  {18, 56, "conblock"},
  {24, 53, "road"},
  {23, 53, "road"},
  {22, 53, "road"},
  {21, 53, "road"},
  {20, 53, "road"},
  {19, 53, "road"},
  {18, 53, "road"},
  {22, 54, "road"},
  {22, 55, "road"},
  {21, 55, "road"},
  {21, 54, "road"},
  {21, 52, "road"},
  {21, 51, "road"},
  {21, 50, "road"},
  {21, 49, "road"},
  {21, 48, "road"},
  {21, 47, "road"},
  {22, 47, "road"},
  {22, 48, "road"},
  {22, 49, "road"},
  {22, 50, "road"},
  {22, 51, "road"},
  {22, 52, "road"},
  {18, 47, "road"},
  {18, 48, "road"},
  {18, 49, "road"},
  {18, 50, "road"},
  {18, 51, "road"},
  {18, 52, "road"},
  {19, 50, "road"},
  {20, 49, "road"},
  {20, 50, "road"},
  {19, 49, "road"},
  {17, 53, "road"},
  {16, 53, "road"},
  {15, 53, "road"},
  {14, 53, "road"},
  {13, 53, "road"},
  {17, 49, "road"},
  {16, 49, "road"},
  {15, 49, "road"},
  {14, 49, "road"},
  {13, 49, "road"},
  {14, 48, "road"},
  {14, 47, "road"},
  {14, 46, "road"},
  {14, 45, "road"},
  {14, 44, "road"},
  {14, 43, "road"},
  {14, 42, "road"},
  {14, 41, "road"},
  {14, 40, "road"},
  {14, 39, "road"},
  {14, 38, "road"},
  {14, 37, "road"},
  {13, 37, "road"},
  {13, 38, "road"},
  {13, 39, "road"},
  {13, 40, "road"},
  {13, 41, "road"},
  {13, 42, "road"},
  {13, 43, "road"},
  {13, 44, "road"},
  {13, 45, "road"},
  {13, 46, "road"},
  {13, 47, "road"},
  {13, 48, "road"},
  {13, 50, "road"},
  {13, 51, "road"},
  {13, 52, "road"},
  {14, 51, "road"},
  {15, 50, "road"},
  {16, 50, "road"},
  {17, 50, "road"},
  {17, 51, "road"},
  {17, 52, "road"},
  {16, 52, "road"},
  {15, 52, "road"},
  {14, 52, "road"},
  {15, 51, "road"},
  {16, 51, "road"},
  {14, 50, "road"},
  {12, 49, "road"},
  {12, 50, "road"},
  {11, 50, "road"},
  {10, 50, "road"},
  {9, 50, "road"},
  {8, 50, "road"},
  {7, 50, "road"},
  {6, 50, "road"},
  {5, 50, "road"},
  {4, 50, "road"},
  {3, 50, "road"},
  {12, 51, "road"},
  {12, 52, "road"},
  {12, 53, "road"},
  {12, 54, "road"},
  {12, 55, "road"},
  {12, 56, "road"},
  {12, 57, "road"},
  {12, 58, "road"},
  {12, 59, "road"},
  {12, 60, "road"},
  {12, 61, "road"},
  {12, 62, "road"},
  {12, 63, "road"},
  {12, 64, "road"},
  {12, 65, "road"},
  {12, 66, "road"},
  {12, 67, "road"},
  {12, 68, "road"},
  {12, 69, "road"},
  {12, 70, "road"},
  {13, 70, "road"},
  {13, 69, "road"},
  {13, 68, "road"},
  {13, 67, "road"},
  {13, 66, "road"},
  {13, 65, "road"},
  {13, 64, "road"},
  {13, 63, "road"},
  {13, 62, "road"},
  {13, 61, "road"},
  {13, 60, "road"},
  {13, 59, "road"},
  {13, 58, "road"},
  {13, 57, "road"},
  {13, 56, "road"},
  {13, 55, "road"},
  {13, 54, "road"},
  
  {22, 48, "conn"},
  {21, 48, "conn"},
  {22, 54, "conn"},
  {21, 54, "conn"},
  {23, 53, "conn"},
  {18, 48, "conn"},
  {17, 48, "conn"},
  {16, 48, "conn"},
  {15, 48, "conn"},
  {14, 48, "conn"},
  {13, 48, "conn"},
  {12, 48, "conn"},
  {11, 48, "conn"},
  {10, 48, "conn"},
  {7, 49, "conn"},
  {6, 49, "conn"},
  {5, 49, "conn"},
  {8, 50, "conn"},
  {17, 54, "conn"},
  {16, 54, "conn"},
  {15, 54, "conn"},
  {14, 54, "conn"},
  {13, 54, "conn"},
  {12, 54, "conn"},
  {11, 54, "conn"},
  {10, 54, "conn"},
  {9, 54, "conn"},
  
  {31, 59, "conblock"},
  {31, 60, "conblock"},
  {31, 61, "conblock"},
  {31, 62, "conblock"},
  {31, 63, "conblock"},
  {31, 64, "conblock"},
  {31, 65, "conblock"},
  {30, 65, "conblock"},
  {29, 65, "conblock"},
  {28, 65, "conblock"},
  {27, 65, "conblock"},
  {26, 64, "conblock"},
  {25, 64, "conblock"},
  {24, 64, "conblock"},
  {23, 64, "conblock"},
  {22, 64, "conblock"},
  {21, 64, "conblock"},
  {20, 64, "conblock"},
  {19, 64, "conblock"},
  {18, 64, "conblock"},
  {17, 64, "conblock"},
  {16, 64, "conblock"},
  {15, 64, "conblock"},
  {10, 64, "conblock"},
  {9, 64, "conblock"},
  {8, 64, "conblock"},
  {7, 64, "conblock"},
  {6, 64, "conblock"},
  {5, 64, "conblock"},
  {4, 64, "conblock"},
  {3, 64, "conblock"},
  {2, 64, "conblock"},
  {1, 64, "conblock"},
  {0, 64, "conblock"},
  {15, 63, "conblock"},
  {15, 62, "conblock"},
  {15, 61, "conblock"},
  {15, 60, "conblock"},
  {10, 63, "conblock"},
  {10, 62, "conblock"},
  {10, 61, "conblock"},
  {10, 60, "conblock"},
  {15, 59, "conblock"},
  {10, 59, "conblock"},
  {22, 38, "conblock"},
  {21, 38, "conblock"},
  {20, 38, "conblock"},
  {19, 38, "conblock"},
  {18, 38, "conblock"},
  {17, 38, "conblock"},
  {16, 38, "conblock"},
  {11, 38, "conblock"},
  {10, 38, "conblock"},
  {9, 38, "conblock"},
  {8, 38, "conblock"},
  {7, 38, "conblock"},
  {6, 38, "conblock"},
  {5, 38, "conblock"},
  {4, 38, "conblock"},
  {3, 38, "conblock"},
  {16, 39, "conblock"},
  {16, 40, "conblock"},
  {16, 41, "conblock"},
  {16, 42, "conblock"},
  {16, 43, "conblock"},
  {11, 39, "conblock"},
  {11, 40, "conblock"},
  {11, 41, "conblock"},
  {11, 42, "conblock"},
  {11, 43, "conblock"},
}



for unit_i,unit in pairs(unitListEnv2) do
  table.insert(unitList2, unit)
end

local playerMinings2 = {
  -- top base
  {19, 54, "mining"},
  {7, 53, "mining"},
  {1, 48, "mining"},
  {3, 48, "mining"},
  {7, 51, "mining"},
  
  -- right base
  {54, 92, "mining"},
  {54, 96, "mining"},
  {54, 99, "mining"},
}

local playerPlants2 = {
  -- top base
  {23, 47, "hvplant", "asgun", 2},
  {23, 49, "hvplant", "asgun", 2},
  {23, 51, "hvplant", "asgun", 2},
  {19, 47, "hvplant", "asgun", 2},

  
  -- right base
  {57, 86, "lightplant", "scout", 1},
  {57, 88, "lightplant", "scout", 1},
  {57, 90, "lightplant", "scout", 1},
  {57, 84, "lightplant", "scout", 1},
  {60, 98, "lightplant", "scout", 1},
  {58, 98, "lightplant", "scout", 1},
  {53, 85, "lightplant", "scout", 1},
  {53, 88, "lightplant", "scout", 1},
  {53, 82, "lightplant", "scout", 1},

}

local unitList3 = {

}



local playerMinings3 = {

}

testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)
--testMatchLogic:addInitialUnitsForPlayer(unitList3, 3)

local data1 = {gold = 111, cameraX = 15, cameraY = 105, cameraZoom = 1}
local data2 = {gold = 0, cameraX = 60, cameraY = 100, cameraZoom = 1}
--local data3 = {gold = 0, cameraX = 50, cameraY = 30, cameraZoom = 1.5}


testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)
--testMatchLogic:addInitialDataForPlayers(data3, 3)



function testMatchLogic:onMapLoaded(game, match)

  local map = match:getMap()
  local x = 20
  local y = 107  
  --map:placeResources(x, y, RESOURCE_TYPE_RAW, 16)
  --map:placeInitialResources(x, y)
  
  --map:placeResources(x+1, y+1, RESOURCE_TYPE_FUEL, 6)
  
  --map:placeResources(33, 81, RESOURCE_TYPE_RAW, 16)
  --map:placeResources(34, 81, RESOURCE_TYPE_RAW, 16)
  --map:placeResources(35, 81, RESOURCE_TYPE_RAW, 16)
  --
  --map:placeResources(19, 55, RESOURCE_TYPE_RAW, 16)
  --map:placeResources(54, 96, RESOURCE_TYPE_RAW, 16)


  --map:placeInitialResources(38, 38)
  
  for i,miningItem in ipairs(playerMinings1) do
    putFilledAndEnabledMiningWithInitialResourcesOnMap(match, 1, miningItem[1], miningItem[2]);
  end
  
  
  for i,miningItem in ipairs(playerMinings2) do
    putFilledAndEnabledMiningWithInitialResourcesOnMap(match, 2, miningItem[1], miningItem[2]);
  end
  
  
  for i,miningItem in ipairs(playerMinings3) do
    putFilledAndEnabledMiningWithInitialResourcesOnMap(match, 3, miningItem[1], miningItem[2]);
  end
  
  
  -- for player 1 constructor
  --map:placeInitialResources(47, 84)
  

end



function testMatchLogic:onMatchLoaded(game, match)
  

  
  for i,plantItem in ipairs(playerPlants2) do
    putPlantAndStartProduction(match, 2, plantItem[1], plantItem[2], plantItem[3], plantItem[4], plantItem[5])
  end
  
  
  match:playerAtIndex(2):setAIRefuelAutomatically(true)
  --match:playerAtIndex(3):setAIRefuelAutomatically(true)
  
  
  --match:playerAtIndex(2):addEnemyLocation(Rect(80, 30, 20, 20), 5)
  --match:playerAtIndex(2):addEnemyLocation(Rect(40, 75, 20, 20), 5)
  match:playerAtIndex(2):addDefenceLocation(Rect(5, 40, 20, 20))
  
  
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
