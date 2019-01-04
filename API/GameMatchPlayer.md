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

! You should not retain this unit in script for a long time because unit can be killed and script will never know it

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
Return unit with a given Id. 

! You should not retain this unit in script for a long time because unit can be killed and script will never know it

Paramegters:
- **Int unitId** - unitId of desired unit

---
```
void addUnitTypeUpgrade(String type, Int parameterType, Int value)
```
Add upgrade for given unit type to given parameter type on a given value. We assume that script developers will maintain basic rules of upgrades and will not pass negative or big values.

Parameters:
- **String type** - unit type to upgrade
- **Int parameterType** - parameter to upgrade. Refer to [API's contstants description](Constants.md)
- **Int value** - value to upgrade

Availability: 
- [x] Init
- [ ] Runtime

---
```
String getPlayerName()
```
Return player's name.

Availability: 
- [x] Init
- [x] Runtime

---
```
void setAvailableGold(Int amount)
```
Set available gold for player.

Parameters:
- **Int amount** - gold

Availability: 
- [x] Init
- [ ] Runtime

---
```
void addEnemyLocation(Rect zone, Float danger)
```
Will make effect for AI players. This call will let them know where is the enemy. AI will handle this information based on his common rules.

Parameters:
- **Rect zone** - zone to search for enemy
- **Float danger** - estimated danger around. Put 1 to 5 here in order to avoid any side effects caused by additinonal danger zone.

Availability: 
- [x] Init
- [ ] Runtime

---
```
void setAIRefuelAutomatically(bool refuelAutomatically)
```
Tells to player if it should refuel its units automatically or not. Set to `true` by default in order to give AI some advantage in games with gasoline enabled. Set if to `false` if you want it to have finit amount of gasoline. Note: AI cannot refuel his units in regular way. 

Parameters:
- **bool refuelAutomatically** - indication if AI should refuel units automatically

Availability: 
- [x] Init, v10.1
- [ ] Runtime

---
```
void setCameraPosition(Int x, Int y, Float zoom)
```
Sets initial camera position to a given cell coordinates with a given zoom value

Parameters:
- **Int x** - x position
- **Int y** - y position
- **Float zoom** - zoom vaule. Minimum value is 0.5.

Availability: 
- [x] Init
- [ ] Runtime
