# MACS-docs
This repo contains documentation and specifications for MACS (Mechanized Assault Commanders) build-in scripting system

# Table of Contents
1. [Overview](#Overview)
    1. [Initialization script](#Initialization-script)
    2. [Runtime script](#Runtime-script)
    3. [Executing](#Executing)
    4. [Uploading / using scenarios](#Uploading-and-using-scenarios)
2. [API Specification](#API-Specification)
    1. [Structures](#Structures)
    2. [Game](#Game)
    3. [GameMap](#GameMap)
    4. [GameMatch](#GameMatch)
    5. [GameMatchPlayer](#GameMatchPlayer)
    6. [GameUnit](#GameUnit)
3. [Event System](#Event-System)
4. [Quest System](#Quest-System)
5. [Revisions](#Revisions)

# Overview
This specification explains about MACS Touch embedded scripting API. Using this API you can write your own scenarios.

Facebook community:
https://www.facebook.com/groups/1420889268172393/

## Useful hints:
- **In order to find unit types**, open **Units/originalUniset.json**, refer to **_type** value. For example, **Heavy vehicle plant** is **hvplant**.
- **In order to find available maps** refer to **loadedRemoteMaps.json** in **Saves** folder. You should put desired map's **file** property + **.wrl**, for example **224x2246.wrl** to start on **Revelation** map.

## Initialization script
Initialize script is a script that will initialize match. It should be named initScript.lua and should be located in root directory of scenario zip arhive. 

This script will be executed during game load in order to initialize the game. 

For details about initializion script please refer to [Guide for Initialization script](API/GudeForInitializationScript.md).

## Runtime script
> This is still work in progres and not supported for scenarios. You can play with tutorial0Runtime.lua

Runtime script is a script that contains logic that will be executed during the match, on top of running game. Game is constantly calling script event handler on each game event and allows script to handle those events by executing some logic at this moment.

For details about runtime script please refer to [Guide for Runitme script](API/GudeForRuntimeScript.md).

## Executing
Initialization script and Runtime script will be running in main thread.

Initialization script and Runtime script have different contexts so values defined on Initialization script will not be available in Runtime script.

Please note that some APIs are available for Initialization script and not available for Runtime script, and vise versa.

## Uploading and using scenarios
After you done with your scenario and want to show it to community you should do following steps:

1. rename initialization script file (**testMatch.lua** file) into **initScript.lua**
2. zip this file into arhive. Archive should contains this file in a root folder.
3. go to website https://maxsrv.automania.net/#
4. naviage to **MY -> My Scenarios:** https://maxsrv.automania.net/my/scenarios.html
5. Choose **Create New** https://maxsrv.automania.net/my/edit-scenario.html
6. Press **Choose File** button and select your zip archive
7. Website will parse your script file and show its data. Press **Add**
8. Now your script is uploaded. Press **Ready** and **Save** to show it in the game.

Now new scenario should appear for you in game.

On scenarios page (navigate to **Game -> Scenarios** https://maxsrv.automania.net/game/scenarios.html ) you can see all available scenarios. 

Choose any scenario created by other member (for example: https://maxsrv.automania.net/game/scenario/3.html) and press **Add to my list**  in order to see it in game.

# API Specification
This section contains information about objects and its APIs that hosting application exposes to lua side. 

**Structures** are passed to script by value with transferring ownership into lua.

**Objects** will be passed by pointer and will stay owned/managed by MACS engine. Do not retain them for a long time - basically script will not know when object will be deleted.

## Structures
- Color
- Rect
- Size
- Point
- GameMatchPlayerInfo

[Structures API description](API/Structures.md)

## Constants

[API's contstants description](API/Constants.md)

## Game
Represents top-level game state. Game object is responsible for working with UI and user input: windows, visual pointers, UI blocks and so on.

[Game API description](API/Game.md)

## GameMap
Represents a map. Map contains infomation about

[GameMap API description](API/GameMap.md)

## GameMatch
Represents match. Match contains all players and some extra information about its state.

[GameMatch API description](API/GameMatch.md)

## GameMatchPlayer
Represents player

[GameMatchPlayer API description](API/GameMatchPlayer.md)

## GameUnit
Represents unit

[GameUnit API description](API/GameUnit.md)

# Event System
Built-in event system allow you to track and handle some game events.

# Quest System
Quest system is based on handling events.

# Revisions
Current version: 10.2.1
    
