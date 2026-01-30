local TeleportFrom = workspace.TPPoint0
local TeleportTo = workspace.TPPoint1

local Debounce = {}
local TextChatService = game:GetService("TextChatService")

print("'Teleport.server' script active")

TeleportFrom.Touched:Connect(function(hit)
	local character = hit.Parent
	if not character then
		return
	end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end

	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then
		return
	end

	-- debounce check
	--if Debounce[humanoid] then
	--	return
	--end
	Debounce[humanoid] = true

	-- teleport
	rootPart.CFrame = TeleportTo.CFrame
	print("'Teleport.server' Teleported", character.Name)

	-- chat message (fixed)
	TextChatService:DisplaySystemMessage(character.Name .. " has been teleported")

	-- cooldown then clear debounce
	task.wait(10)
	Debounce[humanoid] = nil
end)
