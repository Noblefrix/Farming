-- Author(s): Noblefrix
--//Services
local rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")
--//Vars
local plant = rs.Farming_Replicated.Events.Plant
local harvest = rs.Farming_Replicated.Events.Harvest
local ts = ss.Farming_Storage.Rice
--//Init
plant.OnServerEvent:Connect(function(plr,object:BoolValue,tool)
	if object:IsA("BoolValue") then
		object.Value = true
		tool:Destroy()
	end
end)

harvest.OnServerEvent:Connect(function(plr,object:BoolValue)
	if object:IsA("BoolValue") then
		object.Value = false
		ts:Clone().Parent = plr.Backpack
		return
	end
end)
--//Func
