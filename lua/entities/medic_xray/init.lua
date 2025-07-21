AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
self:SetModel("models/medicmod/radio/radio.mdl")
self:PhysicsInit(SOLID_VPHYSICS)
self:SetMoveType(MOVETYPE_VPHYSICS)
self:SetSolid(SOLID_VPHYSICS)
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then phys:Wake() end
self:SetNWBool("have_traumaarm", false)
self:SetNWBool("have_traumacostae", false)
self:SetNWBool("have_traumalegs", false)
self:SetNWBool("have_traumahead", false)
self:SetNWBool("have_traumastomach", false)
self:SetNWBool("have_traumapenis", false)
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youtookanxray } chat.AddText(unpack(tab))")
		self:EmitSound("ambient/machines/combine_terminal_idle2.wav")
		timer.Simple(1, function()
			self:EmitSound("ambient/tones/elev3.wav")
			self:EmitSound("ambient/tones/equip1.wav")
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*10 + self:GetAngles():Right()*10)
			if ply:GetNWInt("MedicineModtraumaarm") != 0 then 
				ent2:SetNWBool("have_traumaarm", true); ent2:SetNWString("organ","arm"); ent2:Spawn() else
				ent2:SetNWBool("have_traumaarm", false); ent2:SetNWString("organ","arm"); ent2:Spawn() 
			end
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*10 + self:GetAngles():Right()*20)
			if ply:GetNWInt("MedicineModtraumacostae") != 0 then 
				ent2:SetNWBool("have_traumacostae", true); ent2:SetNWString("organ","costae"); ent2:Spawn() else 
				ent2:SetNWBool("have_traumacostae", false); ent2:SetNWString("organ","costae"); ent2:Spawn() 
			end
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*10 + self:GetAngles():Right()*30)
			if ply:GetNWInt("MedicineModtraumalegs") != 0 then 
				ent2:SetNWBool("have_traumalegs", true); ent2:SetNWString("organ","legs"); ent2:Spawn() else 
				ent2:SetNWBool("have_traumalegs", false); ent2:SetNWString("organ","legs"); ent2:Spawn() 
			end
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*0 + self:GetAngles():Right()*10)
			if ply:GetNWInt("MedicineModtraumahead") != 0 then 
				ent2:SetNWBool("have_traumahead", true); ent2:SetNWString("organ","head"); ent2:Spawn() else 
				ent2:SetNWBool("have_traumahead", false); ent2:SetNWString("organ","head"); ent2:Spawn() 
			end
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*0 + self:GetAngles():Right()*20)
			if ply:GetNWInt("MedicineModtraumastomach") != 0 then 
				ent2:SetNWBool("have_traumastomach", true); ent2:SetNWString("organ","stomach"); ent2:Spawn() else 
				ent2:SetNWBool("have_traumastomach", false); ent2:SetNWString("organ","stomach"); ent2:Spawn() 
			end
			local ent2 = ents.Create("medic_xray_plate"); ent2:SetPos(self:GetPos() + self:GetAngles():Up()*35 + self:GetAngles():Forward()*0 + self:GetAngles():Right()*30)
			if ply:GetNWInt("MedicineModtraumapenis") != 0 then 
				ent2:SetNWBool("have_traumapenis", true); ent2:SetNWString("organ","penis"); ent2:Spawn() else 
				ent2:SetNWBool("have_traumapenis", false); ent2:SetNWString("organ","penis"); ent2:Spawn() 
			end
		end)
		self.nextSec = CurTime() + 4.5
	end
end
