# GameMap

Represents the game map. 

```
String getFileName()
```
Retruns map file name

---
```
Int getWidth()
```
Retruns map width

---
```
Int getHeight()
```
Retruns map height

---
```
void placeInitialResources(Int x, Int y)
```
Put initial resources (14 rawmat and 8 fuel) into a designated position.

Parameters:
- **Int x** - x coordinate of cell
- **Int y** - y coordinate of cell

---
```
void placeResources(Int x, Int y, Int resource, Int amount)
```
Put specified amount of specified resources into a designated position. The rules are:
- For RAW: odd x, odd y
- For FUEL: even x, even y
- For GOLD: even x, odd y
Otherwise resources will not be placed.

Parameters:
- **Int x** - x coordinate of cell
- **Int y** - y coordinate of cell
- **Int resource** - Resource type: RESOURCE_TYPE_RAW, RESOURCE_TYPE_FUEL or RESOURCE_TYPE_GOLD
- **Int amount** - Amount of resource to place. 0-32

---
```
Int getResourceType(Int x, Int y)
```
Returns the type of resource in the specified cell. Resource types are listed in [Constrants](Constants.md##Resource-Types)

Parameters:
- **Int x** - x coordinate of cell
- **Int y** - y coordinate of cell

---
```
Int getResourceValue(Int x, Int y)
```
Returns the amount of resource in the specified cell.

Parameters:
- **Int x** - x coordinate of cell
- **Int y** - y coordinate of cell
