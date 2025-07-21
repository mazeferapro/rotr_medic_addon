ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "CORTICOSTERON"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModSigmoiditis", 100)
	ply:SetNWInt("MedicineModSialoadenitis", 100)
	ply:SetNWInt("MedicineModhysticytosis", 100)
	ply:SetNWInt("MedicineModcerebrovasculitis", 100)
	ply:SetNWInt("MedicineModrevmaticplexitis", 100)
	ply:SetNWInt("MedicineModgangliolitis", 100)
	ply:SetNWInt("MedicineModiridocyclitis", 100)
	ply:SetNWInt("MedicineModololicvorea", 100)
	ply:SetNWInt("MedicineModfibrosusplevritis", 100)
	ply:SetNWInt("MedicineModmastocytosis", 100)
	ply:SetNWInt("MedicineModgranulematosispoliflebitis", 100)
	ply:SetNWInt("MedicineModeshemicusencephalopatia", 100)
	ply:SetNWInt("MedicineModneprosclerosis", 100)
	ply:SetNWInt("MedicineModneuromyotomia", 100)
	ply:SetNWInt("MedicineModPancreatitisexacerbatiosus", 100)
	ply:SetNWInt("MedicineModPancreatitishaemorragicus", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end