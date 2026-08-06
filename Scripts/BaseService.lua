local basesFolder = game.Workspace:WaitForChild("World"):WaitForChild("Bases")

local BaseService = {}
local assignedBases = {}
local spawnLocations = {}
local bases = {}

function BaseService.loadBases()
	for i, basePart in ipairs(basesFolder:GetDescendants()) do
		if basePart:IsA("BasePart") then
			spawnLocations[i] = basePart
		end
	end
end

local function assignBase(player, base)
	assignedBases[player.UserId] = base.Parent
	spawnLocations[player.UserId] = base
end

local function isEmptyBase(base)
	for _, b in pairs(assignedBases) do
		if b == base then
			return false
		end
	end
	return true
end

function BaseService.initializeBase(player)
	for i, base in ipairs(bases) do
		if isEmptyBase(base) then
			assignBase(player, base)
			player.RespawnLocation = base
			return
		elseif not isEmptyBase(base) and i == #bases then
			player:Kick("Not enough bases")
		end
	end
end

function BaseService.emptyBase(player)
	assignedBases[player.UserId] = nil
end

function BaseService.getBase(player)
	return assignedBases[player.UserId]
end


return BaseService
