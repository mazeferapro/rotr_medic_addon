SWEP.PrintName = "Ophthalmoscope"
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
		if ent:GetNWInt( "MedicineModuveitis") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(6,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModretinitis") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(8,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModinfiltratusopticusneuropathia") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(9,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModophtalmoangiopathia") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(15,32)
			net.Send(self:GetOwner())
		else
			net.Start("ophtalm2")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		
		if ent:GetNWInt( "MedicineModdacryocystitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModblefaritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModmeibomitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModepiscleritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModendophtalmitis") != 100 or self:GetOwner():GetNWInt( "MedicineModpanaphtalmitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(5,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModinfiltratusscleritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(7,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModxenophtalmia") != 100 then
			net.Start("ophtalm")
			net.WriteInt(10,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModkeratit") != 100 then
			net.Start("ophtalm")
			net.WriteInt(11,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModiridocyclitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(12,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModdacryoadenitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(13,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModconjunktivitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(14,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModacantomediasiskeratitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(16,32)
			net.Send(self:GetOwner())
		else
			net.Start("ophtalm")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedacompleteexaminationwithanophthalmoscope } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		util.AddNetworkString("ophtalm")
		util.AddNetworkString("ophtalm2")
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt( "MedicineModuveitis") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(6,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModretinitis") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(8,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModinfiltratusopticusneuropathia") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(9,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModophtalmoangiopathia") != 100 then
			net.Start("ophtalm2")
			net.WriteInt(15,32)
			net.Send(self:GetOwner())
		else
			net.Start("ophtalm2")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		
		if self:GetOwner():GetNWInt( "MedicineModdacryocystitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModblefaritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModmeibomitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModepiscleritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModendophtalmitis") != 100 or self:GetOwner():GetNWInt( "MedicineModpanaphtalmitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(5,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModinfiltratusscleritis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(7,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModxenophtalmia") != 100 then
			net.Start("ophtalm")
			net.WriteInt(10,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModkeratit") != 100 then
			net.Start("ophtalm")
			net.WriteInt(11,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModiridocyclitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(12,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModdacryoadenitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(13,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModconjunktivitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(14,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModacantomediasiskeratitis") != 100 then
			net.Start("ophtalm")
			net.WriteInt(16,32)
			net.Send(self:GetOwner())
		else
			net.Start("ophtalm")
			net.WriteInt(0,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedacompleteexaminationwithanophthalmoscope } chat.AddText(unpack(tab))")
    end)
end