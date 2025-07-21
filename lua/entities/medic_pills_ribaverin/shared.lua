ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "RIBAVIRIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModColitis", 100)
	ply:SetNWInt("MedicineModfibrosusalveolitits", 100)
	ply:SetNWInt("MedicineModencephalitis", 100)
	ply:SetNWInt("MedicineModVirusPneumonitis", 100)
	ply:SetNWInt("MedicineModhaerptonsilitis", 100)
	ply:SetNWInt("MedicineModserosusminengitis", 100)
	ply:SetNWInt("MedicineModretinitis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end