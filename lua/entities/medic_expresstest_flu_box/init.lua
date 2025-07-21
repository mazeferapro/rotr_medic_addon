AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_junk/cardboard_box004a.mdl")
	self:SetMaterial("models/props/de_prodigy/transformer")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
	self:SetNWBool("have_tests", true)
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		if self:GetNWBool("have_tests") == true then
			ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youtookaflutest } chat.AddText(unpack(tab))")
			self:SetNWBool("have_tests", false)
			ply:Give("medic_expresstest_flu")
			timer.Simple(10, function()
				self:SetNWBool("have_tests", true)
			end)
		else
			ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Noflutests } chat.AddText(unpack(tab))")
		end
		self.nextSec = CurTime() + 3
	end	
end