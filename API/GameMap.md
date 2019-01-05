# GameMap
Represents map. 

```
Int getWidth()
```
Retrun map width

---
```
Int getHeight()
```
Retrun map height

---
```
void placeInitialResources(Int x, Int y)
```
Put initial resources (14 rawmat and 8 fuel) into a designated position.

Parameters:
- **Int x** - x coordinate of cell
- **Int y** - y coordinate of cell

Availability: 
- [x] Init
- [ ] Runtime

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
- **Int amount** - Amount of resource to place. 0-16

Availability: 
- [x] Init
- [ ] Runtime
