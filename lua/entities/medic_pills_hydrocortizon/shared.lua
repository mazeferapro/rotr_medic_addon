ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "HYDROCORTIZON"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModPyelonephritisMesenhimicus", 100)
	ply:SetNWInt("MedicineModPancreatitisautoimmunicus", 100)
	ply:SetNWInt("MedicineModoeosenophilistbronchitis", 100)
	ply:SetNWInt("MedicineModglobulinaemicusflebidis", 100)
	ply:SetNWInt("MedicineModPancreatitissepticus", 100)
	ply:SetNWInt("MedicineModlangergansishystiocytosis", 100)
	ply:SetNWInt("MedicineModrevmaticpoliangiit", 100)
	ply:SetNWInt("MedicineModexacerbatiosusradiculitis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end