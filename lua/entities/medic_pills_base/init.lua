AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel(self.Model) 
	self:SetMaterial("models/props/cs_office/shelves_stuff")
	--self:SetMaterial("models/props/de_prodigy/transformer")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS) 
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then phys:Wake() end
	self:SetNWInt("pills_mass",table.Random({50,100,200,500,1000}))
	self:SetNWInt("have_pills",table.Random({10,20,30,50}))
	self:SetNWString("pills_form",table.Random({"Tablets","Capsules","Ampoules"}))
end