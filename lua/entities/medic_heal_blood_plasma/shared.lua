ENT.Type = "anim"
ENT.Base = "medic_entities_base"
ENT.PrintName = "Blood plasma"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/bloodbag/bloodbag.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModhaveblood", ply:GetNWInt("MedicineModhaveblood") + 500)
	ply:SetNWInt("MedicineModhaveradiation", ply:GetNWInt("MedicineModhaveradiation") - 300)
	self:EmitSound("physics/plaster/suture_1.wav")
	self:Remove()
end