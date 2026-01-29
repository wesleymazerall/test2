local TPPoint1 = workspace.TPPoint0
local TPPoint2 = workspace.TPPoint1
local Debounce = {}
print("'Teleport.server' script active")
TPPoint1.Touched:Connect(function(hit)
	local character = hit.Parent
	-- Ensure the touched part is part of a character
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end
	-- Get the HumanoidRootPart and guard it
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then
		return
	end
	-- check debounce
	if Debounce[humanoid] then
		return
	end
	Debounce[humanoid] = true

	-- do some funky CFrame shyt
	rootPart.CFrame = TPPoint2.CFrame
	print("'Teleport.server' CFrame data:", rootPart.CFrame, TPPoint2.CFrame)
	print("'Teleport.server'Teleported", character.Name, "to TPPoint2")
	-- wait and clear debounce
	task.wait(1)
	Debounce[humanoid] = nil
end)
