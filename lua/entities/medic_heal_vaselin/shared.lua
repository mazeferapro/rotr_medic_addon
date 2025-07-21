ENT.Type = "anim"
ENT.Base = "medic_entities_base"
ENT.PrintName = "Petrolatum"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/carlsmei/escapefromtarkov/medical/vaselin.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModacutarm") == 1 then
	ply:SetNWInt("MedicineModacutarm", 0)
	elseif ply:GetNWInt("MedicineModacutcostae") == 1 then
	ply:SetNWInt("MedicineModacutcostae", 0)
	elseif ply:GetNWInt("MedicineModacutlegs") == 1 then
	ply:SetNWInt("MedicineModacutlegs", 0)
	elseif ply:GetNWInt("MedicineModacuthead") == 1 then
	ply:SetNWInt("MedicineModacuthead", 0)
	elseif ply:GetNWInt("MedicineModacutstomach") == 1 then
	ply:SetNWInt("MedicineModacutstomach", 0)
	elseif ply:GetNWInt("MedicineModacutpenis") == 1 then
	ply:SetNWInt("MedicineModacutpenis", 0)
	end
	self:EmitSound("medicinemod+/box_open_3.wav")
	self:Remove()
end