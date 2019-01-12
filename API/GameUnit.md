# GameUnit
Represents unit

## **Constructor**
---
Not available because this object is managed by hosting application

## **Methods**
---
```
Int getId()
```
Return unit's unique identifier.

Availability: 
- [x] Init
- [x] Runtime

---
```
void placeUnitOnMap(Bool force)
```
Place unit on game field. Will not trigger autofire.

Availability: 
- [x] Init
- [ ] Runtime

---
```
Point getPosition()
```
Return unit's position.

Availability: 
- [x] Init
- [x] Runtime

---
```
bool getIsMoving()
```

Availability: 
- [x] Init
- [x] Runtime

---
```
void setParameterValue(Int parameterType, Int newValue)
```
Parameters for storage can be set in any moment of initialization but consumable parameters should be set inside of **onMatchPrepared** when all initial upgrades already took effects. Otherwise this changes will be ignored.

Notes:
- Speed and Gasoline visual values should be multiplied by 10.

For values of **parameterType** refer to [API's contstants description](Constants.md)

Availability: 
- [x] Init
- [ ] Runtime

---
```
int getParameterValue(Int parameterType)
```
Refer to [API's contstants description](Constants.md)

Availability: 
- [x] Init
- [x] Runtime

---
```
int getParameterMaxValue(Int parameterType)
```
Refer to [API's contstants description](Constants.md)

Availability: 
- [x] Init
- [x] Runtime

---
```
Point getPathTarget()
```

Availability: 
- [x] Init
- [x] Runtime

---
```
void turnOn()
```

Availability: 
- [x] Init
- [ ] Runtime

---
```
void turnOff()
```

Availability: 
- [x] Init
- [ ] Runtime

---
```
void setDirection(Int direction)
```

Availability: 
- [x] Init
- [ ] Runtime

---
```
void storeUnitToCargo(GameUnit unit)
```
Put given unit into a cargo.

Availability: 
- [x] Init
- [ ] Runtime

---
```
void setBuildUnit(String type, Int speed)
```
Set a task to build unit.

Parameters:
- **String type** - type of unit to build
- **Int speed** - Speed to build with. Valid values: 0 - 1x speed, 2 - 2x speed, 4 - 4x speed.

Availability: 
- [x] Init, v10.1
- [ ] Runtime
