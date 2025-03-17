# GameUnit

Represents a unit in the game.

## Constructor

---
Not available because this object is managed by hosting application

## Methods

---
```lua
Int getId()
```
Return unit's unique identifier.

---
```lua
String getType()
```
Return unit's type.

---
```lua
Point getPosition()
```
Return unit's position.

---
```lua
bool getIsMoving()
```
Returns true if unit is moving right now.

---
```lua
Int getUnitNumber()
```
Returns a searial number of the unit.

---
```lua
String getUnitSpecialName()
```
Returns a consistent name of the unit. The value is compatible with the quest and trigger systems.

---
```lua
bool getIsOn()
```
Returns if the unit is turned on.

---
```lua
bool getIsPlacedOnMap()
```
Returns if the unit is placed on map.

---
```lua
bool getIsLoaded()
```
Returns if the unit is loaded into a transport or not.

---
```lua
void setParameterValue(Int parameterType, Int newValue)
```
Parameters for storage can be set in any moment of initialization but consumable parameters should be set inside of **onMatchPrepared** when all initial upgrades already took effects. Otherwise this changes will be ignored.

Notes:
- Speed and Gasoline visual values should be multiplied by 10.

For values of **parameterType** refer to [API's contstants description](Constants.md)

---
```lua
int getParameterValue(Int parameterType)
```
Refer to [API's contstants description](Constants.md)

---
```
int getParameterMaxValue(Int parameterType)
```
Refer to [API's contstants description](Constants.md)

---
```
Point getPathTarget()
```

---
```
void placeUnitOnMap(Bool force)
```
Place unit on game field. Will not trigger autofire.

---
```
void turnOn()
```
Turns the unit on.

---
```
void turnOff()
```
Turns the unit off.

---
```
void setDirection(Int direction)
```
Sets the unit direction. Direction should be 0 to 7.

---
```
void storeUnitToCargo(GameUnit unit)
```
Put a given unit into a cargo of the specified unit.

<!-- setBuildUnit -->
---
```
void setBuildUnit(String type, Int speed)
```
Set a task to build unit.

Parameters:
- **String type** - type of unit to build
- **Int speed** - Speed to build with. Valid values: 1 - 1x speed, 2 - 2x speed, 4 - 4x speed.
