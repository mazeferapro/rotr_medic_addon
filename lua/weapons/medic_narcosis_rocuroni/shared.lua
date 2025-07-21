SWEP.PrintName = "Rocuronium"
SWEP.Category = "[Medic Addon] - Surgery"
SWEP.Instructions = ""
------------------------------------
SWEP.Contact = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.Slot = 4
SWEP.SlotPos = 9
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
------------------------------------
function SWEP:Initialize()
    self:SetHoldType("normal")
end
function SWEP:Deploy()
    return true
end
function SWEP:DrawWorldModel()
end
function SWEP:PreDrawViewModel(vm)
    return true
end
function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 25)
	if (CLIENT) then return end
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
    timer.Simple(2, function()
		for k, v in pairs(ents.FindInSphere(self:GetPos(),32)) do 
			if v:GetClass() == "medic_surgical_table" then
				self:GetOwner():EmitSound("ambient/materials/bump1.wav")
				self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
				self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavestartedadministeringanesthesia } chat.AddText(unpack(tab))")
				ent:SendLua("local tab = {Color(0, 170, 170), TranslationMedicMod.Youhavebeengivenanesthesia } chat.AddText(unpack(tab))")
				timer.Simple(20, function()
					self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youadministeredanesthesia } chat.AddText(unpack(tab))")
					ent:SendLua("local tab = {Color(0, 170, 170), TranslationMedicMod.Youhavebeengivenanesthesia } chat.AddText(unpack(tab))")
					v:SetNWString("patient_name", ent:Nick())
					if ent:GetNWInt("SurgeryModHematomaKidney") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Kidneyhematoma) end
					if ent:GetNWInt("SurgeryModHematomaLiver") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Liverhematoma) end
					if ent:GetNWInt("SurgeryModHematomaLung") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Lunghematoma) end
					if ent:GetNWInt("SurgeryModHematomaSpleen") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Splenichematoma) end
					if ent:GetNWInt("SurgeryModHematomaAorta") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Aortichematoma) end
					if ent:GetNWInt("SurgeryModHematomaHeart") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Hearthematoma) end
					
					if ent:GetNWInt("SurgeryModRaptureKidney") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Renalrupture) end
					if ent:GetNWInt("SurgeryModRaptureLiver") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Liverrupture) end
					if ent:GetNWInt("SurgeryModRaptureLung") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Lungrupture) end
					if ent:GetNWInt("SurgeryModRaptureSpleen") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Splenicrupture) end
					if ent:GetNWInt("SurgeryModRaptureAorta") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Aorticrupture) end
					if ent:GetNWInt("SurgeryModRaptureHeart") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Heartrupture) end
					self:Remove()
				end)
			end
		end	
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 25)
	if (CLIENT) then return end
    timer.Simple(2, function()
		for k, v in pairs(ents.FindInSphere(self:GetPos(),32)) do 
			if v:GetClass() == "medic_surgical_table" then
				self:GetOwner():EmitSound("ambient/materials/bump1.wav")
				self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
				self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavestartedadministeringanesthesia } chat.AddText(unpack(tab))")
				timer.Simple(20, function()
					self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youadministeredanesthesia } chat.AddText(unpack(tab))")
					v:SetNWString("patient_name", self:GetOwner():Nick())
					if self:GetOwner():GetNWInt("SurgeryModHematomaKidney") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Kidneyhematoma) end
					if self:GetOwner():GetNWInt("SurgeryModHematomaLiver") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Liverhematoma) end
					if self:GetOwner():GetNWInt("SurgeryModHematomaLung") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Lunghematoma) end
					if self:GetOwner():GetNWInt("SurgeryModHematomaSpleen") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Splenichematoma) end
					if self:GetOwner():GetNWInt("SurgeryModHematomaAorta") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Aortichematoma) end
					if self:GetOwner():GetNWInt("SurgeryModHematomaHeart") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Hearthematoma) end
					
					if self:GetOwner():GetNWInt("SurgeryModRaptureKidney") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Renalrupture) end
					if self:GetOwner():GetNWInt("SurgeryModRaptureLiver") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Liverrupture) end
					if self:GetOwner():GetNWInt("SurgeryModRaptureLung") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Lungrupture) end
					if self:GetOwner():GetNWInt("SurgeryModRaptureSpleen") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Splenicrupture) end
					if self:GetOwner():GetNWInt("SurgeryModRaptureAorta") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Aorticrupture) end
					if self:GetOwner():GetNWInt("SurgeryModRaptureHeart") == 1 then v:SetNWString("organ_traum",TranslationMedicMod.Heartrupture) end
					self:Remove()
				end)
			end
		end	
    end)
end