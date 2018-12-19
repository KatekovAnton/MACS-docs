# Game
Represents game state. Responsible for working with UI and user input.

# Blocks
```
void enableGameFieldBlock(Rect holeRect)
```
Enables invisible block that covers game field and prevent user from interacting with game field everywhere except the given hole. Hole can be size of 0x0 or located on (9999;9999) to completely prevent user input. Game do not perform any validations.

Parameters:
- **Point cell** - Coordinates of cell in game

Availability: 
- [ ] Init
- [x] Runtime
---

```
void disableGameFieldBlock()
```
Disable block that was enabled by **enableGameFieldBlock** method

Availability: 
- [ ] Init
- [x] Runtime
---

```
void enableInterfaceBlock(Rect holeRect)
```
Enables invisible block that covers UI and prevent user from interacting with it everywhere except the given hole. Hole can be size of 0x0 or located on (9999;9999) to completely prevent user input. Game do not perform any validations.

Parameters:
- **Point cell** - Coordinates of cell in game

Availability: 
- [ ] Init
- [x] Runtime
---

```
void disableInterfaceBlock()
```
Disable block that was enabled by **enableInterfaceBlock** method

Availability: 
- [ ] Init
- [x] Runtime

# Indicators
``` 
void showTutorialArrow(Point postion, float radius, bool isInterface)
```
Show arrow that will point to the given position on the game field or on the interface. Game do not perform any validations.

Parameters:
- **Point postion** - Coordinates of arrow
- **float radius** - Radius of object that it points to
- **radius isInterface** - If true, arrow will be pinned to interface. If false, arrow will be pinned to game field.

Availability: 
- [ ] Init
- [x] Runtime
---

```
void setTutorialArrowHint(String message)
```
Pin given message to arrow to explain details to the user.

Parameters:
- **String message** - A message to display.

Availability: 
- [ ] Init
- [x] Runtime
---

```
void removeTutorialArrow()
```
Disable arrow that was enabled by **showTutorialArrow** method. Also it hides its hint message.

Availability: 
- [ ] Init
- [x] Runtime

# Camera
``` 
void moveGameFieldToCell(Point cell, float duration)
```
Move camera to show certain location on a game field.

Parameters:
- **Point cell** - Cell to move to.
- **float duration** - Animation time.

Availability: 
- [ ] Init
- [x] Runtime

---
``` 
bool isMovingGameFieldToCell()
```
Indicates if camera is moving after calling **moveGameFieldToCell** method.

Availability: 
- [ ] Init
- [x] Runtime

# Unit selection
```
bool isUnitSelectedWithId(Int unitId)
```
Returns true if unit with given id is selected by user

Parameters:
- **Int unitId** - Unit identifier.

Availability: 
- [ ] Init
- [x] Runtime
---

```
bool isUnitSelectedWithName(String unitName)
```
Returns true if unit with given name is selected by user

Parameters:
- **String unitName** - Unit name.

Availability: 
- [ ] Init
- [x] Runtime
---

```
Point convertCellToInterface(Point cell)
```
Converts given cell coordinates to interface coordinates.

Parameters:
- **Point cell** - Coordinates of cell in game

Availability: 
- [ ] Init
- [x] Runtime

# Messages
``` 
void showMessage(String icon, String title, String text)
```
Converts given cell coordinates to interface coordinates.

Parameters:
- **Point cell** - Coordinates of cell in game

Availability: 
- [ ] Init
- [x] Runtime
---

```
bool isMessageVisible()
```
Returns true if message screen enabled by **showMessage** method is visible.

Availability: 
- [ ] Init
- [x] Runtime

# Iteractions
```
void waitForTap(bool tapToBlockHole)
```
Schedule game to wait for any user interaction.

Availability: 
- [ ] Init
- [x] Runtime
---

```
bool waitForTapDone()
```
Returns true if interaction requested by **waitForTap** happend.

Availability: 
- [ ] Init
- [x] Runtime

# Quests
```
void scheduleQuestUpdates()
```
Schedule quest system to update. 

Availability: 
- [ ] Init
- [x] Runtime

# Other
```
Size getScreenSize()
```
Returns size of screen in points.
