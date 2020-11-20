--[[
Operation - Infiltration
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
testMatchSettings.mapFileName = 'Crater_6.wrl'
testMatchSettings.mapName = 'Operation - Infiltration'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 2, 'Player 1', Color(0, 75, 0, 255), false, '', 1))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 7, 'Player 2', Color(75, 0, 0, 255), true, '', 0))


local gameSettings =
{
    game_name = testMatchSettings.mapName,
    game_description = 'You have a well-defended base, but enemy produces enough units to crush the defense. You can train infantry and infiltrators, but they cannot win in the open clash with the enemy units. Stop the enemy unit production is the only way to survive.',
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
    ['survey flag'] = 0,
}
testMatchSettings:applySettings(gameSettings) 



-- Setup API to this instance
TheMatchSettings = testMatchSettings



local testMatchLogic = CustomMissionLogic()

local action_none, action_place, action_placeAndTurnOn = 0, 1, 2

local unitList1 = {
	{81, 58, "conblock"},
	{82, 58, "conblock"},
	{83, 58, "conblock"},
	{84, 58, "conblock"},
	{85, 58, "conblock"},
	{86, 58, "conblock"},
	{87, 58, "conblock"},
	{88, 58, "conblock"},
	{89, 58, "conblock"},
	{90, 58, "conblock"},
	{91, 58, "conblock"},
	{102, 52, "conblock"},
	{101, 52, "conblock"},
	{100, 52, "conblock"},
	{99, 52, "conblock"},
	{98, 52, "conblock"},
	{97, 52, "conblock"},
	{96, 52, "conblock"},
	{95, 52, "conblock"},
	{94, 52, "conblock"},
	{93, 52, "conblock"},
	{92, 52, "conblock"},
	{91, 52, "conblock"},
	{90, 52, "conblock"},
	{89, 52, "conblock"},
	{88, 52, "conblock"},
	{87, 52, "conblock"},
	{86, 52, "conblock"},
	{86, 55, "turret"},
	{84, 55, "turret"},
	{89, 49, "turret"},
	{91, 49, "turret"},
	{96, 49, "turret"},
	{98, 49, "turret"},
	{85, 55, "arturret"},
	{90, 49, "arturret"},
	{97, 49, "arturret"},
	{76, 45, "conblock"},
	{76, 44, "conblock"},
	{76, 43, "conblock"},
	{76, 42, "conblock"},
	{76, 41, "conblock"},
	{76, 40, "conblock"},
	{76, 38, "conblock"},
	{76, 37, "conblock"},
	{76, 36, "conblock"},
	{76, 35, "conblock"},
	{76, 34, "conblock"},
	{76, 33, "conblock"},
	{81, 27, "conblock"},
	{81, 28, "conblock"},
	{81, 29, "conblock"},
	{81, 30, "conblock"},
	{81, 31, "conblock"},
	{81, 32, "conblock"},
	{81, 33, "conblock"},
	{81, 34, "conblock"},
	{81, 35, "conblock"},
	{81, 36, "conblock"},
	{81, 37, "conblock"},
	{81, 38, "conblock"},
	{81, 39, "conblock"},
	{81, 40, "conblock"},
	{81, 41, "conblock"},
	{84, 29, "turret"},
	{84, 31, "turret"},
	{78, 42, "turret"},
	{78, 44, "turret"},
	{78, 43, "arturret"},
	{84, 30, "arturret"},
	{89, 34, "habitat"},
	{87, 36, "pehplant"},
	{89, 36, "barrak"},
  
  {91, 34, "habitat"},
  {93, 34, "habitat"},
  
  {91, 36, "pehplant"},
  {93, 36, "pehplant"},
	
	{87, 34, "radar"},
	{93, 46, "radar"},
	{96, 40, "powerpl", action_placeAndTurnOn},
  {98, 40, "powerpl", action_placeAndTurnOn},
	{91, 36, "conn"},
	{92, 36, "conn"},
	{93, 36, "conn"},
	{94, 36, "conn"},
	{95, 36, "conn"},
	{96, 38, "conn"},
	{96, 39, "conn"},
	{88, 35, "road"},
	{87, 35, "road"},
	{86, 35, "road"},
	{86, 36, "road"},
	{86, 37, "road"},
	{86, 38, "road"},
	{87, 38, "road"},
	{88, 38, "road"},
	{89, 38, "road"},
	{90, 38, "road"},
	{91, 38, "road"},
  
	--{91, 37, "road"},
	--{91, 36, "road"},
	--{91, 35, "road"},
  
  {95, 35, "road"},
  {95, 36, "road"},
  {95, 37, "road"},
  {95, 38, "road"},
  {95, 39, "road"},
  {95, 40, "road"},
  {95, 41, "road"},
  {95, 42, "road"},
  
  {92, 39, "road"},
  {93, 39, "road"},
  {94, 39, "road"},
  {92, 41, "road"},
  {93, 41, "road"},
  {94, 41, "road"},
  
	{86, 39, "road"},
	{87, 39, "road"},
	{88, 39, "road"},
	{89, 39, "road"},
	{90, 39, "road"},
	{91, 39, "road"},
	{91, 40, "road"},
	{90, 40, "road"},
	{89, 40, "road"},
	{88, 40, "road"},
	{87, 40, "road"},
	{86, 40, "road"},
	{86, 41, "road"},
	{87, 41, "road"},
	{88, 41, "road"},
	{89, 41, "road"},
	{90, 41, "road"},
	{91, 41, "road"},
	{91, 42, "road"},
	{90, 42, "road"},
	{89, 42, "road"},
	{88, 42, "road"},
	{87, 42, "road"},
	{81, 42, "road"},
	{82, 42, "road"},
	{83, 42, "road"},
	{84, 42, "road"},
	{85, 42, "road"},
	{85, 43, "road"},
	{85, 44, "road"},
	{85, 45, "road"},
	{85, 46, "road"},
	{85, 47, "road"},
	{85, 48, "road"},
	{85, 49, "road"},
	{85, 50, "road"},
	{85, 51, "road"},
	{85, 52, "road"},
	{86, 42, "road"},
	{89, 46, "road"},
	{88, 46, "road"},
	{87, 46, "road"},
	{86, 46, "road"},
	{90, 46, "road"},
	{90, 45, "road"},
	{90, 44, "road"},
	{90, 43, "road"},
	{89, 45, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{89, 44, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
	{89, 43, "conn"},
	{90, 43, "conn"},
	{91, 43, "conn"},
	{92, 43, "conn"},
	{93, 43, "conn"},
	{94, 43, "conn"},
	{95, 43, "conn"},
	{96, 43, "conn"},
	{96, 42, "conn"},
	{92, 38, "road"},
	{93, 38, "road"},
	{94, 38, "road"},
	{92, 42, "road"},
	{93, 42, "road"},
	{94, 42, "road"},
	{92, 40, "road"},
	{93, 40, "road"},
	{94, 40, "road"},
  {85, 36, "road"},
	{84, 36, "road"},
	{85, 38, "road"},
	{84, 38, "road"},
  {85, 40, "road"},
	{84, 40, "road"},
  {84, 36, "scanner"},
	{84, 38, "pcan"},
  {84, 40, "pcan"},
	{94, 40, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
	{95, 40, "fueltruck", UNIT_PARAMETER_TYPE_FUEL, 50},
	{94, 41, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{95, 41, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{94, 42, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
	{95, 42, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {87, 39, "infantry"},
	{88, 39, "infantry"},
	{89, 39, "infantry"},
	{90, 39, "infantry"},
  {91, 39, "infantry"},
  {92, 39, "infantry"},
	
  {87, 41, "infantry"},
  {88, 41, "infantry"},
	{89, 41, "infantry"},
	{90, 41, "infantry"},
  {91, 41, "infantry"},
  {92, 41, "infantry"},

  
  {85, 32, "misturret"},
  {79, 45, "misturret"},
  {83, 54, "misturret"},
  {88, 48, "misturret"},
  {95, 48, "misturret"},
  
  --{87, 40, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  --{88, 40, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  --{89, 40, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  --{90, 40, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  --{91, 40, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
}

local playerMinings1 = {
  {96, 36, "mining"},
}

local unitList2 = {
	
	{98, 107, "conn"},
	{99, 107, "conn"},
	{102, 106, "conn"},
	{103, 106, "conn"},
	{104, 106, "conn"},
	{89, 105, "turret"},
	{90, 106, "arturret"},
	{108, 100, "powerpl", action_placeAndTurnOn},
	{110, 100, "powerpl", action_placeAndTurnOn},
	{110, 98, "powerpl", action_placeAndTurnOn},
	{108, 102, "conn"},
	{108, 98, "powerpl", action_placeAndTurnOn},
	{110, 96, "powerpl", action_placeAndTurnOn},
	
	--{94, 103, "habitat"},
	--{96, 103, "habitat"},
  {94, 103, "road"},
  {95, 103, "road"},
  {96, 103, "road"},
  {97, 103, "road"},
  
	{108, 96, "powerpl", action_placeAndTurnOn},
	{93, 98, "conn"},
	{93, 99, "conn"},
	{94, 99, "conn"},
	{95, 99, "conn"},
	{96, 99, "conn"},
	{97, 99, "conn"},
	{98, 99, "conn"},
	{99, 99, "conn"},
	{100, 99, "conn"},
	{101, 99, "conn"},
	{104, 99, "conn"},
	{105, 99, "conn"},
	{106, 99, "conn"},
	{107, 99, "conn"},
	{99, 104, "conn"},
	{98, 104, "conn"},
	{104, 98, "conn"},
	{99, 98, "conn"},
	{96, 98, "conn"},
	{107, 98, "conn"},
	{98, 106, "conn"},
	{98, 105, "conn"},
	{98, 103, "conn"},
	{98, 102, "conn"},
	{98, 101, "conn"},
	{98, 100, "conn"},
	{93, 100, "conn"},
	{93, 101, "conn"},
	{93, 102, "conn"},
	{93, 103, "conn"},
	{93, 105, "conn"},
	{93, 106, "conn"},
	{93, 107, "conn"},
	
	{104, 97, "conn"},
	{104, 96, "conn"},
	{104, 95, "conn"},
	{104, 94, "conn"},
	{104, 93, "conn"},
	{104, 92, "conn"},
	{104, 91, "conn"},
	{104, 90, "conn"},
	{104, 89, "conn"},
	{104, 88, "conn"},
	{104, 87, "conn"},
	{104, 86, "conn"},
	{103, 94, "conn"},
	{102, 94, "conn"},
	{101, 94, "conn"},
	{100, 94, "conn"},
	{99, 94, "conn"},
	{98, 94, "conn"},
	{97, 94, "conn"},
	{96, 94, "conn"},
	{95, 94, "conn"},
	{94, 94, "conn"},
	{93, 94, "conn"},
	{92, 94, "conn"},
	{91, 94, "conn"},
	{106, 108, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{105, 108, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{106, 109, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
	{105, 109, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
	{106, 110, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
	{105, 110, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 50},
	{105, 107, "conn"},
	
	{109, 94, "conn"},
	{109, 95, "conn"},
	{87, 96, "turret"},
	{88, 97, "arturret"},
	{79, 89, "turret"},
	{80, 90, "arturret"},
	{99, 76, "conblock"},
	{100, 76, "conblock"},
	{101, 76, "conblock"},
	{102, 76, "conblock"},
	{103, 76, "conblock"},
	{104, 76, "conblock"},
	{105, 76, "conblock"},
	{106, 76, "conblock"},
	{107, 76, "conblock"},
	{108, 76, "conblock"},
	{109, 76, "conblock"},
	{110, 76, "conblock"},
	{111, 76, "conblock"},
	{108, 80, "turret"},
	{104, 80, "turret"},
	{104, 83, "misturret"},
	{108, 83, "misturret"},
	{99, 84, "radar"},
	{96, 76, "conblock"},
	{95, 76, "conblock"},
	{83, 76, "conblock"},
	{82, 76, "conblock"},
	{81, 76, "conblock"},
	{80, 76, "conblock"},
	{79, 76, "conblock"},
	{78, 76, "conblock"},
	{94, 76, "conblock"},
	{93, 76, "conblock"},
	{92, 76, "conblock"},
	{95, 80, "turret"},
	{96, 81, "arturret"},
	{97, 82, "misturret"},
	{80, 82, "misturret"},
	{79, 81, "arturret"},
	{78, 80, "turret"},
	{83, 77, "conblock"},
	{83, 78, "conblock"},
	{83, 79, "conblock"},
	{83, 80, "conblock"},
	{83, 81, "conblock"},
	{83, 82, "conblock"},
	{83, 83, "conblock"},
	{92, 77, "conblock"},
	{92, 78, "conblock"},
	{92, 79, "conblock"},
	{92, 80, "conblock"},
	{92, 81, "conblock"},
	{92, 82, "conblock"},
	{92, 83, "conblock"},
	{90, 91, "road"},
	{90, 92, "road"},
	{90, 93, "road"},
	{90, 94, "road"},
	{90, 95, "road"},
	{90, 96, "road"},
	{90, 97, "road"},
	{90, 98, "road"},
	{90, 99, "road"},
	{90, 100, "road"},
	{90, 101, "road"},
	{91, 101, "road"},
	{92, 101, "road"},
	{93, 103, "road"},
	{93, 102, "road"},
	{93, 101, "road"},
	{93, 100, "road"},
	{93, 99, "road"},
	{93, 98, "road"},
	{93, 97, "road"},
	{93, 96, "road"},
	{92, 96, "road"},
	{91, 96, "road"},
	{94, 96, "road"},
	{95, 96, "road"},
	{96, 96, "road"},
	{97, 96, "road"},
	{98, 96, "road"},
	{99, 96, "road"},
	{100, 96, "road"},
	{101, 96, "road"},
	{102, 96, "road"},
	{103, 96, "road"},
	{104, 96, "road"},
	{105, 96, "road"},
	{106, 96, "road"},
	{107, 96, "road"},
	{107, 97, "road"},
	{107, 98, "road"},
	{107, 99, "road"},
	{106, 99, "road"},
	{105, 99, "road"},
	{104, 99, "road"},
	{104, 98, "road"},
	{104, 97, "road"},
	{104, 100, "road"},
	{104, 101, "road"},
	{103, 101, "road"},
	{102, 101, "road"},
	{101, 101, "road"},
	{101, 100, "road"},
	{101, 99, "road"},
	{100, 99, "road"},
	{99, 99, "road"},
	{98, 99, "road"},
	{97, 99, "road"},
	{96, 99, "road"},
	{95, 99, "road"},
	{94, 99, "road"},
	{94, 100, "road"},
	{95, 100, "road"},
	{96, 100, "road"},
	{97, 100, "road"},
	{98, 100, "road"},
	{99, 100, "road"},
	{100, 100, "road"},
	{98, 101, "road"},
	{98, 102, "road"},
	{98, 103, "road"},
	{99, 98, "road"},
	{99, 97, "road"},
	{96, 98, "road"},
	{96, 97, "road"},
	{91, 94, "road"},
	{92, 94, "road"},
	{93, 94, "road"},
	{93, 93, "road"},
	{93, 92, "road"},
	{93, 91, "road"},
	{92, 91, "road"},
	{91, 91, "road"},
	{99, 94, "road"},
	{100, 94, "road"},
	{101, 94, "road"},
	{102, 94, "road"},
	{102, 93, "road"},
	{102, 92, "road"},
	{102, 91, "road"},
	{101, 91, "road"},
	{100, 91, "road"},
	{99, 91, "road"},
	{99, 92, "road"},
	{99, 93, "road"},
	{102, 95, "road"},
	{101, 95, "road"},
	{100, 95, "road"},
	{99, 95, "road"},
	{93, 95, "road"},
	{92, 95, "road"},
	{91, 95, "road"},
	{102, 90, "road"},
	{107, 94, "road"},
	{107, 93, "road"},
	{107, 92, "road"},
	{107, 91, "road"},
	{107, 90, "road"},
	{107, 89, "road"},
	{107, 88, "road"},
	{107, 87, "road"},
	{107, 86, "road"},
	{107, 85, "road"},
	{106, 85, "road"},
	{105, 85, "road"},
	{104, 85, "road"},
	{104, 86, "road"},
	{104, 87, "road"},
	{104, 88, "road"},
	{104, 89, "road"},
	{104, 90, "road"},
	{104, 91, "road"},
	{104, 92, "road"},
	{104, 93, "road"},
	{104, 94, "road"},
	{105, 94, "road"},
	{106, 94, "road"},
	{106, 91, "road"},
	{105, 91, "road"},
	{106, 88, "road"},
	{105, 88, "road"},
	{103, 90, "road"},
	{101, 90, "road"},
	{100, 90, "road"},
	{99, 90, "road"},
	{98, 90, "road"},
	{97, 90, "road"},
	{96, 90, "road"},
	{95, 90, "road"},
	{94, 90, "road"},
	{93, 90, "road"},
	{92, 90, "road"},
	{91, 90, "road"},
	{90, 90, "road"},
	{88, 84, "road"},
	{87, 84, "road"},
	{87, 85, "road"},
	{87, 86, "road"},
	{87, 87, "road"},
	{87, 88, "road"},
	{87, 89, "road"},
	{87, 90, "road"},
	{88, 85, "road"},
	{88, 86, "road"},
	{88, 87, "road"},
	{88, 88, "road"},
	{88, 89, "road"},
	{88, 90, "road"},
	{87, 91, "road"},
	{88, 91, "road"},
	{89, 91, "road"},
	{89, 90, "road"},
	{103, 89, "road"},
	{102, 89, "road"},
	{101, 89, "road"},
	{100, 89, "road"},
	{99, 89, "road"},
	{98, 89, "road"},
	{97, 89, "road"},
	{96, 89, "road"},
	{95, 89, "road"},
	{94, 89, "road"},
	{93, 89, "road"},
	{92, 89, "road"},
	{91, 89, "road"},
	{90, 89, "road"},
	{89, 89, "road"},
	{93, 104, "radar"},
	{84, 90, "radar"},
	{110, 73, "landmine"},
	{108, 73, "landmine"},
	{106, 73, "landmine"},
	{104, 73, "landmine"},
	{102, 73, "landmine"},
	{100, 73, "landmine"},
	{98, 73, "landmine"},
	{96, 73, "landmine"},
	{81, 73, "landmine"},
	{79, 73, "landmine"},
	{80, 74, "landmine"},
	{103, 74, "landmine"},
	{107, 74, "landmine"},
	{77, 91, "seamine"},
	{76, 92, "seamine"},
	{75, 93, "seamine"},
	{74, 94, "seamine"},
	{73, 95, "seamine"},
	{76, 104, "seamine"},
	{77, 103, "seamine"},
	{78, 102, "seamine"},
	{79, 101, "seamine"},
	{80, 100, "seamine"},
	{81, 99, "seamine"},
	{85, 90, "scanner"},
	{99, 85, "scanner"},
	{92, 104, "scanner"},
	{106, 95, "scanner"},
	{86, 91, "scout"},
	{86, 90, "scout"},
	{86, 89, "scout"},
	{86, 88, "scout"},
	{86, 87, "scout"},
	{86, 86, "scout"},
	{86, 85, "scout"},
	{86, 84, "scout"},
	{89, 84, "tank"},
	{89, 85, "tank"},
	{89, 86, "tank"},
	{89, 87, "tank"},
	{89, 88, "tank"},
	{89, 92, "asgun"},
	{89, 93, "asgun"},
	{89, 94, "asgun"},
	{98, 92, "rocket"},
	{98, 93, "rocket"},
	{98, 94, "rocket"},
	{103, 92, "crawler"},
	{103, 93, "crawler"},

  {87, 70, "scanner"},
  {86, 70, "tank"},
  {88, 70, "tank"},
  
  {97, 70, "scanner"},
  {96, 70, "tank"},
  {98, 70, "tank"},
}


local playerMinings2 = {
  {94, 107, "mining"},
	{94, 109, "mining"},
	{96, 107, "mining"},
	{96, 109, "mining"},
	{105, 103, "mining"},
	{107, 103, "mining"},
	{105, 105, "mining"},
	{107, 105, "mining"},
	{100, 106, "mining"},
	{100, 104, "mining"},
  {109, 92, "mining"},
	{110, 90, "mining"},
}

local playerPlants2 = {
  {91, 97, "hvplant", "crawler", 2},
	{94, 97, "hvplant", "crawler", 2},
	{97, 97, "hvplant", "rocket", 2},
	{100, 97, "hvplant", "rocket", 2},
	{102, 97, "hvplant", "asgun", 2},
	{105, 97, "hvplant", "asgun", 2},
	{91, 99, "hvplant", "scanner", 2},
	{102, 99, "hvplant", "tank", 2},
  {91, 92, "hvplant", "tank", 2},
	{100, 92, "hvplant", "tank", 2},
  {105, 92, "lightplant", "scout", 2},
	{105, 89, "lightplant", "scout", 2},
	{105, 86, "lightplant", "scout", 2},
	
	{94, 101, "hvplant", "tank", 1}, -- to have enough materials
	{96, 101, "hvplant", "tank", 1}, -- to have enough materials
}

local unitList3 = {

}



local playerMinings3 = {

}

testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)
--testMatchLogic:addInitialUnitsForPlayer(unitList3, 3)

local data1 = {gold = 0, cameraX = 85, cameraY = 40, cameraZoom = 1}
local data2 = {gold = 0, cameraX = 85, cameraY = 90, cameraZoom = 1}
--local data3 = {gold = 0, cameraX = 50, cameraY = 30, cameraZoom = 1.5}


testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)
testMatchLogic:addInitialDataForPlayers(data3, 3)



function testMatchLogic:onMapLoaded(game, match)

  local map = match:getMap()
  --map:placeInitialResources(38, 38)
  
  for i,miningItem in ipairs(playerMinings1) do
    putFilledAndEnabledMiningWithResoucesOnMap(match, 1, miningItem[1], miningItem[2]);
  end
  
  
  for i,miningItem in ipairs(playerMinings2) do
    putFilledAndEnabledMiningWithResoucesOnMap(match, 2, miningItem[1], miningItem[2]);
  end
  
  
  for i,miningItem in ipairs(playerMinings3) do
    putFilledAndEnabledMiningWithResoucesOnMap(match, 3, miningItem[1], miningItem[2]);
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
  
  
  match:playerAtIndex(2):addEnemyLocation(Rect(80, 30, 20, 20), 5)
  --match:playerAtIndex(2):addEnemyLocation(Rect(40, 75, 20, 20), 5)
  --match:playerAtIndex(3):addDefenceLocation(Rect(35, 45, 20, 20))
  
  
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
