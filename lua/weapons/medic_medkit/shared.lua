SWEP.PrintName = "Medic kit"
SWEP.Category = "[Medic Addon] - Surgery"
SWEP.Author = "Delorge"
SWEP.Instructions = ""
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/tfa_fas2/c_ifak.mdl"
SWEP.WorldModel = "models/weapons/w_medkit.mdl"
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "thereisnoammoforthisweapon"
SWEP.Secondary.Ammo = "thereisnoammoforthisweapon"
SWEP.UseHands = true

function SWEP:Initialize()
    self:SetHoldType("slam")
end
function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 10)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
	self:EmitSound("physics/cardboard/cardboard_box_impact_hard2.wav")
    timer.Simple(2, function()
		self:EmitSound("physics/cardboard/cardboard_box_shake1.wav")
		if ServerMedicMod.EnableMedKitTreatsConcussion == true then ent:SetNWInt("MedicineModcontusion", 100) end
		if ServerMedicMod.EnableMedKitTreatsTraumaLeg == true then ent:SetNWInt("MedicineModtraumalegs", 0) end
		ent:SetNWInt("MedicineModbleedingarterial", 0)
		ent:SetNWInt("MedicineModbleedingvenae", 0)
		self:GetOwner():SendLua("local tab = {Color(90, 200, 90), TranslationMedicMod.Firstaidkitused } chat.AddText(unpack(tab))")
		timer.Simple(1, function()
			self:EmitSound("physics/cardboard/cardboard_box_strain2.wav")
		end)
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 10)
	if (CLIENT) then return end
	self:EmitSound("physics/cardboard/cardboard_box_impact_hard2.wav")
    timer.Simple(2, function()
		self:EmitSound("physics/cardboard/cardboard_box_shake1.wav")
		if ServerMedicMod.EnableMedKitTreatsConcussion == true then self:GetOwner():SetNWInt("MedicineModcontusion", 100) end
		if ServerMedicMod.EnableMedKitTreatsTraumaLeg == true then self:GetOwner():SetNWInt("MedicineModtraumalegs", 0) end
		self:GetOwner():SetNWInt("MedicineModbleedingarterial", 0)
		self:GetOwner():SetNWInt("MedicineModbleedingvenae", 0)
		self:GetOwner():SendLua("local tab = {Color(90, 200, 90), TranslationMedicMod.Firstaidkitused } chat.AddText(unpack(tab))")
		timer.Simple(1, function()
			self:EmitSound("physics/cardboard/cardboard_box_strain2.wav")
		end)
    end)
end