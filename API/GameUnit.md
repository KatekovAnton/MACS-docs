# GameUnit

Represents an individual unit or building.

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
Return unit's type identifier (e.g., 'tank', 'mining').

---
```lua
Point getPosition()
```
Return unit's current map position.

---
```lua
Bool getIsMoving()
```
Returns true if the unit is currently in motion.

---
```lua
Int getUnitNumber()
```
Returns the serial number of the unit.

---
```lua
String getSpecialName()
```
Returns the unique name of the unit if one was set.

---
```lua
Int getOwnerId()
```
Returns the ID of the player who owns this unit.

---
```lua
Bool getIsOn()
```
Returns true if the unit's power is ON.

---
```lua
Bool getIsPlacedOnMap()
```
Returns true if the unit is physically present on the map.

---
```lua
Bool getIsLoaded()
```
Returns true if the unit is currently inside a transport.

---
```lua
GameObjectConfig getConfig()
```
Returns the configuration object for this unit's type.

---
```lua
void setParameterValue(Int parameterType, Int newValue)
```
Directly sets a unit's parameter (Health, Fuel, Ammo, etc.). 
Note: Consumable parameters should typically be set in `onMatchPrepared`.

---
```lua
void setParameterBonus(Int parameterType, Int value, Bool applyToCurrent)
```
Adds a bonus value to a specific parameter.

---
```lua
Int getParameterValue(Int parameterType)
```
Returns the current value of a parameter.

---
```lua
Int getParameterMaxValue(Int parameterType)
```
Returns the maximum possible value for a parameter (including upgrades).

---
```lua
void resetAllParameters()
```
Restores all unit parameters to their base/upgraded defaults.

---
```lua
Point getPathTarget()
```
Returns the destination point if the unit is moving.

---
```lua
GameUnit placeUnitOnMap(Bool force)
```
Places the unit on the map. Returns the unit itself (allows chaining). Will not trigger autofire.

---
```lua
void turnOn()
```
Turns the unit's power ON.

---
```lua
void turnOff()
```
Turns the unit's power OFF.

---
```lua
void install()
```
Commands the unit to start installing (for deployable units like turrets).

---
```lua
void uninstall()
```
Commands the unit to start uninstalling.

---
```lua
void setDirection(Int direction)
```
Sets unit's facing (0-7).

---
```lua
void setHeadAngle(Float angle)
```
Sets the rotation angle of the unit's turret/head.

---
```lua
void storeUnitToCargo(GameUnit unit)
```
Loads the specified unit into this unit's cargo space.

---
```lua
void setBuildUnit(String type, Int speed)
```
Sets the production task for a factory.

Parameters:
- **String type** - type to build
- **Int speed** - production multiplier (1, 2, or 4)
