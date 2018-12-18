# Game
Represents game state

## Methods
>```
>Size getScreenSize()
>```
Returns size of screen in points.

```    
void enableGameFieldBlock(Rect holeRect)
```

```
void disableGameFieldBlock()
```

```
void enableInterfaceBlock(Rect holeRect)
```

```
void disableInterfaceBlock()
```

``` 
void showTutorialArrow(Point postion, float radius, bool isinterface)
```

```
void setTutorialArrowHint(String message)
```

```
void removeTutorialArrow()
```

``` 
void moveGameFieldToCell(Point cell, float duration)
```

``` 
bool isMovingGameFieldToCell()
```

```
bool isUnitSelectedWithId(Int unitId)
```

```
bool isUnitSelectedWithName(String unitName)
```

```
Point convertCellToInterface(Point cell)
```

``` 
void showMessage(String icon, String title, String text)
```

```
bool isMessageVisible()
```

```
void waitForTap(bool tapToBlockHole)
```

```
bool waitForTapDone
```

```
void scheduleQuestUpdates()
```
