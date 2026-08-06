local dataStoreService = game:GetService("DataStoreService")
local playerDataStore = dataStoreService:GetDataStore("PlayerData")

local DataService = {}

local cache = {} -- Acting as server memory

local function createDefaultData() -- Creating default values for first time add players
	return {
		Coins = 1000,
	}
end

local function loadData(player) -- Load data from data store in server memory
	local success = false
	local data
	for i = 1, 5 do
		success, data = pcall(function()
			return playerDataStore:GetAsync(player.UserId)
		end)
		if success and data then
			cache[player.UserId] = data
			return true
		elseif success and not data then -- New Player Found
			cache[player.UserId] = createDefaultData() --Default Data
			return true
		end
		task.wait(1)
	end
	--Failed to load data
	player:Kick("Data failed to load")
	return false
end

function DataService.getData(player) -- Return player's cached data from server memory
	return cache[player.UserId]
end

function DataService.initializePlayerData(player) -- Initialize player data
	local success = loadData(player)
	if success then
		-- LeaderStats will not be created of this player
		return true
	else
		return false
	end
end

function DataService.saveData(player) -- Save cached player data to DataStore
	if not cache[player.UserId] then
		return false
	end
	local success 
	for i = 1, 5 do
		success = pcall(function()
			return playerDataStore:SetAsync(player.UserId, cache[player.UserId])
		end)
		if success then
			return true
		end
		task.wait(1)
	end
	if not success then -- Failed to save data
		warn("Failed to save data for player: " .. player.Name)
		return false
	end
end

function DataService.removeData(player) -- Save data from cache to data store and remove from cache
	local success = DataService.saveData(player)
	if success then
		cache[player.UserId] = nil
		
	end
end

return DataService
