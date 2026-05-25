# GameMatchDeployLogic

Defines how a player is placed on the map during the initial game phase.

## Constructors

---
Not available directly. Use static factory methods.

## Static Methods

---
```lua
static GameMatchDeployLogic deployDefault()
```
The default behavior: player starts with standard units based on match settings.

---
```lua
static GameMatchDeployLogic deployZone(Rect zone)
```
Restricts deployment to a specific rectangular zone. Player must choose a point within this zone.

---
```lua
static GameMatchDeployLogic deployPosition(Point position)
```
Forces deployment to an exact position. The player skips the selection phase.

---
```lua
static GameMatchDeployLogic deployPredefined(Rect zone)
```
Skips the deployment phase entirely. Initial units must be manually created via script. The `zone` is used to unveil resources if survey is enabled.

## Properties

---
```lua
Point position
```
The forced deploy position (if using `deployPosition`).

---
```lua
Rect zone
```
The allowed deploy zone (if using `deployZone` or `deployPredefined`).
