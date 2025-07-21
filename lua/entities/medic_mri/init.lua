AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")  
include("shared.lua")

function ENT:Initialize()
self:SetModel("models/mri-scanner/mri-scanner.mdl")
self:PhysicsInit(SOLID_VPHYSICS)     
self:SetMoveType(MOVETYPE_VPHYSICS)   
self:SetSolid(SOLID_VPHYSICS)         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end

	self:SetNWBool("start_scanning",false)
end

function ENT:Use(ply)
	if self:GetNWBool("start_scanning") == false then
		self:SetNWBool("start_scanning",true)
        for k,v in pairs(ents.FindByClass("medic_mri_monitor")) do
			v:SetNWString(TranslationMedicMod.KIDNEY,"kidneys_normal")
			v:SetNWString(TranslationMedicMod.LIVER,"liver_mormal")
			v:SetNWString(TranslationMedicMod.LUNG,"lungs_normal")
			v:SetNWString(TranslationMedicMod.HEART,"heart_normal")
			v:SetNWString(TranslationMedicMod.SPLEEN,"spleen_normal")
			v:SetNWString(TranslationMedicMod.AORTA,"aorta_normal")
			v:EmitSound("buttons/button1.wav")
			self:EmitSound("buttons/combine_button5.wav")
			
			if ply:GetNWInt("SurgeryModHematomaKidney") == 1 then v:SetNWString(TranslationMedicMod.KIDNEY,"kidneys_hematoma") end
			if ply:GetNWInt("SurgeryModHematomaLiver") == 1 then v:SetNWString(TranslationMedicMod.LIVER,"liver_hematoma") end
			if ply:GetNWInt("SurgeryModHematomaLung") == 1 then v:SetNWString(TranslationMedicMod.LUNG,"lungs_hematoma") end
			if ply:GetNWInt("SurgeryModHematomaSpleen") == 1 then v:SetNWString(TranslationMedicMod.SPLEEN,"spleen_hematoma") end
			if ply:GetNWInt("SurgeryModHematomaAorta") == 1 then v:SetNWString(TranslationMedicMod.AORTA,"aorta_hematoma") end
			if ply:GetNWInt("SurgeryModHematomaHeart") == 1 then v:SetNWString(TranslationMedicMod.HEART,"heart_hematoma") end
			
			if ply:GetNWInt("SurgeryModRaptureKidney") == 1 then v:SetNWString(TranslationMedicMod.KIDNEY,"kidneys_rapture") end
			if ply:GetNWInt("SurgeryModRaptureLiver") == 1 then v:SetNWString(TranslationMedicMod.LIVER,"liver_rapture") end
			if ply:GetNWInt("SurgeryModRaptureLung") == 1 then v:SetNWString(TranslationMedicMod.LUNG,"lungs_rapture") end
			if ply:GetNWInt("SurgeryModRaptureSpleen") == 1 then v:SetNWString(TranslationMedicMod.SPLEEN,"spleen_rapture") end
			if ply:GetNWInt("SurgeryModRaptureAorta") == 1 then v:SetNWString(TranslationMedicMod.AORTA,"aorta_rapture") end
			if ply:GetNWInt("SurgeryModRaptureHeart") == 1 then v:SetNWString(TranslationMedicMod.HEART,"heart_rapture") end
        end
		timer.Simple(10, function()
			self:SetNWBool("start_scanning",false)
		end)
	end
end

function ENT:Think()
	if (!self.nexttimer or CurTime() >= self.nexttimer) then
			if self:GetNWBool("start_scanning") == true then
				self:EmitSound("medicinemod+/mri_work_sound.wav")
			end
		self.nexttimer = CurTime() + 1.55
	end
end
