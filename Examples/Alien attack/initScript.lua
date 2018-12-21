--[[
Alien attack!
Author: Malakia
--]]

if RemoteDebugEnabled then
  require('RemoteDebug/mobdebug').start()
end

require('customMissionSettings')
require('customMissionLogic')



local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Green_4.wrl'
testMatchSettings.mapName = 'Alien Attak'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 3, 'Player 1', Color(237, 237, 54, 255), false, '', 0))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 1, 'Player 2', Color(25, 116, 210, 255), true, '', 1))

local gameSettings =
{
    game_name = 'Alien Attack',
    game_description = 'Aliens are attaking you from all directions! Defend your complex as long as you can!',
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
  {57, 18, "pehplant"},
  {59, 18, "pehplant"},
  {57, 21, "pehplant"},
  {53, 21, "powerpl"},
  {53, 25, "mining", action_placeAndTurnOn},
  {56, 25, "habitat"},
  {59, 25, "research"},
  {61, 25, "research"},
  {61, 23, "research"},
  {56, 27, "barrak"},
  {47, 26, "ecosphere"},
  {47, 28, "ecosphere"},
  {49, 28, "ecosphere"},

  {47, 25, "conn"},
  {51, 28, "conn"},
  {52, 28, "conn"},
  {53, 28, "conn"},
  {55, 26, "conn"},
  {58, 26, "conn"},
  {54, 24, "conn"},
  {54, 23, "conn"},
  {55, 22, "conn"},
  {56, 22, "conn"},
  {59, 22, "conn"},
  {60, 22, "conn"},
  {61, 22, "conn"},
  {58, 20, "conn"},

  {49, 35, "scout"},
  {58, 35, "scout"},
  {61, 32, "scout"},
  {49, 22, "scout"},
  {66, 19, "scout"},
  {66, 20, "scout"},
  {59, 14, "scout"},

  {46, 26, "aagunm"},
  {46, 29, "aagunm"},
  {50, 30, "aagunm"},
  {59, 27, "aagunm"},
  {60, 27, "aagunm"},
  {61, 27, "aagunm"},
  {62, 27, "aagunm"},
  


  {48, 25, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  {48, 30, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  {57, 29, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  {56, 20, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},
  {63, 22, "engineer", UNIT_PARAMETER_TYPE_MATERIAL, 40},  

  {51, 30, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {56, 21, "repair", UNIT_PARAMETER_TYPE_MATERIAL, 30},
  {55, 21, "truck", UNIT_PARAMETER_TYPE_MATERIAL, 50},

  {57, 23, "crawler"},
  {56, 23, "crawler"},
  {56, 24, "crawler"},
  {57, 24, "crawler"},
  {58, 23, "rocket"},
  {58, 24, "rocket"},

  {63, 18, "inter"},
  {63, 19, "inter"},
  {63, 20, "inter"},
  {63, 21, "inter"},

  {59, 24, "landpad"},
  {60, 24, "landpad"},
  {53, 27, "radar"},
  {52, 27, "powergen"},

  {52, 21, "matstore"},
  {52, 22, "matstore"},
  {52, 25, "matstore"},
  {54, 27, "matstore"},
  {50, 27, "matstore"},
  {49, 27, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},
  {49, 26, "matstore", UNIT_PARAMETER_TYPE_MATERIAL, 50},

}

do
  local i = #unitList1
  local y = 16
  for x = 57, 61 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  y = 17
  for x = 56, 62 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 18
  for x = 56, 56 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 61, 63 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  y = 19
  for x = 56, 56 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 61, 63 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  y = 20
  for x = 51, 63 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 21
  for x = 50, 51 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 55, 56 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 59, 63 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 22
  for x = 50, 51 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 55, 56 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 59, 64 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 23
  for x = 48, 60 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 63, 64 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 24
  for x = 46, 58 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 63, 65 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 25
  for x = 46, 51 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 55, 55 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 58, 58 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 63, 65 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 26
  for x = 46, 46 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 50, 52 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 55, 58 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 63, 64 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 27
  for x = 46, 46 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 51, 51 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 55, 55 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 58, 62 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 28
  for x = 46, 46 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 51, 55 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 58, 62 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 29
  for x = 46, 46 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  for x = 51, 60 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  
  y = 30
  for x = 46, 57 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
  
  y = 31
  for x = 47, 54 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end

  y = 32
  for x = 49, 52 do
    i = i + 1
    unitList1[i] = {x, y, "road"}
  end
end




local unitList2 = {

  {56, 70, "alntank"},
  {57, 70, "alntank"},
  {58, 70, "alntank"},
  {59, 70, "alntank"},
  {59, 71, "alntank"},
  {58, 68, "scanner"},
  {56, 69, "alnasgun"},
  {57, 69, "alnasgun"},
  {58, 69, "alnasgun"},
  
  {103, 96, "alnplane"}, 
  {104, 96, "alnplane"},  
  
  {81, 58, "alnasgun"},  
  {82, 58, "alnasgun"},  
  {80, 57, "alntank"},  
  {81, 57, "alntank"}, 
  {82, 57, "alntank"},  
  {83, 57, "alntank"},    
  {82, 56, "scanner"},  
  
  {77, 53, "alnplane"}, 
  {78, 53, "alnplane"},   
  {79, 53, "alnplane"},  
  
  {80, 46, "juger"},
  {80, 47, "juger"},
  {80, 48, "juger"},
  
  {87, 44, "alnasgun"},
  {88, 44, "alnasgun"}, 
 
  {86, 43, "alntank"}, 
  {87, 43, "alntank"},
  {88, 43, "alntank"},
  {89, 43, "alntank"},
  {87, 42, "scanner"},

  {91, 32, "scanner"},
  {92, 30, "alntank"},
  {92, 31, "alntank"},
  {92, 32, "alntank"},
  {92, 33, "alntank"},
  {92, 34, "alntank"},
  {92, 35, "alntank"},

  {93, 31, "alnasgun"}, 
  {93, 32, "alnasgun"},
  {93, 33, "alnasgun"}, 

  {94, 29, "alnplane"},
  {94, 30, "alnplane"},
  {94, 31, "alnplane"},  

  {54, 3, "awac"},  
  
  {40, 47, "awac"},  
}

do
  i = #unitList2
   for y = 45, 50 do
    for x = 53, 55 do
      i = i + 1
      unitList2[i] = {x, y, "bridge"}
    end
  end
 end


testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)

local data1 = {gold = 100, cameraX = 55, cameraY = 24, cameraZoom = 1}
local data2 = {gold = 1000, cameraX = 50, cameraY = 30, cameraZoom = 1.5}

testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)



function testMatchLogic:onMapLoaded(game, match)

  local map = match:getMap()
  map:placeInitialResources(53, 25)

end



function testMatchLogic:onMatchLoaded(game, match)

  match:playerAtIndex(1):addUnitTypeUpgrade("turret", UNIT_PARAMETER_TYPE_ATTACK, 2)
  match:playerAtIndex(1):addUnitTypeUpgrade("turret", UNIT_PARAMETER_TYPE_HEALTH, 2)
  match:playerAtIndex(1):addUnitTypeUpgrade("arturret", UNIT_PARAMETER_TYPE_ATTACK, 2)
  match:playerAtIndex(1):addUnitTypeUpgrade("arturret", UNIT_PARAMETER_TYPE_HEALTH, 2)
  match:playerAtIndex(2):addEnemyLocation(Rect(46, 15, 20, 16), 5)

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
