SWEP.PrintName = "Thermometer"
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
		if ent:GetNWInt("MedicineModVirusPneumonitis") < 100 or ent:GetNWInt("MedicineModdiffususnecroticusalveolitis") < 100
		or ent:GetNWInt("MedicineModnecroticpoliangiit") < 100 or ent:GetNWInt("MedicineModprotozoaminengitis") < 100
		or ent:GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature386 } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModVirusPneumonitis") < 100 or ent:GetNWInt("MedicineModPharingitis") < 100 or ent:GetNWInt("MedicineModEustahiitis") < 100 or 
		ent:GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 or ent:GetNWInt("MedicineModbacstenosisclapmitralis") < 100 or ent:GetNWInt("MedicineModfungendocarditis") < 100
		or ent:GetNWInt("MedicineModhaerptonsilitis") < 100 or ent:GetNWInt("MedicineModcataralistonsillitis") < 100 or ent:GetNWInt("MedicineModlacunaristonsillitis") < 100
		or ent:GetNWInt("MedicineModparatonsillitis") < 100 or ent:GetNWInt("MedicineModfollicularistonsilitis") < 100 or ent:GetNWInt("MedicineModdiffususbronchitis") < 100
		or ent:GetNWInt("MedicineModperibronchitis") < 100 or ent:GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") < 100 or ent:GetNWInt("MedicineModfibrosusalveolitits") < 100
		or ent:GetNWInt("MedicineModeccsudatusplevritis") < 100 or ent:GetNWInt("MedicineModrevmaticpoliangiit") < 100 or ent:GetNWInt("MedicineModgranulematosispoliflebitis") < 100
		or ent:GetNWInt("MedicineModnecroticperiarteriit") < 100 or ent:GetNWInt("MedicineModencephalitis") < 100 or ent:GetNWInt("MedicineModserosusminengitis") < 100
		or ent:GetNWInt("MedicineModpyogenicusmielitis") < 100 or ent:GetNWInt("MedicineModosteomielit") < 100 or ent:GetNWInt("MedicineModpyonephrosum") < 100
		or ent:GetNWInt("MedicineModcystitis") < 100 or ent:GetNWInt("MedicineModacantomediasiskeratitis") < 100 or ent:GetNWInt("MedicineModpanaphtalmitis") < 100 
		or ent:GetNWInt("MedicineModotohaemotorea") < 100 or ent:GetNWInt("MedicineModotovestibulitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature377 } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature366 } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavetakenacompletetemperaturemeasurement } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt("MedicineModVirusPneumonitis") != 100 or self:GetOwner():GetNWInt("MedicineModdiffususnecroticusalveolitis") != 100
		or self:GetOwner():GetNWInt("MedicineModnecroticpoliangiit") < 100 or self:GetOwner():GetNWInt("MedicineModprotozoaminengitis") < 100
		or self:GetOwner():GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature386 } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModVirusPneumonitis") != 100 or self:GetOwner():GetNWInt("MedicineModPharingitis") != 100 or self:GetOwner():GetNWInt("MedicineModEustahiitis") != 100 or 
		self:GetOwner():GetNWInt("MedicineModPyelonephritisMesenhimicus") != 100 or self:GetOwner():GetNWInt("MedicineModbacstenosisclapmitralis") != 100 or self:GetOwner():GetNWInt("MedicineModfungendocarditis") != 100
		or self:GetOwner():GetNWInt("MedicineModhaerptonsilitis") != 100 or self:GetOwner():GetNWInt("MedicineModcataralistonsillitis") != 100 or self:GetOwner():GetNWInt("MedicineModlacunaristonsillitis") != 100
		or self:GetOwner():GetNWInt("MedicineModparatonsillitis") != 100 or self:GetOwner():GetNWInt("MedicineModfollicularistonsilitis") != 100 or self:GetOwner():GetNWInt("MedicineModdiffususbronchitis") != 100
		or self:GetOwner():GetNWInt("MedicineModperibronchitis") != 100 or self:GetOwner():GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") != 100 or self:GetOwner():GetNWInt("MedicineModfibrosusalveolitits") != 100
		or self:GetOwner():GetNWInt("MedicineModeccsudatusplevritis") < 100 or self:GetOwner():GetNWInt("MedicineModrevmaticpoliangiit") < 100 or self:GetOwner():GetNWInt("MedicineModgranulematosispoliflebitis") < 100
		or self:GetOwner():GetNWInt("MedicineModnecroticperiarteriit") < 100 or self:GetOwner():GetNWInt("MedicineModencephalitis") < 100 or self:GetOwner():GetNWInt("MedicineModserosusminengitis") < 100 
		or self:GetOwner():GetNWInt("MedicineModpyogenicusmielitis") < 100 or self:GetOwner():GetNWInt("MedicineModosteomielit") < 100 or self:GetOwner():GetNWInt("MedicineModpyonephrosum") < 100
		or self:GetOwner():GetNWInt("MedicineModcystitis") < 100 or self:GetOwner():GetNWInt("MedicineModacantomediasiskeratitis") < 100 or self:GetOwner():GetNWInt("MedicineModpanaphtalmitis") < 100 
		or self:GetOwner():GetNWInt("MedicineModotohaemotorea") < 100 or self:GetOwner():GetNWInt("MedicineModotovestibulitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature377 } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Temperature366 } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavetakenacompletetemperaturemeasurement } chat.AddText(unpack(tab))")
    end)
end