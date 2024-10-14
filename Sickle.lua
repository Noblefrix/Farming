-- Author(s): Noblefrix
--Type: Lcal Script
--// Services
local CS = game:GetService("CollectionService")
local rs = game:GetService("ReplicatedStorage")
--// Vars
local harvest = rs.Farming_Replicated.Events.Harvest
local plr = game:GetService("Players").LocalPlayer
local hi = script.Highlight
--// Init
local mouse = plr:GetMouse()
--// Functios
mouse.Move:Connect(function()
	if not mouse.Target then script.Highlight.Adornee = nil return end
	if script.Parent.Parent == plr.Backpack then script.Highlight.Adornee = nil return end
	
	if CS:HasTag(mouse.Target.Parent,"Rice") then
		hi.Adornee = mouse.Target.Parent
		if mouse.Target.Parent.Grown.Value == true then
			hi.FillColor = Color3.new(0,1,0)
			hi.OutlineColor = Color3.new(0,1,0)
		elseif mouse.Target.Parent.Grown.Value == false then
			hi.FillColor = Color3.new(1,0,0)
			hi.OutlineColor = Color3.new(1,0,0)
		end
		return
	end
	
	script.Highlight.Adornee = nil
end)

script.Parent.Activated:Connect(function()
	if mouse.Target.Parent.Grown.Value == true then
		print("Harvested")
		harvest:FireServer(mouse.Target.Parent.Parent.Parent.Planted)
		return
	end
end)
