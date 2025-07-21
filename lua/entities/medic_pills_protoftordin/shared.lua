ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "PROTOFTORDIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModPyelonephritisDiffususInfiltratus", 100)
	ply:SetNWInt("MedicineModDyodenitis", 100)
	ply:SetNWInt("MedicineModprotozoaminengitis", 100)
	ply:SetNWInt("MedicineModacantomediasiskeratitis", 100)
	ply:SetNWInt("MedicineModendophtalmitis", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end