ENT.Type = "anim"
ENT.Base = "medic_entities_base"
ENT.PrintName = "Bandage"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/carlsmei/escapefromtarkov/medical/bandage.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModbleedingvenae", 0)
	self:EmitSound("physics/plastic/box_open_2.wav")
	self:Remove()
end