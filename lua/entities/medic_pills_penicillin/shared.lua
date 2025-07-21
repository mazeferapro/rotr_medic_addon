ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "PENICILLIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModIelitis", 100)
	ply:SetNWInt("MedicineModPancreatitisinfiltratus", 100)
	ply:SetNWInt("MedicineModeccsudatusplevritis", 100)
	ply:SetNWInt("MedicineModdiffususpolinevritis", 100)
	ply:SetNWInt("MedicineModpyonephrosum", 100)
	ply:SetNWInt("MedicineModuretritis", 100)
	ply:SetNWInt("MedicineModkeratit", 100)
	ply:SetNWInt("MedicineModdacryocystitis", 100)
	ply:SetNWInt("MedicineModotovestibulitis", 100)
	ply:SetNWInt("MedicineModEunitis", 100)
	ply:SetNWInt("MedicineModdiffususbronchitis", 100)
	ply:SetNWInt("MedicineModcystitis", 100)
	ply:SetNWInt("MedicineModdacryoadenitis", 100)
	ply:SetNWInt("MedicineModinfiltratusscleritis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end