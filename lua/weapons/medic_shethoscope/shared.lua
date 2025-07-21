SWEP.PrintName = "Stethoscope"
SWEP.Category = "[Medic Addon] - Diagnostic"
SWEP.Instructions = ""
------------------------------------
SWEP.Contact = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.Slot = 3
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
    self:SetNextPrimaryFire(CurTime() + 5)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if ent:GetNWInt("MedicineModVirusPneumonitis") < 100 or ent:GetNWInt("SurgeryModRaptureLung") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Wheezinginthelungs } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModdiffususbronchitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Whistlesinthelungs } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModperibronchitis") < 100 or ent:GetNWInt("MedicineModoeosenophilistbronchitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Whistlesandwheezinginthelungs } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModeccsudatusplevritis") < 100 or ent:GetNWInt("MedicineModfibrosusplevritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Creaksinthelungs } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") < 100 or ent:GetNWInt("MedicineModfibrosusalveolitits") < 100 or ent:GetNWInt("MedicineModdiffususnecroticusalveolitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Acousticshadowsinthelungs } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Auscultationofthelungswithoutsymptoms } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModbacstenosisclapmitralis") < 100 or ent:GetNWInt("SurgeryModRaptureHeart") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Silenceyourheartbeat } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Auscultationoftheheartwithoutsymptoms } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedtheentireexaminationwithastethoscope } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt( "MedicineModVirusPneumonitis") != 100 or self:GetOwner():GetNWInt("SurgeryModRaptureLung") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Wheezinginthelungs } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModdiffususbronchitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Whistlesinthelungs } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModperibronchitis") < 100 or self:GetOwner():GetNWInt("MedicineModoeosenophilistbronchitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Whistlesandwheezinginthelungs } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModeccsudatusplevritis") < 100 or self:GetOwner():GetNWInt("MedicineModfibrosusplevritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Creaksinthelungs } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") < 100 or self:GetOwner():GetNWInt("MedicineModfibrosusalveolitits") < 100 or self:GetOwner():GetNWInt("MedicineModdiffususnecroticusalveolitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Acousticshadowsinthelungs } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Auscultationofthelungswithoutsymptoms } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModbacstenosisclapmitralis") != 100 or self:GetOwner():GetNWInt("SurgeryModRaptureHeart") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Silenceyourheartbeat } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Auscultationoftheheartwithoutsymptoms } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedtheentireexaminationwithastethoscope } chat.AddText(unpack(tab))")
    end)
end