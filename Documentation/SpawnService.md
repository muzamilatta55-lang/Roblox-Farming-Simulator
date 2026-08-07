# SpawnService

## Purpose

Handles player spawning by assigning the RespawnLocation of the player's allocated base.

The service depends on BaseService to determine which base belongs to the player.

---

## Responsibilities

- Set the player's RespawnLocation.
- Prevent spawning if the player has no assigned base.
- Validate that the assigned base contains a SpawnLocation.

---

## Public API

### spawnPlayer(player)

Assigns the player's RespawnLocation based on their allocated base.

---

## Dependencies

- BaseService

---

## Spawn Flow

Player joins

↓

BaseService assigns base

↓

SpawnService retrieves assigned base

↓

SpawnLocation is located

↓

RespawnLocation is assigned