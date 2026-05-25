# GameMap

Represents the physical game world.

## Methods

---
```lua
String getFileName()
```
Returns the map file name.

---
```lua
Int getWidth()
```
Returns map width in cells.

---
```lua
Int getHeight()
```
Returns map height in cells.

---
```lua
Int getGroundType(Int x, Int y)
```
Returns the physical ground type (Water, Land, Coast, etc.) at the specified cell.

---
```lua
void placeInitialResources(Int x, Int y)
```
Places a standard starting resource cluster (14 Raw Materials, 8 Fuel).

---
```lua
void placeResources(Int x, Int y, Int resource, Int amount)
```
Manually places resources in a cell. 
- **RESOURCE_TYPE_RAW**: Requires odd X, odd Y.
- **RESOURCE_TYPE_FUEL**: Requires even X, even Y.
- **RESOURCE_TYPE_GOLD**: Requires even X, odd Y.

---
```lua
Int getResourceType(Int x, Int y)
```
Returns the type of resource at the specified cell (see [Constants.md](Constants.md)).

---
```lua
Int getResourceValue(Int x, Int y)
```
Returns the amount of resource (0-32) at the cell.
