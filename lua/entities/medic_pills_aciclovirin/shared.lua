ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "ACYCLOVIRIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModcataralistonsillitis", 100)
	ply:SetNWInt("MedicineModfibrisustonsillitis", 100)
	ply:SetNWInt("MedicineModperibronchitis", 100)
	ply:SetNWInt("MedicineModxenophtalmia", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end