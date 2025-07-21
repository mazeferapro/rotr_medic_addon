SWEP.PrintName = "Disease 100%"
SWEP.Category = "[Medic Addon] - Disease"
SWEP.Instructions = ""
------------------------------------
SWEP.Contact = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.Slot = 3
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
    self:SetNextPrimaryFire(CurTime() + 2)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,105)
		if rand == 1 then
			ent:SetNWInt("MedicineModRhinitus", ent:GetNWInt("MedicineModRhinitus") - 1)
		elseif rand == 2 then
			ent:SetNWInt("MedicineModVirusPneumonitis", ent:GetNWInt("MedicineModVirusPneumonitis") - 1)
		elseif rand == 3 then
			ent:SetNWInt("MedicineModPharingitis", ent:GetNWInt("MedicineModPharingitis") - 1)
		elseif rand == 4 then
			ent:SetNWInt("MedicineModEustahiitis", ent:GetNWInt("MedicineModEustahiitis") - 1)
		elseif rand == 5 then
			ent:SetNWInt("MedicineModAngiotensinicusHypertensia", ent:GetNWInt("MedicineModAngiotensinicusHypertensia") - 1)
		elseif rand == 6 then
			ent:SetNWInt("MedicineModVasopressicusHypertensia", ent:GetNWInt("MedicineModVasopressicusHypertensia") - 1)
		elseif rand == 7 then
			ent:SetNWInt("MedicineModHepatitisA", ent:GetNWInt("MedicineModHepatitisA") - 1)
		elseif rand == 8 then
			ent:SetNWInt("MedicineModPyelonephritisLocalInfiltratus", ent:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") - 1)
		elseif rand == 9 then
			ent:SetNWInt("MedicineModPyelonephritisDiffususInfiltratus", ent:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") - 1)
		elseif rand == 10 then
			ent:SetNWInt("MedicineModPyelonephritisMesenhimicus", ent:GetNWInt("MedicineModPyelonephritisMesenhimicus") - 1)
		elseif rand == 11 then
			ent:SetNWInt("MedicineModbacstenosisclapmitralis", ent:GetNWInt("MedicineModbacstenosisclapmitralis") - 1)
		elseif rand == 12 then
			ent:SetNWInt("MedicineModavblock", ent:GetNWInt("MedicineModavblock") - 1)
		elseif rand == 13 then
			ent:SetNWInt("MedicineModfungendocarditis", ent:GetNWInt("MedicineModfungendocarditis") - 1)
		elseif rand == 14 then
			ent:SetNWInt("MedicineModmegaloblasticanemia", ent:GetNWInt("MedicineModmegaloblasticanemia") - 1)
		elseif rand == 15 then
			ent:SetNWInt("MedicineModhaemoliticanemia", ent:GetNWInt("MedicineModhaemoliticanemia") - 1)
		elseif rand == 16 then
			ent:SetNWInt("MedicineModdishaemopoeticanemia", ent:GetNWInt("MedicineModdishaemopoeticanemia") - 1)
		elseif rand == 17 then
			ent:SetNWInt("MedicineModOsephagitis", ent:GetNWInt("MedicineModOsephagitis") - 1)
		elseif rand == 18 then
			ent:SetNWInt("MedicineModGastritis", ent:GetNWInt("MedicineModGastritis") - 1)
		elseif rand == 19 then
			ent:SetNWInt("MedicineModDyodenitis", ent:GetNWInt("MedicineModDyodenitis") - 1)
		elseif rand == 20 then
			ent:SetNWInt("MedicineModEunitis", ent:GetNWInt("MedicineModEunitis") - 1)
		elseif rand == 21 then
			ent:SetNWInt("MedicineModIelitis", ent:GetNWInt("MedicineModIelitis") - 1)
		elseif rand == 22 then
			ent:SetNWInt("MedicineModColitis", ent:GetNWInt("MedicineModColitis") - 1)
		elseif rand == 23 then
			ent:SetNWInt("MedicineModSigmoiditis", ent:GetNWInt("MedicineModSigmoiditis") - 1)
		elseif rand == 24 then
			ent:SetNWInt("MedicineModProctitis", ent:GetNWInt("MedicineModProctitis") - 1)
		elseif rand == 25 then
			ent:SetNWInt("MedicineModPancreatitisexacerbatiosus", ent:GetNWInt("MedicineModPancreatitisexacerbatiosus") - 1)
		elseif rand == 26 then
			ent:SetNWInt("MedicineModPancreatitispara", ent:GetNWInt("MedicineModPancreatitispara") - 1)
		elseif rand == 27 then
			ent:SetNWInt("MedicineModPancreatitissepticus", ent:GetNWInt("MedicineModPancreatitissepticus") - 1)
		elseif rand == 28 then
			ent:SetNWInt("MedicineModPancreatitishaemorragicus", ent:GetNWInt("MedicineModPancreatitishaemorragicus") - 1)
		elseif rand == 29 then
			ent:SetNWInt("MedicineModPancreatitisinfiltratus", ent:GetNWInt("MedicineModPancreatitisinfiltratus") - 1)
		elseif rand == 30 then
			ent:SetNWInt("MedicineModPancreatitisautoimmunicus", ent:GetNWInt("MedicineModPancreatitisautoimmunicus") - 1)
		elseif rand == 31 then
			ent:SetNWInt("MedicineModSialoadenitis", ent:GetNWInt("MedicineModSialoadenitis") - 1)
		elseif rand == 32 then
			ent:SetNWInt("MedicineModdisfarginasa", ent:GetNWInt("MedicineModdisfarginasa") - 1)
		elseif rand == 33 then
			ent:SetNWInt("MedicineModdisffumarat", ent:GetNWInt("MedicineModdisffumarat") - 1)
		elseif rand == 34 then
			ent:SetNWInt("MedicineModdisforotocidyriae", ent:GetNWInt("MedicineModdisforotocidyriae") - 1)
		elseif rand == 35 then
			ent:SetNWInt("MedicineModpodagra", ent:GetNWInt("MedicineModpodagra") - 1)
		elseif rand == 36 then
			ent:SetNWInt("MedicineModhaerptonsilitis", ent:GetNWInt("MedicineModhaerptonsilitis") - 1)
		elseif rand == 37 then
			ent:SetNWInt("MedicineModcataralistonsillitis", ent:GetNWInt("MedicineModcataralistonsillitis") - 1)
		elseif rand == 38 then
			ent:SetNWInt("MedicineModlacunaristonsillitis", ent:GetNWInt("MedicineModlacunaristonsillitis") - 1)
		elseif rand == 39 then
			ent:SetNWInt("MedicineModparatonsillitis", ent:GetNWInt("MedicineModparatonsillitis") - 1)
		elseif rand == 40 then
			ent:SetNWInt("MedicineModfibrisustonsillitis", ent:GetNWInt("MedicineModfibrisustonsillitis") - 1)
		elseif rand == 41 then
			ent:SetNWInt("MedicineModfollicularistonsilitis", ent:GetNWInt("MedicineModfollicularistonsilitis") - 1)
		elseif rand == 42 then
			ent:SetNWInt("MedicineModsinusitis", ent:GetNWInt("MedicineModsinusitis") - 1)
		elseif rand == 43 then
			ent:SetNWInt("MedicineModnasovestibulit", ent:GetNWInt("MedicineModnasovestibulit") - 1)
		elseif rand == 44 then
			ent:SetNWInt("MedicineModdiffususbronchitis", ent:GetNWInt("MedicineModdiffususbronchitis") - 1)
		elseif rand == 45 then
			ent:SetNWInt("MedicineModperibronchitis", ent:GetNWInt("MedicineModperibronchitis") - 1)
		elseif rand == 46 then
			ent:SetNWInt("MedicineModoeosenophilistbronchitis", ent:GetNWInt("MedicineModoeosenophilistbronchitis") - 1)
		elseif rand == 47 then
			ent:SetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis", ent:GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") - 1)
		elseif rand == 48 then
			ent:SetNWInt("MedicineModfibrosusalveolitits", ent:GetNWInt("MedicineModfibrosusalveolitits") - 1)
		elseif rand == 49 then
			ent:SetNWInt("MedicineModdiffususnecroticusalveolitis", ent:GetNWInt("MedicineModdiffususnecroticusalveolitis") - 1)
		elseif rand == 50 then
			ent:SetNWInt("MedicineModeccsudatusplevritis", ent:GetNWInt("MedicineModeccsudatusplevritis") - 1)
		elseif rand == 51 then
			ent:SetNWInt("MedicineModfibrosusplevritis", ent:GetNWInt("MedicineModfibrosusplevritis") - 1)
		elseif rand == 52 then
			ent:SetNWInt("MedicineModhysticytosis", ent:GetNWInt("MedicineModhysticytosis") - 1)
		elseif rand == 53 then
			ent:SetNWInt("MedicineModmastocytosis", ent:GetNWInt("MedicineModmastocytosis") - 1)
		elseif rand == 54 then
			ent:SetNWInt("MedicineModessencialitistrombicitaemia", ent:GetNWInt("MedicineModessencialitistrombicitaemia") - 1)
		elseif rand == 55 then
			ent:SetNWInt("MedicineModcentralicatrombocitaemia", ent:GetNWInt("MedicineModcentralicatrombocitaemia") - 1)
		elseif rand == 56 then
			ent:SetNWInt("MedicineModlangergansishystiocytosis", ent:GetNWInt("MedicineModlangergansishystiocytosis") - 1)
		elseif rand == 57 then
			ent:SetNWInt("MedicineModsystemicpoliangiit", ent:GetNWInt("MedicineModsystemicpoliangiit") - 1)
		elseif rand == 58 then
			ent:SetNWInt("MedicineModnecroticperiarteriit", ent:GetNWInt("MedicineModnecroticperiarteriit") - 1)
		elseif rand == 59 then
			ent:SetNWInt("MedicineModrevmaticpoliangiit", ent:GetNWInt("MedicineModrevmaticpoliangiit") - 1)
		elseif rand == 60 then
			ent:SetNWInt("MedicineModnecroticpoliangiit", ent:GetNWInt("MedicineModnecroticpoliangiit") - 1)
		elseif rand == 61 then
			ent:SetNWInt("MedicineModglobulinaemicusflebidis", ent:GetNWInt("MedicineModglobulinaemicusflebidis") - 1)
		elseif rand == 62 then
			ent:SetNWInt("MedicineModgranulematosispoliflebitis", ent:GetNWInt("MedicineModgranulematosispoliflebitis") - 1)
		elseif rand == 63 then
			ent:SetNWInt("MedicineModcerebrovasculitis", ent:GetNWInt("MedicineModcerebrovasculitis") - 1)
		elseif rand == 64 then
			ent:SetNWInt("MedicineModacsonopaticpolinevritis", ent:GetNWInt("MedicineModacsonopaticpolinevritis") - 1)
		elseif rand == 65 then
			ent:SetNWInt("MedicineModdemieliticnevritis", ent:GetNWInt("MedicineModdemieliticnevritis") - 1)
		elseif rand == 66 then
			ent:SetNWInt("MedicineModdiffususpolinevritis", ent:GetNWInt("MedicineModdiffususpolinevritis") - 1)
		elseif rand == 67 then
			ent:SetNWInt("MedicineModrevmaticplexitis", ent:GetNWInt("MedicineModrevmaticplexitis") - 1)
		elseif rand == 68 then
			ent:SetNWInt("MedicineModexacerbatiosusradiculitis", ent:GetNWInt("MedicineModexacerbatiosusradiculitis") - 1)
		elseif rand == 69 then
			ent:SetNWInt("MedicineModencephalitis", ent:GetNWInt("MedicineModencephalitis") - 1)
		elseif rand == 70 then
			ent:SetNWInt("MedicineModserosusminengitis", ent:GetNWInt("MedicineModserosusminengitis") - 1)
		elseif rand == 71 then
			ent:SetNWInt("MedicineModprotozoaminengitis", ent:GetNWInt("MedicineModprotozoaminengitis") - 1)
		elseif rand == 72 then
			ent:SetNWInt("MedicineModspondilodiscitis", ent:GetNWInt("MedicineModspondilodiscitis") - 1)
		elseif rand == 73 then
			ent:SetNWInt("MedicineModpyogenicusmielitis", ent:GetNWInt("MedicineModpyogenicusmielitis") - 1)
		elseif rand == 74 then
			ent:SetNWInt("MedicineModeshemicusencephalopatia", ent:GetNWInt("MedicineModeshemicusencephalopatia") - 1)
		elseif rand == 75 then
			ent:SetNWInt("MedicineModgangliolitis", ent:GetNWInt("MedicineModgangliolitis") - 1)
		elseif rand == 76 then
			ent:SetNWInt("MedicineModosteomielit", ent:GetNWInt("MedicineModosteomielit") - 1)
		elseif rand == 77 then
			ent:SetNWInt("MedicineModpyonephrosum", ent:GetNWInt("MedicineModpyonephrosum") - 1)
		elseif rand == 78 then
			ent:SetNWInt("MedicineModneprosclerosis", ent:GetNWInt("MedicineModneprosclerosis") - 1)
		elseif rand == 79 then
			ent:SetNWInt("MedicineModglomerulonefritisfast", ent:GetNWInt("MedicineModglomerulonefritisfast") - 1)
		elseif rand == 80 then
			ent:SetNWInt("MedicineModdiffususglomerulonephritis", ent:GetNWInt("MedicineModdiffususglomerulonephritis") - 1)
		elseif rand == 81 then
			ent:SetNWInt("MedicineModuretritis", ent:GetNWInt("MedicineModuretritis") - 1)
		elseif rand == 82 then
			ent:SetNWInt("MedicineModcystitis", ent:GetNWInt("MedicineModcystitis") - 1)
		elseif rand == 83 then
			ent:SetNWInt("MedicineModacantomediasiskeratitis", ent:GetNWInt("MedicineModacantomediasiskeratitis") - 1)
		elseif rand == 84 then
			ent:SetNWInt("MedicineModophtalmoangiopathia", ent:GetNWInt("MedicineModophtalmoangiopathia") - 1)
		elseif rand == 85 then
			ent:SetNWInt("MedicineModconjunktivitis", ent:GetNWInt("MedicineModconjunktivitis") - 1)
		elseif rand == 86 then
			ent:SetNWInt("MedicineModdacryoadenitis", ent:GetNWInt("MedicineModdacryoadenitis") - 1)
		elseif rand == 87 then
			ent:SetNWInt("MedicineModiridocyclitis", ent:GetNWInt("MedicineModiridocyclitis") - 1)
		elseif rand == 88 then
			ent:SetNWInt("MedicineModkeratit", ent:GetNWInt("MedicineModkeratit") - 1)
		elseif rand == 89 then
			ent:SetNWInt("MedicineModxenophtalmia", ent:GetNWInt("MedicineModxenophtalmia") - 1)
		elseif rand == 90 then
			ent:SetNWInt("MedicineModinfiltratusopticusneuropathia", ent:GetNWInt("MedicineModinfiltratusopticusneuropathia") - 1)
		elseif rand == 91 then
			ent:SetNWInt("MedicineModpanaphtalmitis", ent:GetNWInt("MedicineModpanaphtalmitis") - 1)
		elseif rand == 92 then
			ent:SetNWInt("MedicineModretinitis", ent:GetNWInt("MedicineModretinitis") - 1)
		elseif rand == 93 then
			ent:SetNWInt("MedicineModinfiltratusscleritis", ent:GetNWInt("MedicineModinfiltratusscleritis") - 1)
		elseif rand == 94 then
			ent:SetNWInt("MedicineModuveitis", ent:GetNWInt("MedicineModuveitis") - 1)
		elseif rand == 95 then
			ent:SetNWInt("MedicineModendophtalmitis", ent:GetNWInt("MedicineModendophtalmitis") - 1)
		elseif rand == 96 then
			ent:SetNWInt("MedicineModepiscleritis", ent:GetNWInt("MedicineModepiscleritis") - 1)
		elseif rand == 97 then
			ent:SetNWInt("MedicineModmeibomitis", ent:GetNWInt("MedicineModmeibomitis") - 1)
		elseif rand == 98 then
			ent:SetNWInt("MedicineModblefaritis", ent:GetNWInt("MedicineModblefaritis") - 1)
		elseif rand == 99 then
			ent:SetNWInt("MedicineModneuromyotomia", ent:GetNWInt("MedicineModneuromyotomia") - 1)
		elseif rand == 100 then
			ent:SetNWInt("MedicineModdacryocystitis", ent:GetNWInt("MedicineModdacryocystitis") - 1)
		elseif rand == 101 then
			ent:SetNWInt("MedicineModotitisexterna", ent:GetNWInt("MedicineModotitisexterna") - 1)
		elseif rand == 102 then
			ent:SetNWInt("MedicineModotitismedialis", ent:GetNWInt("MedicineModotitismedialis") - 1)
		elseif rand == 103 then
			ent:SetNWInt("MedicineModololicvorea", ent:GetNWInt("MedicineModololicvorea") - 1)
		elseif rand == 104 then
			ent:SetNWInt("MedicineModotohaemotorea", ent:GetNWInt("MedicineModotohaemotorea") - 1)
		elseif rand == 105 then
			ent:SetNWInt("MedicineModotovestibulitis", ent:GetNWInt("MedicineModotovestibulitis") - 1)
		end
		self:Remove()
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 2)
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		local rand = math.random(1,105)
		if rand == 1 then
			self:GetOwner():SetNWInt("MedicineModRhinitus", self:GetOwner():GetNWInt("MedicineModRhinitus") - 1)
		elseif rand == 2 then
			self:GetOwner():SetNWInt("MedicineModVirusPneumonitis", self:GetOwner():GetNWInt("MedicineModVirusPneumonitis") - 1)
		elseif rand == 3 then
			self:GetOwner():SetNWInt("MedicineModPharingitis", self:GetOwner():GetNWInt("MedicineModPharingitis") - 1)
		elseif rand == 4 then
			self:GetOwner():SetNWInt("MedicineModEustahiitis", self:GetOwner():GetNWInt("MedicineModEustahiitis") - 1)
		elseif rand == 5 then
			self:GetOwner():SetNWInt("MedicineModAngiotensinicusHypertensia", self:GetOwner():GetNWInt("MedicineModAngiotensinicusHypertensia") - 1)
		elseif rand == 6 then
			self:GetOwner():SetNWInt("MedicineModVasopressicusHypertensia", self:GetOwner():GetNWInt("MedicineModVasopressicusHypertensia") - 1)
		elseif rand == 7 then
			self:GetOwner():SetNWInt("MedicineModHepatitisA", self:GetOwner():GetNWInt("MedicineModHepatitisA") - 1)
		elseif rand == 8 then
			self:GetOwner():SetNWInt("MedicineModPyelonephritisLocalInfiltratus", self:GetOwner():GetNWInt("MedicineModPyelonephritisLocalInfiltratus") - 1)
		elseif rand == 9 then
			self:GetOwner():SetNWInt("MedicineModPyelonephritisDiffususInfiltratus", self:GetOwner():GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") - 1)
		elseif rand == 10 then
			self:GetOwner():SetNWInt("MedicineModPyelonephritisMesenhimicus", self:GetOwner():GetNWInt("MedicineModPyelonephritisMesenhimicus") - 1)
		elseif rand == 11 then
			self:GetOwner():SetNWInt("MedicineModbacstenosisclapmitralis", self:GetOwner():GetNWInt("MedicineModbacstenosisclapmitralis") - 1)
		elseif rand == 12 then
			self:GetOwner():SetNWInt("MedicineModavblock", self:GetOwner():GetNWInt("MedicineModavblock") - 1)
		elseif rand == 13 then
			self:GetOwner():SetNWInt("MedicineModfungendocarditis", self:GetOwner():GetNWInt("MedicineModfungendocarditis") - 1)
		elseif rand == 14 then
			self:GetOwner():SetNWInt("MedicineModmegaloblasticanemia", self:GetOwner():GetNWInt("MedicineModmegaloblasticanemia") - 1)
		elseif rand == 15 then
			self:GetOwner():SetNWInt("MedicineModhaemoliticanemia", self:GetOwner():GetNWInt("MedicineModhaemoliticanemia") - 1)
		elseif rand == 16 then
			self:GetOwner():SetNWInt("MedicineModdishaemopoeticanemia", self:GetOwner():GetNWInt("MedicineModdishaemopoeticanemia") - 1)
		elseif rand == 17 then
			self:GetOwner():SetNWInt("MedicineModOsephagitis", self:GetOwner():GetNWInt("MedicineModOsephagitis") - 1)
		elseif rand == 18 then
			self:GetOwner():SetNWInt("MedicineModGastritis", self:GetOwner():GetNWInt("MedicineModGastritis") - 1)
		elseif rand == 19 then
			self:GetOwner():SetNWInt("MedicineModDyodenitis", self:GetOwner():GetNWInt("MedicineModDyodenitis") - 1)
		elseif rand == 20 then
			self:GetOwner():SetNWInt("MedicineModEunitis", self:GetOwner():GetNWInt("MedicineModEunitis") - 1)
		elseif rand == 21 then
			self:GetOwner():SetNWInt("MedicineModIelitis", self:GetOwner():GetNWInt("MedicineModIelitis") - 1)
		elseif rand == 22 then
			self:GetOwner():SetNWInt("MedicineModColitis", self:GetOwner():GetNWInt("MedicineModColitis") - 1)
		elseif rand == 23 then
			self:GetOwner():SetNWInt("MedicineModSigmoiditis", self:GetOwner():GetNWInt("MedicineModSigmoiditis") - 1)
		elseif rand == 24 then
			self:GetOwner():SetNWInt("MedicineModProctitis", self:GetOwner():GetNWInt("MedicineModProctitis") - 1)
		elseif rand == 25 then
			self:GetOwner():SetNWInt("MedicineModPancreatitisexacerbatiosus", self:GetOwner():GetNWInt("MedicineModPancreatitisexacerbatiosus") - 1)
		elseif rand == 26 then
			self:GetOwner():SetNWInt("MedicineModPancreatitispara", self:GetOwner():GetNWInt("MedicineModPancreatitispara") - 1)
		elseif rand == 27 then
			self:GetOwner():SetNWInt("MedicineModPancreatitissepticus", self:GetOwner():GetNWInt("MedicineModPancreatitissepticus") - 1)
		elseif rand == 28 then
			self:GetOwner():SetNWInt("MedicineModPancreatitishaemorragicus", self:GetOwner():GetNWInt("MedicineModPancreatitishaemorragicus") - 1)
		elseif rand == 29 then
			self:GetOwner():SetNWInt("MedicineModPancreatitisinfiltratus", self:GetOwner():GetNWInt("MedicineModPancreatitisinfiltratus") - 1)
		elseif rand == 30 then
			self:GetOwner():SetNWInt("MedicineModPancreatitisautoimmunicus", self:GetOwner():GetNWInt("MedicineModPancreatitisautoimmunicus") - 1)
		elseif rand == 31 then
			self:GetOwner():SetNWInt("MedicineModSialoadenitis", self:GetOwner():GetNWInt("MedicineModSialoadenitis") - 1)
		elseif rand == 32 then
			self:GetOwner():SetNWInt("MedicineModdisfarginasa", self:GetOwner():GetNWInt("MedicineModdisfarginasa") - 1)
		elseif rand == 33 then
			self:GetOwner():SetNWInt("MedicineModdisffumarat", self:GetOwner():GetNWInt("MedicineModdisffumarat") - 1)
		elseif rand == 34 then
			self:GetOwner():SetNWInt("MedicineModdisforotocidyriae", self:GetOwner():GetNWInt("MedicineModdisforotocidyriae") - 1)
		elseif rand == 35 then
			self:GetOwner():SetNWInt("MedicineModpodagra", self:GetOwner():GetNWInt("MedicineModpodagra") - 1)
		elseif rand == 36 then
			self:GetOwner():SetNWInt("MedicineModhaerptonsilitis", self:GetOwner():GetNWInt("MedicineModhaerptonsilitis") - 1)
		elseif rand == 37 then
			self:GetOwner():SetNWInt("MedicineModcataralistonsillitis", self:GetOwner():GetNWInt("MedicineModcataralistonsillitis") - 1)
		elseif rand == 38 then
			self:GetOwner():SetNWInt("MedicineModlacunaristonsillitis", self:GetOwner():GetNWInt("MedicineModlacunaristonsillitis") - 1)
		elseif rand == 39 then
			self:GetOwner():SetNWInt("MedicineModparatonsillitis", self:GetOwner():GetNWInt("MedicineModparatonsillitis") - 1)
		elseif rand == 40 then
			self:GetOwner():SetNWInt("MedicineModfibrisustonsillitis", self:GetOwner():GetNWInt("MedicineModfibrisustonsillitis") - 1)
		elseif rand == 41 then
			self:GetOwner():SetNWInt("MedicineModfollicularistonsilitis", self:GetOwner():GetNWInt("MedicineModfollicularistonsilitis") - 1)
		elseif rand == 42 then
			self:GetOwner():SetNWInt("MedicineModsinusitis", self:GetOwner():GetNWInt("MedicineModsinusitis") - 1)
		elseif rand == 43 then
			self:GetOwner():SetNWInt("MedicineModnasovestibulit", self:GetOwner():GetNWInt("MedicineModnasovestibulit") - 1)
		elseif rand == 44 then
			self:GetOwner():SetNWInt("MedicineModdiffususbronchitis", self:GetOwner():GetNWInt("MedicineModdiffususbronchitis") - 1)
		elseif rand == 45 then
			self:GetOwner():SetNWInt("MedicineModperibronchitis", self:GetOwner():GetNWInt("MedicineModperibronchitis") - 1)
		elseif rand == 46 then
			self:GetOwner():SetNWInt("MedicineModoeosenophilistbronchitis", self:GetOwner():GetNWInt("MedicineModoeosenophilistbronchitis") - 1)
		elseif rand == 47 then
			self:GetOwner():SetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis", self:GetOwner():GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") - 1)
		elseif rand == 48 then
			self:GetOwner():SetNWInt("MedicineModfibrosusalveolitits", self:GetOwner():GetNWInt("MedicineModfibrosusalveolitits") - 1)
		elseif rand == 49 then
			self:GetOwner():SetNWInt("MedicineModdiffususnecroticusalveolitis", self:GetOwner():GetNWInt("MedicineModdiffususnecroticusalveolitis") - 1)
		elseif rand == 50 then
			self:GetOwner():SetNWInt("MedicineModeccsudatusplevritis", self:GetOwner():GetNWInt("MedicineModeccsudatusplevritis") - 1)
		elseif rand == 51 then
			self:GetOwner():SetNWInt("MedicineModfibrosusplevritis", self:GetOwner():GetNWInt("MedicineModfibrosusplevritis") - 1)
		elseif rand == 52 then
			self:GetOwner():SetNWInt("MedicineModhysticytosis", self:GetOwner():GetNWInt("MedicineModhysticytosis") - 1)
		elseif rand == 53 then
			self:GetOwner():SetNWInt("MedicineModmastocytosis", self:GetOwner():GetNWInt("MedicineModmastocytosis") - 1)
		elseif rand == 54 then
			self:GetOwner():SetNWInt("MedicineModessencialitistrombicitaemia", self:GetOwner():GetNWInt("MedicineModessencialitistrombicitaemia") - 1)
		elseif rand == 55 then
			self:GetOwner():SetNWInt("MedicineModcentralicatrombocitaemia", self:GetOwner():GetNWInt("MedicineModcentralicatrombocitaemia") - 1)
		elseif rand == 56 then
			self:GetOwner():SetNWInt("MedicineModlangergansishystiocytosis", self:GetOwner():GetNWInt("MedicineModlangergansishystiocytosis") - 1)
		elseif rand == 57 then
			self:GetOwner():SetNWInt("MedicineModsystemicpoliangiit", self:GetOwner():GetNWInt("MedicineModsystemicpoliangiit") - 1)
		elseif rand == 58 then
			self:GetOwner():SetNWInt("MedicineModnecroticperiarteriit", self:GetOwner():GetNWInt("MedicineModnecroticperiarteriit") - 1)
		elseif rand == 59 then
			self:GetOwner():SetNWInt("MedicineModrevmaticpoliangiit", self:GetOwner():GetNWInt("MedicineModrevmaticpoliangiit") - 1)
		elseif rand == 60 then
			self:GetOwner():SetNWInt("MedicineModnecroticpoliangiit", self:GetOwner():GetNWInt("MedicineModnecroticpoliangiit") - 1)
		elseif rand == 61 then
			self:GetOwner():SetNWInt("MedicineModglobulinaemicusflebidis", self:GetOwner():GetNWInt("MedicineModglobulinaemicusflebidis") - 1)
		elseif rand == 62 then
			self:GetOwner():SetNWInt("MedicineModgranulematosispoliflebitis", self:GetOwner():GetNWInt("MedicineModgranulematosispoliflebitis") - 1)
		elseif rand == 63 then
			self:GetOwner():SetNWInt("MedicineModcerebrovasculitis", self:GetOwner():GetNWInt("MedicineModcerebrovasculitis") - 1)
		elseif rand == 64 then
			self:GetOwner():SetNWInt("MedicineModacsonopaticpolinevritis", self:GetOwner():GetNWInt("MedicineModacsonopaticpolinevritis") - 1)
		elseif rand == 65 then
			self:GetOwner():SetNWInt("MedicineModdemieliticnevritis", self:GetOwner():GetNWInt("MedicineModdemieliticnevritis") - 1)
		elseif rand == 66 then
			self:GetOwner():SetNWInt("MedicineModdiffususpolinevritis", self:GetOwner():GetNWInt("MedicineModdiffususpolinevritis") - 1)
		elseif rand == 67 then
			self:GetOwner():SetNWInt("MedicineModrevmaticplexitis", self:GetOwner():GetNWInt("MedicineModrevmaticplexitis") - 1)
		elseif rand == 68 then
			self:GetOwner():SetNWInt("MedicineModexacerbatiosusradiculitis", self:GetOwner():GetNWInt("MedicineModexacerbatiosusradiculitis") - 1)
		elseif rand == 69 then
			self:GetOwner():SetNWInt("MedicineModencephalitis", self:GetOwner():GetNWInt("MedicineModencephalitis") - 1)
		elseif rand == 70 then
			self:GetOwner():SetNWInt("MedicineModserosusminengitis", self:GetOwner():GetNWInt("MedicineModserosusminengitis") - 1)
		elseif rand == 71 then
			self:GetOwner():SetNWInt("MedicineModprotozoaminengitis", self:GetOwner():GetNWInt("MedicineModprotozoaminengitis") - 1)
		elseif rand == 72 then
			self:GetOwner():SetNWInt("MedicineModspondilodiscitis", self:GetOwner():GetNWInt("MedicineModspondilodiscitis") - 1)
		elseif rand == 73 then
			self:GetOwner():SetNWInt("MedicineModpyogenicusmielitis", self:GetOwner():GetNWInt("MedicineModpyogenicusmielitis") - 1)
		elseif rand == 74 then
			self:GetOwner():SetNWInt("MedicineModeshemicusencephalopatia", self:GetOwner():GetNWInt("MedicineModeshemicusencephalopatia") - 1)
		elseif rand == 75 then
			self:GetOwner():SetNWInt("MedicineModgangliolitis", self:GetOwner():GetNWInt("MedicineModgangliolitis") - 1)
		elseif rand == 76 then
			self:GetOwner():SetNWInt("MedicineModosteomielit", self:GetOwner():GetNWInt("MedicineModosteomielit") - 1)
		elseif rand == 77 then
			self:GetOwner():SetNWInt("MedicineModpyonephrosum", self:GetOwner():GetNWInt("MedicineModpyonephrosum") - 1)
		elseif rand == 78 then
			self:GetOwner():SetNWInt("MedicineModneprosclerosis", self:GetOwner():GetNWInt("MedicineModneprosclerosis") - 1)
		elseif rand == 79 then
			self:GetOwner():SetNWInt("MedicineModglomerulonefritisfast", self:GetOwner():GetNWInt("MedicineModglomerulonefritisfast") - 1)
		elseif rand == 80 then
			self:GetOwner():SetNWInt("MedicineModdiffususglomerulonephritis", self:GetOwner():GetNWInt("MedicineModdiffususglomerulonephritis") - 1)
		elseif rand == 81 then
			self:GetOwner():SetNWInt("MedicineModuretritis", self:GetOwner():GetNWInt("MedicineModuretritis") - 1)
		elseif rand == 82 then
			self:GetOwner():SetNWInt("MedicineModcystitis", self:GetOwner():GetNWInt("MedicineModcystitis") - 1)
		elseif rand == 83 then
			self:GetOwner():SetNWInt("MedicineModacantomediasiskeratitis", self:GetOwner():GetNWInt("MedicineModacantomediasiskeratitis") - 1)
		elseif rand == 84 then
			self:GetOwner():SetNWInt("MedicineModophtalmoangiopathia", self:GetOwner():GetNWInt("MedicineModophtalmoangiopathia") - 1)
		elseif rand == 85 then
			self:GetOwner():SetNWInt("MedicineModconjunktivitis", self:GetOwner():GetNWInt("MedicineModconjunktivitis") - 1)
		elseif rand == 86 then
			self:GetOwner():SetNWInt("MedicineModdacryoadenitis", self:GetOwner():GetNWInt("MedicineModdacryoadenitis") - 1)
		elseif rand == 87 then
			self:GetOwner():SetNWInt("MedicineModiridocyclitis", self:GetOwner():GetNWInt("MedicineModiridocyclitis") - 1)
		elseif rand == 88 then
			self:GetOwner():SetNWInt("MedicineModkeratit", self:GetOwner():GetNWInt("MedicineModkeratit") - 1)
		elseif rand == 89 then
			self:GetOwner():SetNWInt("MedicineModxenophtalmia", self:GetOwner():GetNWInt("MedicineModxenophtalmia") - 1)
		elseif rand == 90 then
			self:GetOwner():SetNWInt("MedicineModinfiltratusopticusneuropathia", self:GetOwner():GetNWInt("MedicineModinfiltratusopticusneuropathia") - 1)
		elseif rand == 91 then
			self:GetOwner():SetNWInt("MedicineModpanaphtalmitis", self:GetOwner():GetNWInt("MedicineModpanaphtalmitis") - 1)
		elseif rand == 92 then
			self:GetOwner():SetNWInt("MedicineModretinitis", self:GetOwner():GetNWInt("MedicineModretinitis") - 1)
		elseif rand == 93 then
			self:GetOwner():SetNWInt("MedicineModinfiltratusscleritis", self:GetOwner():GetNWInt("MedicineModinfiltratusscleritis") - 1)
		elseif rand == 94 then
			self:GetOwner():SetNWInt("MedicineModuveitis", self:GetOwner():GetNWInt("MedicineModuveitis") - 1)
		elseif rand == 95 then
			self:GetOwner():SetNWInt("MedicineModendophtalmitis", self:GetOwner():GetNWInt("MedicineModendophtalmitis") - 1)
		elseif rand == 96 then
			self:GetOwner():SetNWInt("MedicineModepiscleritis", self:GetOwner():GetNWInt("MedicineModepiscleritis") - 1)
		elseif rand == 97 then
			self:GetOwner():SetNWInt("MedicineModmeibomitis", self:GetOwner():GetNWInt("MedicineModmeibomitis") - 1)
		elseif rand == 98 then
			self:GetOwner():SetNWInt("MedicineModblefaritis", self:GetOwner():GetNWInt("MedicineModblefaritis") - 1)
		elseif rand == 99 then
			self:GetOwner():SetNWInt("MedicineModneuromyotomia", self:GetOwner():GetNWInt("MedicineModneuromyotomia") - 1)
		elseif rand == 100 then
			self:GetOwner():SetNWInt("MedicineModdacryocystitis", self:GetOwner():GetNWInt("MedicineModdacryocystitis") - 1)
		elseif rand == 101 then
			self:GetOwner():SetNWInt("MedicineModotitisexterna", self:GetOwner():GetNWInt("MedicineModotitisexterna") - 1)
		elseif rand == 102 then
			self:GetOwner():SetNWInt("MedicineModotitismedialis", self:GetOwner():GetNWInt("MedicineModotitismedialis") - 1)
		elseif rand == 103 then
			self:GetOwner():SetNWInt("MedicineModololicvorea", self:GetOwner():GetNWInt("MedicineModololicvorea") - 1)
		elseif rand == 104 then
			self:GetOwner():SetNWInt("MedicineModotohaemotorea", self:GetOwner():GetNWInt("MedicineModotohaemotorea") - 1)
		elseif rand == 105 then
			self:GetOwner():SetNWInt("MedicineModotovestibulitis", self:GetOwner():GetNWInt("MedicineModotovestibulitis") - 1)
		end
		self:Remove()
    end)
end