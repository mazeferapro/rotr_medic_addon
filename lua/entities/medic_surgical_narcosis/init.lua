AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")  
include("shared.lua")

function ENT:Initialize()
self:SetModel("models/props_c17/consolebox03a.mdl")
self:PhysicsInit(SOLID_VPHYSICS)     
self:SetMoveType(MOVETYPE_VPHYSICS)   
self:SetSolid(SOLID_VPHYSICS)         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end

	util.AddNetworkString(self:EntIndex().."CabinetReactiveOpen")
	util.AddNetworkString(self:EntIndex().."TakeReactive")

	net.Receive(self:EntIndex().."TakeReactive", function(act, ply)
		local readid = net.ReadString(32)
		ply:Give(readid)
	end)
end

function ENT:Use(ply)
	net.Start(self:EntIndex().."CabinetReactiveOpen")
	net.WriteEntity(self)
	net.Send(ply)
end
