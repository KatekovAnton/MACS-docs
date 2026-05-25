# GameMatch

Represents the match and provide access to the global game state.

## Constructors

---
Not available because this object is managed by hosting application

## Methods

---
```lua
Int getNumberOfPlayers()
Int getPlayersCount()
```
Returns the total amount of players in the game.

---
```lua
GameMatchPlayer playerAtIndex(Int index)
```
Returns a player at the specified index.

---
```lua
GameMap getMap()
```
Returns a map object.

---
```lua
GameMatchSettings getSettings()
```
Returns the game game settings.

---
```lua
GameUnit getUnitWithId(Int unitId)
```
Returns the unit with a specified id.

---
```lua
void setUnitName(Int unitId, String name)
```
Retains the name for a unit with a given id.

---
```lua
GameUnit getUnitWithName(String unitName)
```
Returns the unit with a name specified.

---
```lua
Int getCurrentTurn()
```
Returns current turn number.

---
```lua
Int getCurrentPlayer()
```
Returns ID of the player whose turn it is.

---
```lua
Bool canDeployPlayer(GameMatchDeployLogic logic)
```
Checks if the given deploy logic can be executed.

---
```lua
void changeUnitOwner(Int unitId, Int newOwnerId)
```
Transfers ownership of a unit.

---
```lua
void removeUnit(Int unitId, Bool byDestruction)
```
Removes unit from the game.

---
```lua
void higlightActiveUnit(Int unitId, Float time)
```
Visual hint to highlight a specific unit.

---
```lua
void makePlayerTeamWin(Int playerId)
```
Instantly finish match with victory for specified player's team.

---
```lua
void recordInteger(String name, Int value)
```
Records a persistent integer value (useful for campaign variables).

---
```lua
Int getInteger(String name)
```
Retrieves a persistent integer value.

## Quest & Environment System

---
```lua
void addPoint(Point position, String name, Bool visible)
```
Adds a named navigation/script point.

---
```lua
void addZone(Point position, Float radius, String name, Bool visible)
```
Adds a named circular zone.

---
```lua
void addGarbage(Int x, Int y, Int size, Int rawMat, Int rawMatPerTurn)
```
Adds resource-containing garbage to the map.

---
```lua
void addDecoration(String id, Int type, Int size, Int x, Int y)
```
Adds a visual decoration.

---
```lua
void removeDecoration(String id)
```
Removes a decoration by its unique ID.

---
```lua
void taskActivated(String id, String title, String description, Int x, Int y)
```
Displays a new task/objective to the player.

---
```lua
void taskCompleted(String id)
```
Marks a task as completed.

---
```lua
void taskFailed(String id)
```
Marks a task as failed.

---
```lua
void taskRemoved(String id)
```
Removes a task from the list.
