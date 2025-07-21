AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
self:SetModel("models/urinecup.mdl")
self:PhysicsInit(SOLID_VPHYSICS)     
self:SetMoveType(MOVETYPE_VPHYSICS)   
self:SetSolid(SOLID_VPHYSICS)         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then phys:Wake() end
self:SetNWBool("have_disease", false)
end

function ENT:Use(ply)
    if self:GetNWInt("usabled") == 1 then 
	ply:SendLua("local tab = {Color(170, 0, 0), TranslationMedicMod.Urinejarfull } chat.AddText(unpack(tab))")
	return end
	ply:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youfilledajarofurine } chat.AddText(unpack(tab))")
	self:SetNWInt("usabled", 1)
	self:SetBodygroup(2,1)
	self:EmitSound("physics/cardboard/cardboard_box_strain2.wav")
	
	if ply:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") <= 99 then self:SetNWBool("have_PyelonephritisLocalInfiltratus", true) end
	if ply:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") <= 99 then self:SetNWBool("have_PyelonephritisDiffususInfiltratus", true) end
	if ply:GetNWInt("MedicineModPyelonephritisMesenhimicus") <= 99 then self:SetNWBool("have_PyelonephritisMesenhimicus", true) end
	if ply:GetNWInt("MedicineModdisfarginasa") <= 99 then self:SetNWBool("have_disfarginasa", true) end
	if ply:GetNWInt("MedicineModdisforotocidyriae") <= 99 then self:SetNWBool("have_disforotocidyriae", true) end
	if ply:GetNWInt("MedicineModpyonephrosum") <= 99 then self:SetNWBool("have_pyonephrosum", true) end
	if ply:GetNWInt("MedicineModneprosclerosis") <= 99 then self:SetNWBool("have_neprosclerosis", true) end
	if ply:GetNWInt("MedicineModglomerulonefritisfast") <= 99 then self:SetNWBool("have_glomerulonefritisfast", true) end
	if ply:GetNWInt("MedicineModdiffususglomerulonephritis") <= 99 then self:SetNWBool("have_diffususglomerulonephritis", true) end
end