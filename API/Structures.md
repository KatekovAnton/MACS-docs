# Structures

MACs Sandbox provide a number of structures to make API more expressive. 

## Point

2-dimentional point with coordinates (x, y).

### Constructor

---
```
Point()
```

```
Point(Float x, Float y)
```

### Properties
---
```
x
```

```
y
```

## Size

2-dimentional size with dimentions (width, height).

### Constructors
---
```
Size()
```

```
Size(Float w, Float h)
```

### Properties
---
```
w
```
```
h
```

## Rect

2-dimentional rectangle with Point origin and Size dimentions.

### Constructor

---
```
Rect()
```

```
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
```
Color(Int r, Int g, Int b, Int a)
```
