--[[
testMatch.lua
This is Test mission script
--]]

if RemoteDebugEnabled then
  require('RemoteDebug/mobdebug').start()
end

require('customMissionSettings')
require('customMissionLogic')



local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = 'Desert_4.wrl'
testMatchSettings.mapName = 'Incandescent machines'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 1, 'Player 1', Color(237, 237, 54, 255), false, '', 0))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 6, 'Player 2', Color(25, 116, 210, 255), true, '', 1))
testMatchSettings:addPlayer(GameMatchPlayerInfo(3, 3, 'Player 3', Color(25, 246, 10, 255), true, '', 1))
local gameSettings =
{
    game_name = 'Test AI',
    uniset_name = "Original",
    game_description = 'Test scenario that I created to test how AI is fighting to himself. I played it for maybe thousands of times.\n\nJust watch how two AIs are killing each other!',
    start_gold = 301,
    ['amoun of material'] = {
        ['raw']  = 2,               -- values:0,1,2
        ['fuel'] = 2,               -- values:0,1,2
        ['gold'] = 2,               -- values:0,1,2
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



local unitList1 = {
{72, 59, "awac"},
{47, 13, "radar"},
{50, 59, "infil"},
{67, 61, "radar"},
{66, 61, "aagunm"},
}

local unitList2 = {
{49, 25+29, "scout"},
{41, 26+29, "scout"},
{49, 26+29, "scout"},
{50, 25+29, "alntank"},
{48, 25+29, "alntank"},
{47, 25+29, "alntank"},
{49, 28+29, "alntank"},
{49, 29+29, "alntank"},
{49, 30+29, "alntank"},
{49, 24+29, "asgun"},
{50, 24+29, "asgun"},
{51, 24+29, "asgun"},
{52, 24+29, "asgun"},

{47, 56, "infil"},

{52, 54, "alnplane"},
{53, 54, "alnplane"},
{54, 54, "alnplane"},
{55, 54, "alnplane"},
{53, 55, "alnplane"},
{54, 55, "alnplane"},
{55, 55, "alnplane"},
{56, 55, "alnplane"},

{53, 26, "scout"},
{46, 57, "awac"},
{52, 51, "awac"},
}

local unitList3 = {
--{56, 31, "awac"},
--{56, 30, "zenit"},
{56, 31, "misturret"},
{59, 29, "tank"},
{58, 31, "tank"},
{57, 31, "tank"},
{60, 31, "tank"},
{60, 32, "tank"},
{60, 33, "tank"},
{60, 34, "tank"},

{61, 29, "rocket"},
{61, 30, "rocket"},
{61, 31, "rocket"},
{61, 32, "rocket"},
{61, 33, "rocket"},
{61, 34, "rocket"},
{61, 35, "rocket"},
--{59, 31, "scout"},
--{58, 32, "scout"},
{59, 34, "scout"},

{62, 34, "aagunm"},
{62, 35, "aagunm"},
{62, 36, "aagunm"},

{67, 28, "awac"},
{68, 28, "awac"},

{57, 28, "inter"},
{58, 28, "inter"},
{59, 28, "inter"},
{60, 28, "inter"},
{61, 28, "inter"},

{57, 27, "bomber"},
{58, 27, "bomber"},
{59, 27, "bomber"},
{60, 27, "bomber"},
{61, 27, "bomber"},
}

testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
testMatchLogic:addInitialUnitsForPlayer(unitList2, 2)
testMatchLogic:addInitialUnitsForPlayer(unitList3, 3)



local data1 = {gold = 1000, cameraX = 50, cameraY = 36, cameraZoom = 1}
local data2 = {gold = 1000, cameraX = 50, cameraY = 30, cameraZoom = 1.5}



testMatchLogic:addInitialDataForPlayers(data1, 1)
testMatchLogic:addInitialDataForPlayers(data2, 2)



function testMatchLogic:onMapLoaded(game, match)

    local map = match:getMap()
    map:placeInitialResources(86, 32)
    map:placeInitialResources(69, 34)
    map:placeInitialResources(69, 36)
    map:placeInitialResources(84, 27)
    map:placeInitialResources(35, 91)
    map:placeInitialResources(96, 92)
    map:placeInitialResources(84, 34)

end



function testMatchLogic:onMatchLoaded(game, match)

    match:playerAtIndex(1):addUnitTypeUpgrade("radar", UNIT_PARAMETER_TYPE_SCAN, 20)

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
