AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_lab/reciever01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
	self:SetNWBool("have_analyse", false)

	self:SetNWString("patient_name",TranslationMedicMod.Nopatient)
	self:SetNWBool("have_bacstenosisclapmitralis", false)
	self:SetNWBool("have_avblock", false)
	self:SetNWBool("have_fungendocarditis", false)
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		ply:EmitSound("ambient/materials/bump1.wav")
		ply:EmitSound("ambient/materials/dinnerplates3.wav")
		ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.YouareexamininganECG } chat.AddText(unpack(tab))")
		local ent2 = ents.Create("medic_cardiograph_lenta")
		ent2:SetPos(self:GetPos() + self:GetAngles():Up()*8 + self:GetAngles():Forward()*0)
		if ply:GetNWBool("have_bacstenosisclapmitralis") == true then
			ent2:SetNWBool("have_bacstenosisclapmitralis", true)
			ply:SetNWBool("have_bacstenosisclapmitralis",false)
		elseif ply:GetNWBool("have_avblock") == true then
			ent2:SetNWBool("have_avblock", true)
			ply:SetNWBool("have_avblock",false)
		elseif ply:GetNWBool("have_fungendocarditis") == true then
			ent2:SetNWBool("have_fungendocarditis", true)
			ply:SetNWBool("have_fungendocarditis",false)
		end
		ent2:SetNWString("patient_name",ply:GetNWString("patient_name"))
		self:SetNWString("patient_name",TranslationMedicMod.Nopatient)
		ent2:Spawn()
	self.nextSec = CurTime() + 3
	end
end
