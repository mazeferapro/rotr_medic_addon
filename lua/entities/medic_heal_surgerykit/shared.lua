ENT.Type = "anim"
ENT.Base = "medic_entities_base"
ENT.PrintName = "Surgical set"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/carlsmei/escapefromtarkov/medical/core_medical_surgical_kit.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModtraumacostae") == 1 then
	ply:SetNWInt("MedicineModtraumacostae", 0)
	elseif ply:GetNWInt("MedicineModtraumastomach") == 1 then
	ply:SetNWInt("MedicineModtraumastomach", 0)
	elseif ply:GetNWInt("MedicineModtraumahead") == 1 then
	ply:SetNWInt("MedicineModtraumahead", 0)
	elseif ply:GetNWInt("MedicineModtraumapenis") == 1 then
	ply:SetNWInt("MedicineModtraumapenis", 0)
	end
	self:EmitSound("physics/plaster/box_open_1.wav")
	self:Remove()
end