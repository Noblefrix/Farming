-- Author(s): Noblefrix
--// Services
local runservice = game:GetService("RunService")
local rs = game:GetService("ReplicatedStorage")
--// Vars
local farw = game:GetService("Workspace").Farming_Workspace
local ptd = script.Parent.Planted
local ttg = rs.Farming_Replicated.Settings.TimeToGrow.Value -- In Seconds
local QuartT = (ttg/4) -- 4 Stages, 1 - 4 Growing 0 Grown
local rcm = rs.Farming_Replicated.Storage.RiceModel
local _,rcs = rcm:GetBoundingBox()
local rcp = rcm:GetPivot()
local rch = rcp.Y
local QuartH = (rch/4)
local rccx = (script.Parent.Dirt.Size.X-rcs.X)/2
local rccz = (script.Parent.Dirt.Size.Z-rcs.Z)/2
print(rccx)
print(rccz)
--// Init


--// Func
ptd.Changed:Connect(function()
	if ptd.Value == true then
		local crcm = rcm:Clone()
		crcm.Parent = script.Parent.Dirt
		crcm:PivotTo(CFrame.new((script.Parent.Dirt.Position - Vector3.new(0,rch,rccz))))
		print(rch)
		local cd = ttg
		while cd >= 0 do
			wait(1)
			cd = cd - 1
			if cd <= QuartT*4 and cd > QuartT*3 then
				crcm:PivotTo(crcm:GetPivot()+Vector3.new(0,QuartH*1,0))
			elseif cd <= QuartT*3 and cd > QuartT*2 then
				crcm:PivotTo(crcm:GetPivot()+Vector3.new(0,QuartH*1,0))
			elseif	cd <= QuartT*2 and cd > QuartT*1 then
				crcm:PivotTo(crcm:GetPivot()+Vector3.new(0,QuartH*1,0))
			elseif cd <= QuartT*1 and cd > QuartT*0 then
				for _,v:BasePart in pairs(crcm:GetChildren()) do
					if v:IsA("BasePart") then 
						v.Color = Color3.new(0.494118, 0.388235, 0) 
					end
				end
				print("4")
				print(cd)
			elseif cd <= QuartT*0 then
				for _,v:BasePart in pairs(crcm:GetChildren()) do
					if  v:IsA("BasePart") then 
						v.Color = Color3.new(1, 0.666667, 0) 
					end
				end
				crcm.Grown.Value = true
				print("5")
				print(cd)
			end
		end
		
	else
		script.Parent.Dirt:FindFirstChild("RiceModel"):Destroy()
	end
end)
