SWEP.PrintName = "ECG instrument"
SWEP.Category = "[Medic Addon] - Diagnostic"
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
    self:SetNextPrimaryFire(CurTime() + 5)
	if (CLIENT) then return end
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
    timer.Simple(2, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.YoureceivedanECGtape } chat.AddText(unpack(tab))")
		self:GetOwner():SetNWString("patient_name",ent:Nick())
		if ent:GetNWInt("MedicineModbacstenosisclapmitralis") != 100 then
			self:GetOwner():SetNWBool( "have_bacstenosisclapmitralis",true)
		elseif ent:GetNWInt("MedicineModavblock") < 100 then
			self:GetOwner():SetNWBool( "have_avblock",true)
		elseif ent:GetNWInt("MedicineModfungendocarditis") < 100 then
			self:GetOwner():SetNWBool( "have_fungendocarditis",true)
		else
		end
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.YoureceivedanECGtape } chat.AddText(unpack(tab))")
		self:GetOwner():SetNWString("patient_name",self:GetOwner():Nick())
		if self:GetOwner():GetNWInt( "MedicineModbacstenosisclapmitralis") != 100 then
			self:GetOwner():SetNWBool( "have_bacstenosisclapmitralis",true)
		elseif self:GetOwner():GetNWInt( "MedicineModavblock") != 100 then
			self:GetOwner():SetNWBool( "have_avblock",true)
		elseif self:GetOwner():GetNWInt( "MedicineModfungendocarditis") != 100 then
			self:GetOwner():SetNWBool( "have_fungendocarditis",true)
		else
		end
    end)
end