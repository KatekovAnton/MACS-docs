# Quest System

The Quest System is built on top of the [Event System](GameEvent.md). It allows creators to define dynamic objectives that appear in the player's UI and track progress throughout a mission.

## Quest API (Lua Methods)

These methods are available on the `GameMatch` object.

---
```lua
void taskActivated(String id, String title, String description, Int x, Int y)
```
Displays a new task/objective to the player.
- **id**: Unique identifier for tracking completion.
- **title**: Display title.
- **description**: Detailed objective description.
- **x, y**: Coordinates of the objective location.

---
```lua
void taskCompleted(String id)
```
Marks the task as successfully completed. UI will reflect this status.

---
```lua
void taskFailed(String id)
```
Marks the task as failed.

---
```lua
void taskRemoved(String id)
```
Removes the task from the active tracker.

## Design Pattern

Quests are typically updated within the `_actions` or `_steps` of an event trigger.

### Example Trigger
```json
{
    "_id" : "my_task_trigger",
    "_condition" : {
        "_type" : "unitInCell",
        "_unitName1" : "scout1",
        "_point" : { "_x" : 10, "_y" : 10 }
    },
    "_steps" : [
        {
            "_type" : "executeScript",
            "_var1" : "completeMyTask" 
        }
    ]
}
```

### Lua Script Implementation
```lua
function completeMyTask(game, match)
    match:taskCompleted("reach_point_a")
end
```
