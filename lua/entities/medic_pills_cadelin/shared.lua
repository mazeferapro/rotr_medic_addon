ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "CADELIN"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModinjuryarm") == 1 then
	ply:SetNWInt("MedicineModinjuryarm", 0)
	elseif ply:GetNWInt("MedicineModinjurycostae") == 1 then
	ply:SetNWInt("MedicineModinjurycostae", 0)
	elseif ply:GetNWInt("MedicineModinjurylegs") == 1 then
	ply:SetNWInt("MedicineModinjurylegs", 0)
	elseif ply:GetNWInt("MedicineModinjuryhead") == 1 then
	ply:SetNWInt("MedicineModinjuryhead", 0)
	elseif ply:GetNWInt("MedicineModinjurystomach") == 1 then
	ply:SetNWInt("MedicineModinjurystomach", 0)
	elseif ply:GetNWInt("MedicineModinjurypenis") == 1 then
	ply:SetNWInt("MedicineModinjurypenis", 0)
	end
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end