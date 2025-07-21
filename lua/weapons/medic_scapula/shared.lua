SWEP.PrintName = "Spatula"
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
		if ent:GetNWInt("MedicineModSialoadenitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Theoralcavityisdry } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Theoralcavityismoistwithoutplaque } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModhaerptonsilitis") < 100 or self:GetOwner():GetNWInt("MedicineModcataralistonsillitis") < 100 or self:GetOwner():GetNWInt("MedicineModfibrisustonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt("MedicineModlacunaristonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt("MedicineModparatonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt("MedicineModfollicularistonsilitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		elseif ent:GetNWInt( "MedicineModPharingitis") != 100 or self:GetOwner():GetNWInt( "MedicineModEustahiitis") != 100 or self:GetOwner():GetNWInt( "MedicineModOsephagitis") != 100 then
			net.Start("pharyng")
			net.WriteInt(5,32)
			net.Send(self:GetOwner())
		else
			net.Start("pharyng")
			net.WriteInt(6,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavefinishedexaminingyourthroatandmouth } chat.AddText(unpack(tab))")
		self:Remove()
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		util.AddNetworkString("pharyng")
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt("MedicineModSialoadenitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Theoralcavityisdry } chat.AddText(unpack(tab))")
		else
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Theoralcavityismoistwithoutplaque } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModhaerptonsilitis") < 100 or self:GetOwner():GetNWInt("MedicineModcataralistonsillitis") < 100 or self:GetOwner():GetNWInt("MedicineModfibrisustonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(1,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt("MedicineModlacunaristonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(2,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt("MedicineModparatonsillitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(3,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt("MedicineModfollicularistonsilitis") < 100 then
			net.Start("pharyng")
			net.WriteInt(4,32)
			net.Send(self:GetOwner())
		elseif self:GetOwner():GetNWInt( "MedicineModPharingitis") != 100 or self:GetOwner():GetNWInt( "MedicineModEustahiitis") != 100 or self:GetOwner():GetNWInt( "MedicineModOsephagitis") != 100 then
			net.Start("pharyng")
			net.WriteInt(5,32)
			net.Send(self:GetOwner())
		else
			net.Start("pharyng")
			net.WriteInt(6,32)
			net.Send(self:GetOwner())
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavefinishedexaminingyourthroatandmouth } chat.AddText(unpack(tab))")
		self:Remove()
    end)
end