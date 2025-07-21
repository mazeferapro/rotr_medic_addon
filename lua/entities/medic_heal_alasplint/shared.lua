ENT.Type = "anim"
ENT.Base = "medic_entities_base"
ENT.PrintName = "Splint"
ENT.Category = "[Medic Addon] - Trauma"
ENT.Spawnable = true

ENT.Model = "models/carlsmei/escapefromtarkov/medical/alusplint.mdl"

function ENT:Use(ply)
	if ply:GetNWInt("MedicineModtraumaarm") == 1 then
	ply:SetNWInt("MedicineModtraumaarm", 0)
	elseif ply:GetNWInt("MedicineModtraumalegs") == 1 then
	ply:SetNWInt("MedicineModtraumalegs", 0)
	end
	self:EmitSound("physics/wood/box_open_1.wav")
	self:Remove()
end