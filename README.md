# MAXTouch-docs
This repo contains documentation and specifications for M.A.X. Touch build-in scripting system

# Table of Contents
1. [Overview](#Overview)
    1. [Initialization script](#Initialization-script)
    2. [Runtime script](#Runtime-script)
    3. [Executing](#Executing)
    4. [Testing scenarios](#Testing-scenarios)
    5. [Uploading scenarios](#Uploading-scenarios)
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
This specification explains about M.A.X. Touch embedded scripting API. Using this API you can write your own scenarios.

Facebook community:
https://www.facebook.com/groups/1420889268172393/

## Initialization script
Initialize script is a script that will initialize match. It is executing during game load and its primary goal is to initialize game. 

Initialize script will specify:
- game information: name, description
- uniset
- map
- resource map
- players
- initial units
- initial upgrades

## Runtime script
Runtime script allow you to write logic that will be executed during the match. Game call script event handler and script can execute some logic at this moment.

## Executing
Initialization script and Runtime script will be running in main thread.

Initialization script and Runtime script have different contexts so values defined on Initialization script will not be available in Runtime script.

Please note that some APIs are available for Initialization script and not available for Runtime script, and vise versa.

## Testing scenarios
<TBD> Test your scenario locally before uploading it on a website.

## Uploading scenarios
<TBD> Upload your scenarios on a website

# API Specification
This section contains information about objects and its APIs that hosting application exposes to lua side. 

**Structures** are passed to script by value with transferring ownership into lua.

**Objects** will be passed by pointer and will stay owned/managed by M.A.X. Do not retain them for a long time - basically script will not know when object will be deleted.

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
Current version: 10.0
    