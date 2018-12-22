# GameMatch
Represents match. 

## **Constructors**
---
Not available because this object is managed by hosting application

## **Players**
---
```
Int getNumberOfPlayers()
```

---
```
GameMatchPlayer playerAtIndex(Int index)
```

---
```
GameMap getMap()
```

---
```
GameUnit getUnitWithId(Int unitId)
```

! You should not retain this unit in script for a long time because unit can be killed and script will never know it

---
```
void setUnitName(Int unitId, String name)
```

---
```
GameUnit getUnitWithName(String unitName)
```

! You should not retain this unit in script for a long time because unit can be killed and script will never know it
