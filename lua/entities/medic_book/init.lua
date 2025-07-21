AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_lab/binderblue.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
	self:SetNWBool("have_electrodes", true)
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
			ply:SendLua("local tab = {Color(255, 170, 0), [[https://steamcommunity.com/sharedfiles/filedetails/?id=2950104307]] } chat.AddText(unpack(tab))")
		self.nextSec = CurTime() + 3
	end	
end