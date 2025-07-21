ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "NAZOCAPRIL"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModRhinitus") > 0 then ply:SetNWInt("MedicineModRhinitus", 100) end
	ply:SetNWInt("MedicineModnasovestibulit", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end