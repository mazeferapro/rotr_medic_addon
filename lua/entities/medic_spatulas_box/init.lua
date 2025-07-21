AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_junk/cardboard_box004a.mdl")
	self:SetMaterial("models/props/de_prodigy/transformer")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youtookaspatula } chat.AddText(unpack(tab))")
		ply:Give("medic_scapula")
		self.nextSec = CurTime() + 3
	end	
end