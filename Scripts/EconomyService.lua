local dataService = require(script.Parent.DataService)
local EconomyService = {}

function EconomyService.getCoins(player)
	local playerData = dataService.getData(player)
	return playerData.Coins
end

function EconomyService.setCoins(player, amount)
	local playerData = dataService.getData(player)
	playerData.Coins = amount
end

function EconomyService.addCoins(player, amount)
	local playerData = dataService.getData(player)
	playerData.Coins += amount
end

function EconomyService.removeCoins(player, amount)
	local playerData = dataService.getData(player)
	playerData.Coins -= amount
end

function EconomyService.canAfford(player, amount)
	local playerData = dataService.getData(player)
	return playerData.Coins >= amount
end

return EconomyService
