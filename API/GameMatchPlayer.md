# GameMatchPlayer

Represents a player in the game.

## **Constructor**

---
Not available because this object is managed by hosting application

## **Methods**

---
```lua
int getPlayerId()
```
Returns whatever the player in-game id.

---
```lua
string getPlayerName()
```
Returns whatever the player name.

---
```lua
bool getPlayerAI()
```
Returns whatever the player is AI or not.

---
```lua
bool getPlayerAlive()
```
Returns whatever the player is alive or not.

---
```lua
int getPlayerAIName()
```
Returns the AI name of AI an player.

---
```lua
int getPlayerClan()
```
Returns the player Clan id.

---
```lua
int getPlayerTeam()
```
Returns the player's team number

---
```lua
int getUnitsCount()
```
Returns the player's total amount of units.

---
```lua
GameUnit getUnitAtIndex()
```
Returns a unit on a given index.

---
```lua
GameUnit createUnit(Int posx, Int posy, String type)
```
Creates a unit of given type and located in a given cell. You should place it on the map manually.

Parameters:
- **Int posx** - position x
- **Int posy** - position y
- **String type** - type

---
```lua
GameUnit getUnitWithId(Int unitId)
```
Returns a unit with a given Id. 

Paramegters:
- **Int unitId** - unitId of desired unit

---
```lua
void addUnitTypeUpgrade(String type, Int parameterType, Int value)
```
Adds an upgrade for given unit type to given parameter type on a given value. We assume that script developers will maintain basic rules of upgrades and will not pass negative or big values.

Parameters:
- **String type** - unit type to upgrade
- **Int parameterType** - parameter to upgrade. Refer to [API's contstants description](Constants.md)
- **Int value** - value to upgrade

---
```lua
String getPlayerName()
```
Returns player's name.

---
```lua
void setAvailableGold(Int amount)
```
Sets an available gold for player.

Parameters:
- **Int amount** - gold

---
```lua
void addEnemyLocation(Rect zone, Float danger)
```
Will make effect only if player is AI. This call will let them know where is the enemy. AI will handle this information based on his common rules.

Parameters:
- **Rect zone** - zone to search for enemy
- **Float danger** - estimated danger around. Put 1 to 5 here in order to avoid any side effects caused by additinonal danger zone.

---
```lua
void addDefenceLocation(Rect zone)
```
Will make effect only if player is AI. This call will allocate all units in given are to defensive behaviour. Units will not leave territory once enemy spotted. If defender unit will be attacked he will change behaviour to default.

Parameters:
- **Rect zone** - zone that should be protected

---
```lua
void setCameraPosition(Int x, Int y, Float zoom)
```
Sets an initial camera position to a given cell coordinates with a given zoom value

Parameters:
- **Int x** - x position
- **Int y** - y position
- **Float zoom** - zoom vaule. Minimum value is 0.5.
