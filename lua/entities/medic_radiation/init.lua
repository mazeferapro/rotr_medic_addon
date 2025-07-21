AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_lab/box01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
end

function ENT:Think()
	if (!self.nextSec or CurTime() >= self.nextSec) then
		for k, v in pairs(ents.FindInSphere(self:GetPos(),256)) do 
			if v:IsPlayer() then
				if v:GetNWInt("MedicineModhaveradiationprotect") != 1 then
					v:SetNWInt("MedicineModhaveradiation", v:GetNWInt("MedicineModhaveradiation") + 10)
					v:EmitSound("tools/ifm/ifm_snap.wav")
				end
			end
		end
		self.nextSec = CurTime() + 1
	end	
end