ENT.Type = "anim"
ENT.Base = "medic_pills_base"

ENT.PrintName = "RIMANTADIN"
ENT.Category = "[Medic Addon] - Drugs"
ENT.Spawnable = true

ENT.Model = "models/props_junk/cardboard_box004a.mdl"

function ENT:Use(ply)	
	if ply:GetNWInt("EpidemicModFluH1N1") != 100 then
		local rand = math.random(1,100)
		if rand <= 10 then
			ply:SetNWBool("EpidemicMod_ComplicationResist", true)
			timer.Simple(100, function()
				ply:SetNWBool("EpidemicMod_ComplicationResist", false)
			end)
		end
	end
	if ply:GetNWInt("EpidemicModFluH5N1") != 100 then
		local rand = math.random(1,100)
		if rand <= 40 then
			ply:SetNWBool("EpidemicMod_ComplicationResist", true)
			timer.Simple(100, function()
				ply:SetNWBool("EpidemicMod_ComplicationResist", false)
			end)
		end
	end
	ply:SetNWInt("MedicineModIntoxication", ply:GetNWInt("MedicineModIntoxication")+10)
	self:EmitSound("physics/glass/glass_strain4.wav")
	self:Remove()
end