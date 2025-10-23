--[[
This scenario shows that you can predefine all starting units and clans completely skipping the deploy phase.
--]]

if RemoteDebugEnabled then
    require('RemoteDebug/mobdebug').start()
end
  
require('customMissionSettings')
require('customMissionLogic')
  
function putUnitMiningWithDefaultSettings(match, player_index, x, y)
    local unit_mining = match:playerAtIndex(player_index):createUnit(x, y, 'mining')
    unit_mining:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, unit_mining:getParameterMaxValue(UNIT_PARAMETER_TYPE_MATERIAL))
    unit_mining:turnOn()
    unit_mining:placeUnitOnMap(true)
    return unit_mining
end 
  
local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = '112x112-35.wrl'
testMatchSettings.mapName = 'Kannal'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 1, 'Player', Color(255, 255, 0, 255), false, '', 1))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 7, 'Axis', Color(119, 150, 255, 255), false, '', 2))

local gameSettings =
{
    game_name = 'Unfrozen',
    game_description = "An example match that sets up some initial units and skips the deploy phase.\n\nLet the battle begins!",
    uniset_name = "MACs",
    uniset_id = 85,
    start_gold = 500,
    ['amount of material'] = {
        ['raw']  = 2,               -- values:0,1,2
        ['fuel'] = 1,               -- values:0,1,2
        ['gold'] = 1,               -- values:0,1,2
    },
    ['total count of resource placements'] = 250, -- ~500 is max
    ['laying ability'] = true,
    ['enable gasoline'] = true,
    ['min_version'] = 18,
    ['one subbase'] = false,
    ['generate resources'] = true,
    ['complex construction'] = false,
    ['survey flag'] = MAX_MATCH_SURVEY_FULL,
    ['fixed teams'] = true,
}
testMatchSettings:applySettings(gameSettings) 

-- Setup API to this instance
TheMatchSettings = testMatchSettings

local testMatchLogic = CustomMissionLogic()

function testMatchLogic:onMapLoaded(game, match)
    -- nothing
end

function testMatchLogic:onMatchLoaded(game, match)
    -- nothing
end

function testMatchLogic:onMatchPrepared(game, match)
    
    local map = match:getMap()

    if true then
        local player = match:playerAtIndex(1)
        local unit
        player:setCameraPosition(58, 10, 1)
        
        map:placeResources(58, 10, RESOURCE_TYPE_FUEL, 32)
        map:placeResources(59, 11, RESOURCE_TYPE_RAW, 32)

        unit = player:createUnit(60, 10, 'powerpl'):placeUnitOnMap(false)
        unit = player:createUnit(58, 10, 'mining'):placeUnitOnMap(false)
        unit:turnOn()
        unit = player:createUnit(58, 12, 'constructor'):placeUnitOnMap(false)
        unit:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, 80)
        unit = player:createUnit(59, 12, 'engineer'):placeUnitOnMap(false)
        unit:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, 50)
        unit = player:createUnit(60, 12, 'awac'):placeUnitOnMap(false)
        unit = player:createUnit(61, 12, 'scout'):placeUnitOnMap(false)
    end

    if true then
        local player = match:playerAtIndex(2)
        local unit
        player:setCameraPosition(101, 101, 1.5)
        
        map:placeResources(102, 102, RESOURCE_TYPE_FUEL, 32)
        map:placeResources(101, 101, RESOURCE_TYPE_RAW, 32)

        unit = player:createUnit(103, 101, 'powerpl'):placeUnitOnMap(false)
        unit = player:createUnit(101, 101, 'mining'):placeUnitOnMap(false)
        unit:turnOn()
        unit = player:createUnit(101, 103, 'constructor'):placeUnitOnMap(false)
        unit:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, 80)
        unit = player:createUnit(102, 103, 'engineer'):placeUnitOnMap(false)
        unit:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, 50)
        unit = player:createUnit(103, 103, 'awac'):placeUnitOnMap(false)
        unit = player:createUnit(104, 103, 'scout'):placeUnitOnMap(false)
    end
end  

function testMatchLogic:getPlayerDeployLogic(player)
    if player:getPlayerId() == 1 then
        return GameMatchDeployLogic.deployPredefined(Rect(48,0, 20, 20))
    end
    if player:getPlayerId() == 2 then
        return GameMatchDeployLogic.deployPredefined(Rect(91, 91, 20, 20))
    end
    return GameMatchDeployLogic()
end

function testMatchLogic:onPlayerDeployStarted(match, player)
    -- nothing (no deploy in this match)
end

function testMatchLogic:onPlayerDeployFinished(match, player)
    -- nothing (no deploy in this match)
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
