# Land Service

## Responsibilities

- Validate that a land belongs to the player's assigned base.
- Load the player's owned lands from cached data.
- Purchase new lands.
- Check land ownership.
- Return a player's owned lands.

## API Summary
API	                    Purpose	         Returns
isLandBelongsToPlayer()	|Validates that   | a                       |belongs to the   | land
                        |player's assigned| 
                        |base.	          |
purchaseLand()	        |Purchases a land |boolean
                        |after validation.| 
loadLands()	            |Loads previously |
                        |purchased lands. |	nil
initilizePrompts()	    |Initializes land |
                        |interaction      |  nil 
                        |prompts.         |

# Private function
function                Purpose             Return
getPlayerLands()        To get the lands    Refrence 
                        already purchased   to the 
                        by player           cache 
                                            memory Lands value

## Architecture

The land purchase flow is handled entirely on the server using `ProximityPrompt`.

```text
Player presses E at a land
        │
        ▼
initializePrompts()
ServerMain.server.lua
        │
        ▼
getPlayerLands()
LandService.lua
        │
        ▼
Check whether land is already
available in player's owned lands
        │
        ├── Yes ──► Land is already owned
        │
        └── No
             │
             ▼
       purchaseLand()
       LandService.lua
             │
             ▼
       canAfford()
       EconomyService.lua
             │
             ▼
       Check if player has
       enough coins
             │
             ▼
       isLandBelongsToPlayer()
       LandService.lua
             │
             ▼
       Validate that the land
       belongs to player's assigned base
             │
             ▼
       removeCoins()
       EconomyService.lua
             │
             ▼
       Update leaderstats
       coin value
             │
             ▼
       Insert land name into
       player's cached Lands data
             │
             ▼
       Land purchased

