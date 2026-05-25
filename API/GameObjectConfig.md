# GameObjectConfig

Represents the configuration and base statistics for a specific unit type.

## Constructors

---
Not available because this object is managed by hosting application. Retrieve via `unit:getConfig()`.

## Methods

---
```lua
String getType()
```
Returns the type identifier of the unit (e.g., 'tank').

---
```lua
Bool getIsTrash()
```
Returns true if this object type is considered environment 'trash' or garbage.

---
```lua
Int getSize()
```
Returns the physical size of the unit (1 for 1x1, 2 for 2x2, etc.).

---
```lua
Int getParameterValue(Int parameterType)
```
Returns the base (unupgraded) value for a specific parameter type.
Refer to [Constants.md](Constants.md) for parameter types.
