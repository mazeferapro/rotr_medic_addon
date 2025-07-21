SWEP.PrintName = "Hammer"
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
		if ent:GetNWInt("MedicineModacsonopaticpolinevritis") < 100 or ent:GetNWInt("MedicineModdiffususpolinevritis") < 100 or ent:GetNWInt("MedicineModrevmaticplexitis") < 100 
		or ent:GetNWInt("MedicineModencephalitis") < 100 or ent:GetNWInt("MedicineModserosusminengitis") < 100 or ent:GetNWInt("MedicineModprotozoaminengitis") < 100 
		or ent:GetNWInt("MedicineModpyogenicusmielitis") < 100 or ent:GetNWInt("MedicineModeshemicusencephalopatia") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Deepreflexesarereduced } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Deepreflexesarenormal } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedtheexaminationwithaneurologicalhammer } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt( "MedicineModacsonopaticpolinevritis") != 100 or self:GetOwner():GetNWInt( "MedicineModdiffususpolinevritis") != 100 or self:GetOwner():GetNWInt( "MedicineModrevmaticplexitis") != 100
		or self:GetOwner():GetNWInt( "MedicineModencephalitis") != 100 or self:GetOwner():GetNWInt( "MedicineModserosusminengitis") != 100 or self:GetOwner():GetNWInt( "MedicineModprotozoaminengitis") != 100 
		or self:GetOwner():GetNWInt( "MedicineModpyogenicusmielitis") != 100 or self:GetOwner():GetNWInt( "MedicineModeshemicusencephalopatia") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Deepreflexesarereduced } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Deepreflexesarenormal } chat.AddText(unpack(tab))")
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedtheexaminationwithaneurologicalhammer } chat.AddText(unpack(tab))")
    end)
end