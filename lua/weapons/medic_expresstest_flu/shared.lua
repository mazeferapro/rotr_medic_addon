SWEP.PrintName = "Rapid flu test"
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
    self:SetNextPrimaryFire(CurTime() + 1)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
    timer.Simple(1, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,100)
		if ent:GetNWInt("EpidemicModFluH1N1") < 100 or ent:GetNWInt("EpidemicModFluH5N1") < 100 then
			if rand > 10 then
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestpositive } chat.AddText(unpack(tab))")
			else
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestnegative } chat.AddText(unpack(tab))")
			end
		else
			local rand2 = math.random(1,100)
			if rand2 > 10 then
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestnegative } chat.AddText(unpack(tab))")
			else
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestpositive } chat.AddText(unpack(tab))")
			end
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youtookarapidflutest } chat.AddText(unpack(tab))")
		self:Remove()
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 1)
	if (CLIENT) then return end
    timer.Simple(1, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,100)
		if self:GetOwner():GetNWInt( "EpidemicModFluH1N1") < 100 or self:GetOwner():GetNWInt( "EpidemicModFluH5N1") < 100 then
			if rand > 10 then
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestpositive } chat.AddText(unpack(tab))")
			else
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestnegative } chat.AddText(unpack(tab))")
			end
		else
			local rand2 = math.random(1,100)
			if rand2 > 10 then
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestnegative } chat.AddText(unpack(tab))")
			else
				self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Flutestpositive } chat.AddText(unpack(tab))")
			end
		end
		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youtookarapidflutest } chat.AddText(unpack(tab))")
		self:Remove()
    end)
end