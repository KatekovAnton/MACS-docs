# GameMatchPlayer
Represents player

## **Constructor**
---
Not available because this object is managed by hosting application

## **Methods**
---
```
GameUnit createUnit(Int posx, Int posy, String type)
```
Creates unit of given type located on a given coordinates. You should place it on the map manually.

Parameters:
- **Int posx** - position x
- **Int posy** - position y
- **String type** - type

Availability: 
- [x] Init
- [ ] Runtime

---
```
GameUnit getUnitWithId(Int unitId)
```
Return unit with a given Id

Paramegters:
- **Int unitId** - unitId of desired unit

---
```
void addUnitTypeUpgrade(String type, Int parameterType, Int value)
```
Add upgrade for given unit type to given parameter type on a given value. We assume that script developers will maintain basic rules of upgrades and will not pass negative or big values.

Parameters:
- **String type** - unit type to upgrade
- **Int parameterType** - parameter to upgrade
- **Int value** - value to upgrade

Availability: 
- [x] Init
- [ ] Runtime

---
```
getPlayerName
```

---
```
void setAvailableGold(Int amount)
```
Set available gold for player

Parameters:
- **Int amount** - gold

Availability: 
- [x] Init
- [ ] Runtime

---
```
void addEnemyLocation()
```
Dedcription

Parameters:
- **Rect** - type

Availability: 
- [x] Init
- [ ] Runtime

---
```
void setCameraPosition(Int x, Int y, Float zoom)
```