# Initialization scripting

## Table of Contents

1. [Overview](#Overview)
2. [Settings and players](#Settings-and-players)
3. [Adding units](#Adding-units)
4. [Player status](#Player-status)
5. [Loading Phases](#Loading-Phases)
    1. [Map Loaded](#Map-loaded)
    2. [Match Loaded](#Match-loaded)
    3. [Match Prepared](#Match-prepared)
    4. [Deploy Started](#Deploy-Started)
    5. [Deploy Finished](#Deploy-Finished)
6. [Deploy Logic](#Deploy-Logic)
7. [Run](#Run)

Example scenarios:

- [Alien Attack](../Examples/Alien_attack/initScript.lua)
- [Tank horde](../Examples/Tank_horde/initScript.lua)
- [Man versus Machine](../Examples/Man_versus_Machine/initScript.lua)
- [Test AI](../Examples/Test_AI/initScript.lua)

## Overview

On the start of the game, the script can specify:

- game information like the game name and description
- uniset
- map
- resource map
- players
- initial units
- initial upgrades
- deploy logic

To start creating your scenario, please open test match script which is located in game resources folder `Resources/Scripts/testMatch.lua`:

 ![](../Images/initScript1.jpg) 

You can open it with any text editor. We recommend Visual Studio Code, Atom, Sublime Text or Notepad++ because they have option to highlight script syntax, which is very useful.

In order to run the script, start the game, go `LOCAL GAME` and press small `{>}` button on the top-left corner of the screen. Game will start a local game with the content of `testMatch.lua`.

## Settings and players

First, you should craete a game settings - defining rules, map, players, game name and so on. 

```lua
local testMatchSettings = CustomMatchSettings()
testMatchSettings.mapFileName = '112x1123.wrl'
testMatchSettings.mapName = 'Incandescent machines'
testMatchSettings:addPlayer(GameMatchPlayerInfo(1, 2, 'Player 1', Color(237, 237, 54, 255), false, '', 1))
testMatchSettings:addPlayer(GameMatchPlayerInfo(2, 4, 'Player 2', Color(25, 116, 210, 255), true, '', 1))
local gameSettings =
{
    game_name = 'Example',
    game_description = 'An example scenario!',
    uniset_name = "MACs",
    uniset_id = 87,
}
testMatchSettings:applySettings(gameSettings) 
```

Full list of the `game_settings` parameters are:

- `uniset_name`
- `uniset_id`
- `game_name`
- `start_gold`
- `amount of material`
- `total count of resource placements`
- `laying ability`
- `enable gasoline`
- `expensive reload/repair/rearm`
- `survey flag`
- `generate resources`
- `complex construction` 
- `min_version`

## Adding units

Keep in mind that you can only create units and set upgrades only if player already has a clan set.

### Using Unit List

You can add any units by simply setting the list of units with their starting parameters.

```lua
local unitList1 = {
    ...
}
testMatchLogic:addInitialUnitsForPlayer(unitList1, 1)
```

Here we defining units for player1. Unit List parameters examples:

```lua
{31, 50, "fuelstore", UNIT_PARAMETER_TYPE_FUEL, 10}
```

Create Fuel Store on position (31, 50) and set Fuel to 10. This is old format and not recommended for usage. The recommended format:

```lua
{32, 50, "matstore", {material = 42, name = 'matStore1'}}
```

It creates a Material Storage on position (32, 50) and sets Materials to 42.
Also this unit will be given a name "matStore1". This name can be used for quick and convenient access later in the script runtime or reused in campaign.

All list of supported parameters:

```lua
material = 42 -- set materials
fuel = 10 -- set fuel
gold = 20 -- set gold
turn_on = 1 -- turn on building or unit. Default action is place on map
name = 'unit_name' -- set unit name for access later in script or engine
produce = 'type' -- set unit type for producing. See unit:setBuildUnit(produce, speed)
speed = 1 -- set unit speed fo producing. See unit:setBuildUnit(produce, speed)
```

## Player status

```lua
local data1 = {gold = 1000, cameraX = 83, cameraY = 30, cameraZoom = 1}
```
It means start gold, initial camera position and scale.

## Loading Phases

Game defines a few phases of loading the game. During this, a corresponding script function is called. You can use these function in analyse the match state and perform different custom actions.

Resources are generated randomly in few scenarios. Please keep in mind that mining stations should be set after the resources in their cells are generated.

### Map loaded

---
```lua
function testMatchLogic:onMapLoaded(game, match)
```

This function is being called when map is initialized.

```lua
function testMatchLogic:onMapLoaded(game, match)

    -- put resource field
    local map = match:getMap()
    map:placeInitialResources(38, 38)

end
```

### Match Loaded

---
```lua
function testMatchLogic:onMatchLoaded(game, match)
```

This function is being called when everything is loaded and initial units specified in lists were added.

```lua
function testMatchLogic:onMatchLoaded(game, match)

    -- create interceptor
    match:playerAtIndex(2):createUnit(62, 41, 'inter'):placeUnitOnMap(false)

    -- create APC with an infantry inside
    local pcan1 = match:playerAtIndex(2):createUnit(69, 44, 'pcan')
    pcan1:placeUnitOnMap(false)
    local inf1 = match:playerAtIndex(2):createUnit(69, 43, 'infantry')
    pcan1:storeUnitToCargo(inf1)

    -- create truck with minerals
    local truck1 = match:playerAtIndex(2):createUnit(36, 59, 'truck')
    truck1:setParameterValue(UNIT_PARAMETER_TYPE_MATERIAL, 50)
    truck1:placeUnitOnMap(false)

    -- add attack upgrade to Artillery
    match:playerAtIndex(1):addUnitTypeUpgrade('arturret', UNIT_PARAMETER_TYPE_ATTACK, 2)

end
```

### Match Prepared

---
```lua
function testMatchLogic:onMatchPrepared(game, match)
```
This function is being called when after everything is prepared to game. Here you can set last parameters that will be applied after applying initial upgrades, placement logic and so on.

```lua
function testMatchLogic:onMatchPrepared(game, match)

    -- get awac and set 1 gasoline to it
    local awac = match:playerAtIndex(2):getUnitWithId(4)
    awac:setParameterValue(UNIT_PARAMETER_TYPE_GAS, 10)

end
```

### Deploy Started

---
```lua
function testMatchLogic:OnPlayerDeployStarted(match, player)
```
This function is being called during player deploy after his resources has been generated. You can add initial upgrades here.

```lua
function testMatchLogic:OnPlayerDeployStarted(match, player)
    
    -- add attack upgrade to Artillery
    match:playerAtIndex(1):addUnitTypeUpgrade('arturret', UNIT_PARAMETER_TYPE_ATTACK, 2)

end
```

### Deploy Finished

---
```lua
function testMatchLogic:onPlayerDeployFinished(match, player)
```
This function is being called during the player deploy pricess, right after initial units (default mining station and other) has been instantiated.

```lua
function testMatchLogic:onPlayerDeployFinished(match, player)
    
    if player:getPlayerId() == 1 then
        player:setCameraPosition(58, 10, 1)
        local mining = player:createUnit(58, 10, 'mining'):placeUnitOnMap(false)
    end

    if player:getPlayerId() == 2 then
        player:setCameraPosition(101, 101, 1.5)
        local mining = player:createUnit(101, 101, 'mining'):placeUnitOnMap(false)
    end
end
```

## Deploy Logic

You can specify a deploy logic for players individually by returning a desired option using a function
`getPlayerDeployLogic`:

```lua
function testMatchLogic:getPlayerDeployLogic(player)
    if player:getPlayerId() == 1 then
        -- player 1 can choose a point on the territory
        return GameMatchDeployLogic.deployZone(Rect(48, 12, 20, 20))
    end
    if player:getPlayerId() == 2 then
        -- player 2 is given a special position
        return GameMatchDeployLogic.deployPosition(Point(26, 77))
    end
    if player:getPlayerId() == 3 then
        -- player 3 deploys as usual
        return GameMatchDeployLogic.deployDefault()
    end
    -- all other
    return GameMatchDeployLogic.deployDefault()
end
```

The game will do it's bets to combine all these options with with the rest of deploy mechanics
like Complex Construction or Start Units and Upgrades Selection.

Known Incompatibilities:

1. Using no deploy logic for all players (all players set to `deployPredefined`) and setting all clans but still setting the Complex Construction flag in settings:
   - Game will ignore the Complex Construction flag

## Run

After you modified testMatch.lua script you should save it (please keep original copy) and
overwrite the existing script. Start the test match in game to see to try your changes out.
