# Structures

MACs Sandbox provide a number of structures to make API more expressive. 

## Point

2-dimentional point with coordinates (x, y).

### Constructor

---
```lua
Point()
```

```lua
Point(Float x, Float y)
```

### Properties
---
```lua
x
```

```lua
y
```

## Size

2-dimentional size with dimentions (width, height).

### Constructors
---
```lua
Size()
```

```lua
Size(Float w, Float h)
```

### Properties
---
```lua
w
```
```lua
h
```

## Rect

2-dimentional rectangle with Point origin and Size dimentions.

### Constructor

---
```lua
Rect()
```

```lua
Rect(Float x, Float y, Float w, Float h)
```

### Properties
---
```lua
x
```
```lua
y
```
```lua
w
```
```lua
h
```

## Color

Color in RGBA color space. Each component range is 0-255

### Constructor

---
```lua
Color(Int r, Int g, Int b, Int a)
```

## Quest Structures

### QuestPoint
Represents a navigation or event point.
- `Point position`: Coordinates of the point.
- `String name`: Unique identifier.
- `Bool visible`: Whether it's shown on the mini-map.

### QuestZone
Represents a circular area for events.
- `Point position`: Center coordinates.
- `Float radius`: Radius of the zone.
- `String name`: Unique identifier.
- `Bool visible`: Whether it's shown on the mini-map.
