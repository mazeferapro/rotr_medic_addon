ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "OXACILLIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModPharingitis") > 0 then ply:SetNWInt("MedicineModPharingitis", 100) end
	ply:SetNWInt("MedicineModbacstenosisclapmitralis", 100)
	ply:SetNWInt("MedicineModOsephagitis", 100)
	ply:SetNWInt("MedicineModlacunaristonsillitis", 100)
	ply:SetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis", 100)
	ply:SetNWInt("MedicineModglomerulonefritisfast", 100)
	ply:SetNWInt("MedicineModepiscleritis", 100)
	ply:SetNWInt("MedicineModotohaemotorea", 100)
	ply:SetNWInt("MedicineModparatonsillitis", 100)
	ply:SetNWInt("MedicineModacsonopaticpolinevritis", 100)
	ply:SetNWInt("MedicineModspondilodiscitis", 100)
	ply:SetNWInt("MedicineModosteomielit", 100)
	ply:SetNWInt("MedicineModotitisexterna", 100)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end