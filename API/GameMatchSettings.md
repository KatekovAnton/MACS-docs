# GameMatchSettings

Represents the settings and rules for a specific match.

## Constructors

---
Not available because this object is managed by hosting application.

## Methods

---
```lua
Bool getBool(String name)
```
Retrieves a boolean setting by name.

---
```lua
Int getInt(String name)
```
Retrieves an integer setting by name.

---
```lua
String getString(String name)
```
Retrieves a string setting by name.

---
```lua
Int getStartGold()
```
Returns the starting amount of credits for players.

---
```lua
Int getRawMatResLevels()
```
Returns the [Resource Level](Constants.md##Resource_Levels) for Raw Materials.

---
```lua
Int getFuelResLevels()
```
Returns the [Resource Level](Constants.md##Resource_Levels) for Fuel.

---
```lua
Int getGoldResLevels()
```
Returns the [Resource Level](Constants.md##Resource_Levels) for Gold.

---
```lua
Int getResCount()
```
Returns the total number of resource placements.

---
```lua
Bool getAllowLaying()
```
Returns true if 'Laying Ability' is enabled.

---
```lua
Bool getGasoline()
```
Returns true if Gasoline consumption is enabled.

---
```lua
Bool getStartWithRadar()
```
Returns true if players start with a radar/survey flag.

---
```lua
Bool getStartBase()
```
Returns true if players start with a base building.

---
```lua
Int getSurveyFlag()
```
Returns the survey mode level.

---
```lua
Bool getExpensiveTools()
```
Returns true if 'Expensive Reload/Repair/Rearm' is enabled.

---
```lua
Bool getMilitaryPurchases()
```
Returns true if 'Military Purchases' are enabled.

---
```lua
Bool getComplexConstruction()
```
Returns true if 'Complex Construction' is enabled.
