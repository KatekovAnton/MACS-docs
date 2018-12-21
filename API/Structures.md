# Structures
M.A.X. Touch Sandbox provide a number of structures to make API more expressive. 

Availability: 
- [x] Init
- [x] Runtime

# Point
2-dimentional point with coordinates (x, y).

## **Constructor**
---
```
Point()
```

```
Point(Float x, Float y)
```

## **Properties**
---
```
x
```

```
y
```

# Size
2-dimentional size with dimentions (width, height).

## **Constructors**
---
```
Size()
```

```
Size(Float w, Float h)
```

## **Properties**
---
```
w
```
```
h
```

# Rect
2-dimentional rectangle with Point origin and Size dimentions.

## **Constructor**
---
```
Rect()
```

```
Rect(Float x, Float y, Float w, Float h)
```

## **Properties**
---
```
x
```
```
y
```
```
w
```
```
h
```

# Color
Color in RGBA color space. Each component range is 0-255

## **Constructor**
---
```
Color(Int r, Int g, Int b, Int a)
```

# GameMatchPlayerInfo
Initial information about player.

## **Constructor**
---
```
GameMatchPlayerInfo(Int playerId, Int clan, String name, Color color, Bool isAI, String AIName, Int team)
```
playerId for 1st player should be equal 1 and incremented by 1 for each player.
