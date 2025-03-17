# GameMatch

Represents the match. 

## Constructors

---
Not available because this object is managed by hosting application

## Methods

---
```
Int getNumberOfPlayers()
```
Returns the total amount of players in the game.

---
```
GameMatchPlayer playerAtIndex(Int index)
```
Returns a player at the specified index.

---
```
GameMap getMap()
```
Returns a map object.

---
```
GameMatchSettings getSettings()
```
Returns the game game settings.

---
```
GameUnit getUnitWithId(Int unitId)
```
Returns the unit with a specified id.

---
```
void setUnitName(Int unitId, String name)
```
Retains the name for a unit with a given id.

---
```
GameUnit getUnitWithName(String unitName)
```
Returns the unit with a name specified.
