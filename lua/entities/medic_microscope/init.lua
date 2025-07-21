AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_questionableethics/microscope.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
	self:SetNWInt("erythrocytes", 0)
	self:SetNWInt("monocytes", 0)
	self:SetNWInt("b_limphocytes", 0)
	self:SetNWInt("thrombocytes", 0)
	self:SetNWBool("have_analyse", false)
	
	self:SetNWBool("have_blood", false)
	
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		self:EmitSound("physics/glass/glass_impact_hard1.wav")
		self:SetNWBool("have_analyse", false)
		self:SetNWBool("have_blood", false)
		self:SetNWInt("erythrocytes", 0)
		self:SetNWInt("monocytes", 0)
		self:SetNWInt("b_limphocytes", 0)
		self:SetNWInt("thrombocytes", 0)
		ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youdestroyedthebiomaterial } chat.AddText(unpack(tab))")
		self.nextSec = CurTime() + 3
	end	
end
