# GameMatchPlayer

Represents a player in the game.

## **Constructor**

---
Not available because this object is managed by hosting application

## **Methods**

---
```lua
Int getPlayerId()
```
Returns the player's unique in-game ID.

---
```lua
String getPlayerName()
```
Returns the player's display name.

---
```lua
Bool getPlayerAI()
```
Returns true if the player is controlled by AI.

---
```lua
Bool getPlayerAlive()
```
Returns true if the player is still in the game (not defeated).

---
```lua
String getPlayerAIName()
```
Returns the identifier of the AI implementation used by this player.

---
```lua
Int getPlayerClan()
```
Returns the player's Clan ID.

---
```lua
Int getPlayerTeam()
```
Returns the player's team number.

---
```lua
Int getUnitsCount()
```
Returns the total number of units owned by the player.

---
```lua
GameUnit getUnitAtIndex(Int index)
```
Returns a unit at the specified index from the player's unit list.

---
```lua
GameUnit createUnit(Int posx, Int posy, String type)
```
Creates a unit of the given type at the specified cell. The unit must be placed on the map manually using `placeUnitOnMap()`.

Parameters:
- **Int posx** - X coordinate
- **Int posy** - Y coordinate
- **String type** - Unit type identifier

---
```lua
GameUnit getUnitWithId(Int unitId)
```
Returns a unit owned by this player with a given ID.

---
```lua
void addUnitTypeUpgrade(String type, Int parameterType, Int value)
```
Applies a permanent upgrade to all units of a certain type for this player.

Parameters:
- **String type** - unit type to upgrade
- **Int parameterType** - parameter to upgrade (see Constants.md)
- **Int value** - amount to add

---
```lua
void setAvailableGold(Int amount)
```
Sets the amount of gold available to the player.

---
```lua
void addEnemyLocation(Rect zone, Float danger)
```
Informs the AI about enemy presence in a specific zone.

---
```lua
void addDefenceLocation(Rect zone)
```
Instructs the AI to prioritize defense in a specific area.

---
```lua
void removeDefenceLocation(Rect zone)
```
Removes a previously set defense zone for the AI.

---
```lua
void setAIRefuelAutomatically(Bool refuelAutomatically)
```
Controls whether the AI handles refueling automatically.

---
```lua
void setCameraPosition(Int x, Int y, Float zoom)
```
Moves the player's camera and sets the zoom level.

Parameters:
- **Int x** - X cell coordinate
- **Int y** - Y cell coordinate
- **Float zoom** - Zoom value (0.5 to 2.0 typically)
