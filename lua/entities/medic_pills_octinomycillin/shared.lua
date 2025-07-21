ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "OCTINOMICILLIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModGastritis", 100)
	ply:SetNWInt("MedicineModdiffususnecroticusalveolitis", 100)
	ply:SetNWInt("MedicineModdemieliticnevritis", 100)
	ply:SetNWInt("MedicineModdiffususglomerulonephritis", 100)
	ply:SetNWInt("MedicineModophtalmoangiopathia", 100)
	ply:SetNWInt("MedicineModinfiltratusopticusneuropathia", 100)
	ply:SetNWInt("MedicineModblefaritis", 100)
	if ply:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") > 0 then ply:SetNWInt("MedicineModPyelonephritisLocalInfiltratus", 100) end
	ply:SetNWInt("MedicineModProctitis", 100)
	ply:SetNWInt("MedicineModsinusitis", 100)
	ply:SetNWInt("MedicineModnecroticperiarteriit", 100)
	ply:SetNWInt("MedicineModpyogenicusmielitis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end