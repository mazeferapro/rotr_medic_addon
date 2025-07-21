ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "LEVOMICETIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModEustahiitis", 100)
	if ply:GetNWInt("MedicineModconjunktivitis") > 0 then ply:SetNWInt("MedicineModconjunktivitis", 100) end
	ply:SetNWInt("MedicineModpanaphtalmitis", 100)
	ply:SetNWInt("MedicineModotitismedialis", 100)
	ply:SetNWInt("MedicineModuveitis", 100)
	ply:SetNWInt("MedicineModmeibomitis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end