SWEP.PrintName = "Infection - Flu"
SWEP.Category = "[Medic Addon] - Disease"
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
    self:SetNextPrimaryFire(CurTime() + 2)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,2)
		if rand == 1 then
			ent:SetNWInt("EpidemicModFluH1N1", ent:GetNWInt("EpidemicModFluH1N1") - 1)
		elseif rand == 2 then
			ent:SetNWInt("EpidemicModFluH5N1", ent:GetNWInt("EpidemicModFluH5N1") - 1)
		end
		self:Remove()
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 2)
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,2)
		if rand == 1 then
			self:GetOwner():SetNWInt("EpidemicModFluH1N1", self:GetOwner():GetNWInt("EpidemicModFluH1N1") - 1)
		elseif rand == 2 then
			self:GetOwner():SetNWInt("EpidemicModFluH5N1", self:GetOwner():GetNWInt("EpidemicModFluH5N1") - 1)
		end
		self:Remove()
    end)
end