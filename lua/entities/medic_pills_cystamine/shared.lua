ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "CYSTAMIN"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)
	ply:SetNWInt("MedicineModhaveradiationprotect", 1)
	self:EmitSound("physics/glass/glass_strain4.wav")
	ply:SendLua("local tab = {Color(100, 160, 170), TranslationMedicMod.Theeffectofthedrugwilllastfor5minutes } chat.AddText(unpack(tab))")
	timer.Simple(300, function()
		ply:SetNWInt("MedicineModhaveradiationprotect", 0)
	end)
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:Remove()
end