# Event System

The Event System allows scripts to react to game state changes, player interactions, and unit lifecycle events. Events are managed via a trigger-based system defined in `missionData.json` and executed by the C++ engine.

## Trigger Conditions (`_condition`)

Triggers use a `_type` field to specify the event to watch.

| Type | Fields | Description |
| :--- | :--- | :--- |
| `playerTeamWon` | `_value` | Triggers when the specified team ID wins. |
| `unitDead` | `_unitName1` | Triggers when the specified unit is destroyed. |
| `unitSelectedByName`| `_unitName1` | Triggers when the player selects the unit. |
| `unitPathTargetedToCell`| `_unitName1`, `_point` | Triggers when a path is plotted to the cell. |
| `unitMoved` | `_unitName1` | Triggers when the unit moves. |
| `unitInCell` | `_unitName1`, `_point` | Triggers when the unit enters the cell. |
| `userInterfaceTargetedToUnit`| `_unitName1`, `_unitName2` | Triggers when UI interaction targets the unit. |
| `unitAttackTargetedToUnit` | `_unitName1`, `_unitName2` | Triggers when the player issues an attack command. |
| `unitHealthLower` | `_unitName1`, `_value` | Triggers when unit health drops below the value. |
| `unitHealthHigher` | `_unitName1`, `_value` | Triggers when unit health exceeds the value. |
| `unitActionTargetedToUnit` | `_unitName1`, `_unitName2` | Triggers when a generic action targets the unit. |
| `inputModeEnabled` | `_uiControl` | Triggers when a UI mode (e.g., repair) is active. |
| `turnStarted` | `_value` | Triggers when the specified player's turn starts. |
| `turnFinished` | `_value` | Triggers when the specified player ends their turn. |
| `unitChangedOwner` | `_unitName1`, `_value` | Triggers when the unit ownership changes. |

## Cutscene Actions (`_steps`)

Actions define what happens when a trigger condition is met.

- `showSpeech`: Displays a character dialog box.
  - `_title`, `_text`, `_time`, `_timePresenting`, `_icon`.
- `moveCameraToArea`: Smoothly pans the camera.
  - `_frame` (Rect), `_zoomMin`, `_zoomMax`.
- `showArrow`: Adds a visual navigation arrow.
  - `_text`, `_point`, `_uiControl`, `_flag`.
- `setMarker`: Adds a visual marker.
  - `_newPos`, `_size`, `_markerType`, `_markerId`.
- `removeMarker`: Clears markers.
- `enableGameFieldBlock` / `disableGameFieldBlock`: Blocks/unblocks player interaction on the map.
- `enableUIBlock` / `disableUIBlock`: Blocks/unblocks specific UI elements.
- `executeScript`: Executes a Lua function.
- `changeTriggerStatus`: Enables or disables a trigger.
- `changeEndTurnAvailable`: Toggles the 'End Turn' button.
