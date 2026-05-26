# Event System

The Event System allows scripts to react to game state changes, player interactions, and unit lifecycle events. Events
are managed via a trigger-based system defined in `missionData.json` and executed by the C++ engine.

## Structure

Events are defined in the `_triggers` array within `missionData.json`. Each trigger object typically consists of:

- `_id`: Unique string identifier for the trigger.
- `_active`: Boolean indicating whether the trigger is active initially. Can be toggled at runtime (e.g., add step:
  `{"_type" : "changeTriggerStatus", "_triggerId" : "n1selected", "_flag" : true}`).
- `_condition`: An object that specifies the event type to watch and its required parameters.
- `_cutscene`: Defines the sequence of actions when the trigger fires. This can be a string ID referencing a cutscene in
  the root `_cutscenes` dictionary, or an inline object.
- `_actions`: A list of immediate actions (rarely used, mostly `_cutscene` is utilized).

Inline `_cutscene` objects may define properties such as `_curtain` (boolean, usually true for cinematic bars) and
`_ui` (boolean, usually true for UI-focused events), followed by a `_steps` array.

### Example

```json
{
    "_triggers": [
        {
            "_id" : "scout1_selected",
            "_active" : true,
            "_condition" : {
                "_type" : "unitSelectedByName",
                "_unitName1" : "you"
            },
            "_cutscene" : "scout1_selected_cutscene"
        },
        {
            "_id" : "scout1_path_set",
            "_condition" : {
                "_type" : "unitPathTargetedToCell",
                "_unitName1" : "you",
                "_point" : { "_x" : 32, "_y" : 58 }
            },
            "_cutscene" : {
                "_curtain" : false,
                "_ui" : true,
                "_steps" : [
                    {
                        "_type" : "hideArrow"
                    },
                    {
                        "_type" : "enableGameFieldBlock",
                        "_frame" : {
                          "_x" : 32,
                          "_y" : 58,
                          "_w" : 1,
                          "_h" : 1
                        }
                    },
                    {
                        "_type" : "showArrow",
                        "_text" : "m1_md_scout1_path_set_move_text",
                        "_point" : { "_x" : 32, "_y" : 58 }
                    },
                    {
                        "_type" : "changeTriggerStatus",
                        "_triggerId" : "scout1_moving",
                        "_flag" : true
                    }
                ]
            }
        }
    ]
}
```

## Trigger Conditions (`_condition`)

Triggers use a `_type` field to specify the event to watch.

| Type                          | Fields                                                        | Description                                                    |
|:------------------------------|:--------------------------------------------------------------|:---------------------------------------------------------------|
| `playerTeamWon`               | `_value` (Integer)                                            | Triggers when the specified team ID wins.                      |
| `unitDead`                    | `_unitName` (String)                                          | Triggers when the specified unit is destroyed.                 |
| `unitSelectedByName`          | `_unitName` (String)                                          | Triggers when the player selects the unit.                     |
| `unitPathTargetedToCell`      | `_unitName` (String), `_point` ([Point](Structures.md#Point)) | Triggers when a path is plotted to the cell.                   |
| `unitMoved`                   | `_unitName` (String)                                          | Triggers when the unit moves.                                  |
| `unitInCell`                  | `_unitName` (String), `_point` ([Point](Structures.md#Point)) | Triggers when the unit enters the cell.                        |
| `userInterfaceTargetedToUnit` | `_unitName1` (String), `_unitName2` (String)                  | Triggers when UI interaction targets the unit.                 |
| `unitAttackTargetedToUnit`    | `_unitName1` (String), `_unitName2` (String)                  | Triggers when the player issues an attack command.             |
| `unitHealthLower`             | `_unitName` (String), `_value` (Integer)                      | Triggers when unit health drops below the value.               |
| `unitHealthHigher`            | `_unitName` (String), `_value` (Integer)                      | Triggers when unit health exceeds the value.                   |
| `unitActionTargetedToUnit`    | `_unitName1` (String), `_unitName2` (String)                  | Triggers when a generic action targets the unit.               |
| `inputModeEnabled`            | `_uiControl` (String)                                         | Triggers when a UI mode (e.g., repair or transfer) is active.  |
| `userInterfaceUnitMenuOpened` | `_unitName` (String)                                          | Triggers when the user opens the specific unit's context menu. |
| `turnStarted`                 | `_value` (Integer)                                            | Triggers when the specified player's turn starts.              |
| `turnFinished`                | `_value` (Integer)                                            | Triggers when the specified player ends their turn.            |
| `unitChangedOwner`            | `_unitName` (String), `_value` (Integer)                      | Triggers when the unit ownership changes.                      |

## Cutscene Actions (`_steps`)

The `_cutscenes` dictionary contains standalone sequence definitions (such as `_start` and `_end` cinematic sequences)
that can be triggered. Here is an example of its format:

```json
{
    "_cutscenes": {
        "scout1_selected_cutscene": {
            "_curtain" : false,
            "_ui" : true,
            "_steps" : [
                {
                    "_type" : "showArrow",
                    "_text" : "m1_md_scout1_selected_path_text",
                    "_point" : { "_x" : 32, "_y" : 58 }
                },
                {
                    "_type" : "changeTriggerStatus",
                    "_triggerId" : "scout1_path_set",
                    "_flag" : true
                }
            ]
        },
        "_start": {
            "_curtain": true,
            "_steps": [
                {
                    "_type": "setCameraToArea",
                    "_frame": { "_x": 65.5, "_y": 54.5, "_w": 0, "_h": 0 },
                    "_zoomMin": 0.0075,
                    "_zoomMax": 0.0075
                },
                {
                    "_type": "wait",
                    "_time": 1
                },
                {
                    "_type": "showSpeech",
                    "_title": "m_char_hq",
                    "_text": "m2_md_start_briefing_text",
                    "_time": 2,
                    "_timePresenting": 8,
                    "_icon": "Campaign/Assets/officer.png"
                }
            ]
        }
    }
}
```

Actions define what happens when a trigger condition is met and are executed sequentially within the `_steps` array.
Each action uses a `_type` field to specify the command.

| Type                                             | Fields                                                                                                                    | Description                                                                          |
|:-------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------|
| `wait`                                           | `_time` (Number)                                                                                                          | Pauses execution.                                                                    |
| `showSpeech`                                     | `_title` (String), `_text` (String), `_time` (Number), `_timePresenting` (Number), `_icon` (String)                       | Displays a character dialog box.                                                     |
| `moveCameraToArea` / `setCameraToArea`           | `_frame` ([Rect](Structures.md#Rect)), `_zoomMin` (Number), `_zoomMax` (Number)                                           | Smoothly or instantly pans the camera to an area.                                    |
| `moveCameraToUnit`                               | `_unitName` (String)                                                                                                      | Smoothly pans the camera to a specific unit.                                         |
| `showArrow`                                      | `_text` (String), `_point` ([Point](Structures.md#Point)) or `_uiControl` (String), `_radius` (Number), `_flag` (Boolean) | Adds a visual navigation arrow or prompt over the UI or map.                         |
| `hideArrow`                                      | None                                                                                                                      | Removes the currently active visual arrow.                                           |
| `showMarker` / `hideMarker`                      | `_markerType` (String), `_markerId` (String), `_frame` ([Rect](Structures.md#Rect))                                       | Adds or removes a visual marker.                                                     |
| `setMarker` / `removeMarker`                     | `_newPos` ([Point](Structures.md#Point)), `_size` ([Size](Structures.md#Size))                                            | Additional marker commands.                                                          |
| `enableGameFieldBlock` / `disableGameFieldBlock` | `_frame` ([Rect](Structures.md#Rect))                                                                                     | Blocks/unblocks player interaction on the map. Can restrict interaction to `_frame`. |
| `enableUIBlock` / `disableUIBlock`               | `_uiControl` (String)                                                                                                     | Blocks/unblocks specific UI elements.                                                |
| `executeScript`                                  | `_var1` (String)                                                                                                          | Executes a Lua function using the specified name.                                    |
| `changeTriggerStatus`                            | `_triggerId` (String), `_flag` (Boolean)                                                                                  | Enables or disables a specific trigger dynamically.                                  |
| `changeEndTurnAvailable`                         | `_flag` (Boolean)                                                                                                         | Toggles the 'End Turn' button logic.                                                 |
| `moveUnitToPosition`                             | `_unitName` (String), `_point` ([Point](Structures.md#Point))                                                             | Instantly moves a unit.                                                              |
| `recoverUnitStats`                               | `_unitName` (String)                                                                                                      | Restores unit health/stats.                                                          |

## Game Engine & Script Interactions

The Game Engine continuously evaluates active trigger conditions during gameplay. When a condition is satisfied, normal
input processing may be suspended (depending on the `_curtain` and `_ui` blocks) to execute the sequence of `_steps`.

- **UI and Gameplay Control**: Using steps like `enableGameFieldBlock`, `enableUIBlock`, and `showArrow`, you can create
  strict tutorials by limiting what the player can tap on the screen and highlighting the required button/cell.
- **Lua Script Integration**: The `executeScript` step provides a bridge between the data-driven JSON triggers and
  customized game logic in Lua. You can call custom Lua methods to change game state, handle complex win/lose
  conditions, or run logic that JSON is not well-suited for.
- **Event Chaining**: Most tutorial logic relies on "Chaining" triggers. A trigger usually ends by enabling the next
  logical step using `changeTriggerStatus`, setting up a sequential flow of objectives.
