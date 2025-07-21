AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
function ENT:Initialize()
	self:SetModel("models/props_lab/reciever01b.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)  
    self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if phys and phys:IsValid() then phys:Wake() end
	self:SetNWInt("angitensin", 0)
	self:SetNWInt("vasopressin", 0)
	self:SetNWInt("bilirubin", 0)
	self:SetNWInt("alt", 0)
	self:SetNWInt("leukocytes", 0)
	self:SetNWInt("uria", 0)
	self:SetNWInt("ferrum", 0)
	self:SetNWInt("amylasa", 0)
	self:SetNWInt("lipasa", 0)
	self:SetNWBool("have_analyse", false)
	
	self:SetNWBool("have_urie", false)
	self:SetNWBool("have_blood", false)
	
	self:SetNWBool("have_disease", false)
end

function ENT:Use(ply)
	if (!self.nextSec or CurTime() >= self.nextSec) then
		self:EmitSound("physics/glass/glass_impact_hard1.wav")
		self:SetNWBool("have_disease", false)
		self:SetNWBool("have_analyse", false)
		self:SetNWBool("have_urie", false)
		self:SetNWBool("have_blood", false)
		self:SetNWInt("angitensin", 0)
		self:SetNWInt("vasopressin", 0)
		self:SetNWInt("bilirubin", 0)
		self:SetNWInt("alt", 0)
		self:SetNWInt("leukocytes", 0)
		self:SetNWInt("uria", 0)
		self:SetNWInt("ferrum", 0)
		self:SetNWInt("amylasa", 0)
		self:SetNWInt("lipasa", 0)
		ply:SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youdestroyedthebiomaterial } chat.AddText(unpack(tab))")
		self.nextSec = CurTime() + 3
	end	
end

function ENT:StartTouch(hitEnt)
	if self:GetNWBool("have_analyse") == false then
		if hitEnt:GetClass() == "medic_urina" then
			self:SetNWBool("have_analyse", true)
			self:SetNWBool("have_urie", true)
			self:SetNWInt("leukocytes", math.random(0,5))
			self:SetNWInt("uria", math.random(5,20))
			if hitEnt:GetNWBool("have_PyelonephritisLocalInfiltratus") == true then
				self:SetNWInt("leukocytes", math.random(6,40))
				if hitEnt:GetNWBool("have_PyelonephritisDiffususInfiltratus") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_PyelonephritisMesenhimicus") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_disfarginasa") == true then
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_disforotocidyriae") == true then
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_pyonephrosum") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_neprosclerosis") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_glomerulonefritisfast") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
				if hitEnt:GetNWBool("have_diffususglomerulonephritis") == true then
					self:SetNWInt("leukocytes", math.random(6,40))
					self:SetNWInt("uria", math.random(0,4))
				end
			end
			hitEnt:Remove()
		end
	end
end