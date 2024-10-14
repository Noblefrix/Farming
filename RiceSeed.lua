-- Author(s): Noblefrix
-- Type:LocalScript

--// Services
local CS = game:GetService("CollectionService")
local rs = game:GetService("ReplicatedStorage")
--// Vars
local plant = rs.Farming_Replicated.Events.Plant
local plr = game:GetService("Players").LocalPlayer
local hi = script.Highlight
--// Init
local mouse = plr:GetMouse()
--// Functios
mouse.Move:Connect(function()
	if not mouse.Target then script.Highlight.Adornee = nil return end
	if script.Parent.Parent == plr.Backpack then script.Highlight.Adornee = nil return end
	
	if CS:HasTag(mouse.Target.Parent,"Plot") then
		hi.Adornee = mouse.Target.Parent
		if mouse.Target.Parent.Planted.Value == false then
			hi.FillColor = Color3.new(0,1,0)
			hi.OutlineColor = Color3.new(0,1,0)
			
			script.Parent.Activated:Connect(function()
				if mouse.Target.Parent.Planted.Value == false then
					plant:FireServer(mouse.Target.Parent.Planted,script.Parent)
					return
				end
			end)
		elseif mouse.Target.Parent.Planted.Value == true then
			hi.FillColor = Color3.new(1,0,0)
			hi.OutlineColor = Color3.new(1,0,0)
		end
		return
	end
	
	script.Highlight.Adornee = nil
end)
