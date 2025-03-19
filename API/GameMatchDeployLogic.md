# GameMatchDeployLogic

Represents a unit in the game.

## Constructor

---
Not available because this object is managed by hosting application

## Methods

---
```lua
static GameMatchDeployLogic deployDefault()
```
The default behavior.

---
```lua
static GameMatchDeployLogic deployZone(Rect zone)
```
Deploy is set to a predefined zone. Player will have to choose the position inside of the zone.

---
```lua
static GameMatchDeployLogic deployPosition(Point position)
```
Deploy is set to a specific position. Player will not be asked to choose a deploy point and all his units will be deployed to a position set in the script, without ground type checks.

---
```lua
static GameMatchDeployLogic deployPredefined(Rect zone)
```
Deploy is skipped. If the survey is set to MAX_MATCH_SURVEY_MIN, the zone will be used to unveil resources.

## Properties

---
```lua
Point position
```
The deploy position, if set

---
```lua
Rect zone
```
The full rectangular zone, if set
