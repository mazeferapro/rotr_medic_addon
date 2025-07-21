SWEP.PrintName = "Otoscope"
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
		--util.AddNetworkString("otos")
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if ent:GetNWInt( "MedicineModEustahiitis") != 100 or ent:GetNWInt( "MedicineModotitisexterna") != 100 then
			net.Start("otos")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModotohaemotorea") != 100 then
			net.Start("otos")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModololicvorea") != 100 then
			net.Start("otos")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModotitismedialis") != 100 then
			net.Start("otos")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		else
			net.Start("otos")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhaveperformedanotoscopeexamination } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		util.AddNetworkString("otos")
		
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt( "MedicineModEustahiitis") != 100 or self:GetOwner():GetNWInt( "MedicineModotitisexterna") != 100 then
			net.Start("otos")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModotohaemotorea") != 100 then
			net.Start("otos")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModololicvorea") != 100 then
			net.Start("otos")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModotitismedialis") != 100 then
			net.Start("otos")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		else
			net.Start("otos")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhaveperformedanotoscopeexamination } chat.AddText(unpack(tab))")
    end)
end
