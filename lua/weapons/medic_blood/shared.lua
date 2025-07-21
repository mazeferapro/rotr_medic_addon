SWEP.PrintName = "Blood syringe"
SWEP.Category = "[Medic Addon] - Diagnostic"
SWEP.Instructions = ""
------------------------------------
SWEP.Contact = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.Slot = 4
SWEP.SlotPos = 9
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
------------------------------------
function SWEP:Initialize()
    self:SetHoldType("normal")
end
function SWEP:Deploy()
    return true
end
function SWEP:DrawWorldModel()
end
function SWEP:PreDrawViewModel(vm)
    return true
end
function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 5)
	if (CLIENT) then return end
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
	if ent:GetClass() == "medic_microscope" and ent:GetPos():DistToSqr( self:GetOwner():GetPos() ) <= 20000 then
		if ent:GetNWBool("have_analyse") == false then
			self:Remove()
			self:GetOwner():EmitSound("ambient/materials/bump1.wav")
			self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
			self:GetOwner():SendLua("local tab = {Color(80, 170, 80), TranslationMedicMod.Youareresearchingbiomaterial } chat.AddText(unpack(tab))")
			ent:SetNWBool("have_analyse", true)
			ent:SetNWBool("have_blood", true)

			ent:SetNWInt( "erythrocytes", math.random(120,150) )
			ent:SetNWInt( "monocytes", math.random(0,1) )
			ent:SetNWInt( "b_limphocytes", math.random(1,3) )
			ent:SetNWInt( "thrombocytes", math.random(120,150) )
			if self:GetOwner():GetNWBool( "have_megaloblasticanemia") == true then
				ent:SetNWInt( "erythrocytes", math.random(70,119) )
				self:GetOwner():SetNWBool( "have_megaloblasticanemia",false)
			elseif self:GetOwner():GetNWBool( "have_haemoliticanemia") == true then
				ent:SetNWInt( "erythrocytes", math.random(70,119) )
				self:GetOwner():SetNWBool( "have_haemoliticanemia",false)
			elseif self:GetOwner():GetNWBool( "have_dishaemopoeticanemia") == true then
				ent:SetNWInt( "erythrocytes", math.random(70,119) )
				self:GetOwner():SetNWBool( "have_dishaemopoeticanemia",false)
			elseif self:GetOwner():GetNWBool( "have_disforotocidyriae") == true then
				ent:SetNWInt( "erythrocytes", math.random(70,119) )
				self:GetOwner():SetNWBool( "have_disforotocidyriae",false)
			end
			if self:GetOwner():GetNWBool( "have_hysticytosis") == true then
				ent:SetNWInt( "monocytes", math.random(2,10) )
				self:GetOwner():SetNWBool( "have_hysticytosis",false)
			end
			if self:GetOwner():GetNWBool( "have_mastocytosis") == true then
				ent:SetNWInt( "b_limphocytes", math.random(4,25) )
				self:GetOwner():SetNWBool( "have_mastocytosis",false)
			end
			if self:GetOwner():GetNWBool( "have_essencialitistrombicitaemia") == true then
				ent:SetNWInt( "thrombocytes", math.random(50,119) )
				self:GetOwner():SetNWBool( "have_essencialitistrombicitaemia",false)
			end
		end
	end
	if ent:GetClass() == "medic_analyzer" and ent:GetPos():DistToSqr( self:GetOwner():GetPos() ) <= 20000 then
		if ent:GetNWBool("have_analyse") == false then
			self:Remove()
			self:GetOwner():EmitSound("ambient/materials/bump1.wav")
			self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
			self:GetOwner():SendLua("local tab = {Color(80, 170, 80), TranslationMedicMod.Youareresearchingbiomaterial } chat.AddText(unpack(tab))")
			ent:SetNWBool("have_analyse", true)
			ent:SetNWBool("have_blood", true)
			ent:SetNWInt( "angitensin", math.random(20,70) )
			ent:SetNWInt( "vasopressin", math.random(270,280) )
			ent:SetNWInt( "bilirubin", math.random(4,16) )
			ent:SetNWInt( "alt", math.random(0,40) )
			ent:SetNWInt( "uria", math.random(3,7) )
			ent:SetNWInt( "ferrum", math.random(9,30) )
			ent:SetNWInt( "amylasa", math.random(30,100) )
			ent:SetNWInt( "lipasa", math.random(0,60) )
			if self:GetOwner():GetNWBool( "have_AngiotensinicusHypertensia") == true then
				ent:SetNWInt( "angitensin", math.random(71,140) )
				self:GetOwner():SetNWBool( "have_AngiotensinicusHypertensia",false)
			end
			if self:GetOwner():GetNWBool( "have_VasopressicusHypertensia") == true then
				ent:SetNWInt( "vasopressin", math.random(281,400) )
				self:GetOwner():SetNWBool( "have_VasopressicusHypertensia",false)
			end
			if self:GetOwner():GetNWBool( "have_HepatitisA") == true then
				ent:SetNWInt( "bilirubin", math.random(0,4) )
				ent:SetNWInt( "alt", math.random(41,80) )
				self:GetOwner():SetNWBool( "have_HepatitisA",false)
			end
			if self:GetOwner():GetNWBool( "have_PyelonephritisDiffususInfiltratus") == true then
				ent:SetNWInt( "uria", math.random(8,30) )
				self:GetOwner():SetNWBool( "have_PyelonephritisDiffususInfiltratus",false)
			end
			if self:GetOwner():GetNWBool( "have_PyelonephritisMesenhimicus") == true then
				ent:SetNWInt( "uria", math.random(8,30) )
				self:GetOwner():SetNWBool( "have_PyelonephritisMesenhimicus",false)
			end
			if self:GetOwner():GetNWBool( "have_megaloblasticanemia") == true then
				ent:SetNWInt( "ferrum", math.random(0,8) )
				self:GetOwner():SetNWBool( "have_megaloblasticanemia",false)
			end
			if self:GetOwner():GetNWBool( "have_haemoliticanemia") == true then
				ent:SetNWInt( "bilirubin", math.random(17,50) )
				self:GetOwner():SetNWBool( "have_haemoliticanemia",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitisexacerbatiosus") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitisexacerbatiosus",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitispara") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitispara",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitissepticus") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitissepticus",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitishaemorragicus") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitishaemorragicus",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitisinfiltratus") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitisinfiltratus",false)
			end
			if self:GetOwner():GetNWBool( "have_Pancreatitisautoimmunicus") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				ent:SetNWInt( "lipasa", math.random(61,120) )
				self:GetOwner():SetNWBool( "have_Pancreatitisautoimmunicus",false)
			end
			if self:GetOwner():GetNWBool( "have_Sialoadenitis") == true then
				ent:SetNWInt( "amylasa", math.random(101,200) )
				self:GetOwner():SetNWBool( "have_Sialoadenitis",false)
			end
			if self:GetOwner():GetNWBool( "have_Intoxication") == true then
				ent:SetNWInt( "bilirubin", math.random(0,4) )
				ent:SetNWInt( "alt", math.random(41,80) )
				self:GetOwner():SetNWBool( "have_Intoxication",false)
			end
		end
	end
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
    timer.Simple(2, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youreceivedbiomaterial } chat.AddText(unpack(tab))")
		if ent:GetNWInt( "MedicineModIntoxication") > 50 then
			self:GetOwner():SetNWBool( "have_Intoxication",true)
		end
		if ent:GetNWInt("MedicineModAngiotensinicusHypertensia") != 100 then
			self:GetOwner():SetNWBool( "have_AngiotensinicusHypertensia",true)
		end
		if ent:GetNWInt("MedicineModVasopressicusHypertensia") < 100 then
			self:GetOwner():SetNWBool( "have_VasopressicusHypertensia",true)
		end
		if ent:GetNWInt("MedicineModHepatitisA") < 100 then
			self:GetOwner():SetNWBool( "have_HepatitisA",true)
		end
		if ent:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") < 100 then
			self:GetOwner():SetNWBool( "have_PyelonephritisDiffususInfiltratus",true)
		end
		if ent:GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 then
			self:GetOwner():SetNWBool( "have_PyelonephritisMesenhimicus",true)
		end
		if ent:GetNWInt("MedicineModPancreatitisexacerbatiosus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisexacerbatiosus",true)
		end
		if ent:GetNWInt("MedicineModPancreatitispara") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitispara",true)
		end
		if ent:GetNWInt("MedicineModPancreatitissepticus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitissepticus",true)
		end
		if ent:GetNWInt("MedicineModPancreatitishaemorragicus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitishaemorragicus",true)
		end
		if ent:GetNWInt("MedicineModPancreatitisinfiltratus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisinfiltratus",true)
		end
		if ent:GetNWInt("MedicineModPancreatitisautoimmunicus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisautoimmunicus",true)
		end
		if ent:GetNWInt("MedicineModSialoadenitis") < 100 then
			self:GetOwner():SetNWBool( "have_Sialoadenitis",true)
		end
		if ent:GetNWInt( "MedicineModmegaloblasticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_megaloblasticanemia",true)
		end
		if ent:GetNWInt( "MedicineModhaemoliticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_haemoliticanemia",true)
		end
		if ent:GetNWInt( "MedicineModdishaemopoeticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_dishaemopoeticanemia",true)
		end
		if ent:GetNWInt( "MedicineModdisforotocidyriae") < 100 then
			self:GetOwner():SetNWBool( "have_disforotocidyriae",true)
		end
		if ent:GetNWInt( "MedicineModhysticytosis") < 100 then
			self:GetOwner():SetNWBool( "have_hysticytosis",true)
		end
		if ent:GetNWInt( "MedicineModmastocytosis") < 100 then
			self:GetOwner():SetNWBool( "have_mastocytosis",true)
		end
		if ent:GetNWInt( "MedicineModessencialitistrombicitaemia") < 100 then
			self:GetOwner():SetNWBool( "have_essencialitistrombicitaemia",true)
		end
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:GetOwner():EmitSound("ambient/materials/bump1.wav")
		self:GetOwner():EmitSound("ambient/materials/dinnerplates3.wav")
		self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Youreceivedbiomaterial } chat.AddText(unpack(tab))")
		if self:GetOwner():GetNWInt( "MedicineModIntoxication") > 50 then
			self:GetOwner():SetNWBool( "have_Intoxication",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModAngiotensinicusHypertensia") < 100 then
			self:GetOwner():SetNWBool( "have_AngiotensinicusHypertensia",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModVasopressicusHypertensia") < 100 then
			self:GetOwner():SetNWBool( "have_VasopressicusHypertensia",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModHepatitisA") < 100 then
			self:GetOwner():SetNWBool( "have_HepatitisA",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPyelonephritisDiffususInfiltratus") < 100 then
			self:GetOwner():SetNWBool( "have_PyelonephritisDiffususInfiltratus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPyelonephritisMesenhimicus") < 100 then
			self:GetOwner():SetNWBool( "have_PyelonephritisMesenhimicus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitisexacerbatiosus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisexacerbatiosus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitispara") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitispara",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitissepticus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitissepticus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitishaemorragicus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitishaemorragicus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitisinfiltratus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisinfiltratus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModPancreatitisautoimmunicus") < 100 then
			self:GetOwner():SetNWBool( "have_Pancreatitisautoimmunicus",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModSialoadenitis") < 100 then
			self:GetOwner():SetNWBool( "have_Sialoadenitis",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModmegaloblasticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_megaloblasticanemia",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModhaemoliticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_haemoliticanemia",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModdishaemopoeticanemia") < 100 then
			self:GetOwner():SetNWBool( "have_dishaemopoeticanemia",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModdisforotocidyriae") < 100 then
			self:GetOwner():SetNWBool( "have_disforotocidyriae",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModhysticytosis") < 100 then
			self:GetOwner():SetNWBool( "have_hysticytosis",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModmastocytosis") < 100 then
			self:GetOwner():SetNWBool( "have_mastocytosis",true)
		end
		if self:GetOwner():GetNWInt( "MedicineModessencialitistrombicitaemia") < 100 then
			self:GetOwner():SetNWBool( "have_essencialitistrombicitaemia",true)
		end
    end)
end
