# GameMatchPlayerInfo

Information used to initialize a player during match creation.

## Constructor

---
```lua
GameMatchPlayerInfo(Int id, Int team, String name, Color color, Bool isAi, String clan, Int clanId)
```

Parameters:
- **Int id**: Player unique index.
- **Int team**: Team number.
- **String name**: Display name.
- **Color color**: Player color.
- **Bool isAi**: True if player is AI.
- **String clan**: Clan name identifier.
- **Int clanId**: Clan ID index.

## Properties

---
```lua
Bool isAi
```
Returns true if the player information is for an AI.
