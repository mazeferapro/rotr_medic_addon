SWEP.PrintName = "Disease of 100% of all"
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
function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 2)
	if (CLIENT) then return end
    timer.Simple(2, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		for k, v in ipairs(player.GetAll()) do
			local rand = math.random(1,105)
			if rand == 1 then
				v:SetNWInt("MedicineModRhinitus", v:GetNWInt("MedicineModRhinitus") - 1)
			elseif rand == 2 then
				v:SetNWInt("MedicineModVirusPneumonitis", v:GetNWInt("MedicineModVirusPneumonitis") - 1)
			elseif rand == 3 then
				v:SetNWInt("MedicineModPharingitis", v:GetNWInt("MedicineModPharingitis") - 1)
			elseif rand == 4 then
				v:SetNWInt("MedicineModEustahiitis", v:GetNWInt("MedicineModEustahiitis") - 1)
			elseif rand == 5 then
				v:SetNWInt("MedicineModAngiotensinicusHypertensia", v:GetNWInt("MedicineModAngiotensinicusHypertensia") - 1)
			elseif rand == 6 then
				v:SetNWInt("MedicineModVasopressicusHypertensia", v:GetNWInt("MedicineModVasopressicusHypertensia") - 1)
			elseif rand == 7 then
				v:SetNWInt("MedicineModHepatitisA", v:GetNWInt("MedicineModHepatitisA") - 1)
			elseif rand == 8 then
				v:SetNWInt("MedicineModPyelonephritisLocalInfiltratus", v:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") - 1)
			elseif rand == 9 then
				v:SetNWInt("MedicineModPyelonephritisDiffususInfiltratus", v:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") - 1)
			elseif rand == 10 then
				v:SetNWInt("MedicineModPyelonephritisMesenhimicus", v:GetNWInt("MedicineModPyelonephritisMesenhimicus") - 1)
			elseif rand == 11 then
				v:SetNWInt("MedicineModbacstenosisclapmitralis", v:GetNWInt("MedicineModbacstenosisclapmitralis") - 1)
			elseif rand == 12 then
				v:SetNWInt("MedicineModavblock", v:GetNWInt("MedicineModavblock") - 1)
			elseif rand == 13 then
				v:SetNWInt("MedicineModfungendocarditis", v:GetNWInt("MedicineModfungendocarditis") - 1)
			elseif rand == 14 then
				v:SetNWInt("MedicineModmegaloblasticanemia", v:GetNWInt("MedicineModmegaloblasticanemia") - 1)
			elseif rand == 15 then
				v:SetNWInt("MedicineModhaemoliticanemia", v:GetNWInt("MedicineModhaemoliticanemia") - 1)
			elseif rand == 16 then
				v:SetNWInt("MedicineModdishaemopoeticanemia", v:GetNWInt("MedicineModdishaemopoeticanemia") - 1)
			elseif rand == 17 then
				v:SetNWInt("MedicineModOsephagitis", v:GetNWInt("MedicineModOsephagitis") - 1)
			elseif rand == 18 then
				v:SetNWInt("MedicineModGastritis", v:GetNWInt("MedicineModGastritis") - 1)
			elseif rand == 19 then
				v:SetNWInt("MedicineModDyodenitis", v:GetNWInt("MedicineModDyodenitis") - 1)
			elseif rand == 20 then
				v:SetNWInt("MedicineModEunitis", v:GetNWInt("MedicineModEunitis") - 1)
			elseif rand == 21 then
				v:SetNWInt("MedicineModIelitis", v:GetNWInt("MedicineModIelitis") - 1)
			elseif rand == 22 then
				v:SetNWInt("MedicineModColitis", v:GetNWInt("MedicineModColitis") - 1)
			elseif rand == 23 then
				v:SetNWInt("MedicineModSigmoiditis", v:GetNWInt("MedicineModSigmoiditis") - 1)
			elseif rand == 24 then
				v:SetNWInt("MedicineModProctitis", v:GetNWInt("MedicineModProctitis") - 1)
			elseif rand == 25 then
				v:SetNWInt("MedicineModPancreatitisexacerbatiosus", v:GetNWInt("MedicineModPancreatitisexacerbatiosus") - 1)
			elseif rand == 26 then
				v:SetNWInt("MedicineModPancreatitispara", v:GetNWInt("MedicineModPancreatitispara") - 1)
			elseif rand == 27 then
				v:SetNWInt("MedicineModPancreatitissepticus", v:GetNWInt("MedicineModPancreatitissepticus") - 1)
			elseif rand == 28 then
				v:SetNWInt("MedicineModPancreatitishaemorragicus", v:GetNWInt("MedicineModPancreatitishaemorragicus") - 1)
			elseif rand == 29 then
				v:SetNWInt("MedicineModPancreatitisinfiltratus", v:GetNWInt("MedicineModPancreatitisinfiltratus") - 1)
			elseif rand == 30 then
				v:SetNWInt("MedicineModPancreatitisautoimmunicus", v:GetNWInt("MedicineModPancreatitisautoimmunicus") - 1)
			elseif rand == 31 then
				v:SetNWInt("MedicineModSialoadenitis", v:GetNWInt("MedicineModSialoadenitis") - 1)
			elseif rand == 32 then
				v:SetNWInt("MedicineModdisfarginasa", v:GetNWInt("MedicineModdisfarginasa") - 1)
			elseif rand == 33 then
				v:SetNWInt("MedicineModdisffumarat", v:GetNWInt("MedicineModdisffumarat") - 1)
			elseif rand == 34 then
				v:SetNWInt("MedicineModdisforotocidyriae", v:GetNWInt("MedicineModdisforotocidyriae") - 1)
			elseif rand == 35 then
				v:SetNWInt("MedicineModpodagra", v:GetNWInt("MedicineModpodagra") - 1)
			elseif rand == 36 then
				v:SetNWInt("MedicineModhaerptonsilitis", v:GetNWInt("MedicineModhaerptonsilitis") - 1)
			elseif rand == 37 then
				v:SetNWInt("MedicineModcataralistonsillitis", v:GetNWInt("MedicineModcataralistonsillitis") - 1)
			elseif rand == 38 then
				v:SetNWInt("MedicineModlacunaristonsillitis", v:GetNWInt("MedicineModlacunaristonsillitis") - 1)
			elseif rand == 39 then
				v:SetNWInt("MedicineModparatonsillitis", v:GetNWInt("MedicineModparatonsillitis") - 1)
			elseif rand == 40 then
				v:SetNWInt("MedicineModfibrisustonsillitis", v:GetNWInt("MedicineModfibrisustonsillitis") - 1)
			elseif rand == 41 then
				v:SetNWInt("MedicineModfollicularistonsilitis", v:GetNWInt("MedicineModfollicularistonsilitis") - 1)
			elseif rand == 42 then
				v:SetNWInt("MedicineModsinusitis", v:GetNWInt("MedicineModsinusitis") - 1)
			elseif rand == 43 then
				v:SetNWInt("MedicineModnasovestibulit", v:GetNWInt("MedicineModnasovestibulit") - 1)
			elseif rand == 44 then
				v:SetNWInt("MedicineModdiffususbronchitis", v:GetNWInt("MedicineModdiffususbronchitis") - 1)
			elseif rand == 45 then
				v:SetNWInt("MedicineModperibronchitis", v:GetNWInt("MedicineModperibronchitis") - 1)
			elseif rand == 46 then
				v:SetNWInt("MedicineModoeosenophilistbronchitis", v:GetNWInt("MedicineModoeosenophilistbronchitis") - 1)
			elseif rand == 47 then
				v:SetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis", v:GetNWInt("MedicineModpyoobstructofibrosclerosusbronchitis") - 1)
			elseif rand == 48 then
				v:SetNWInt("MedicineModfibrosusalveolitits", v:GetNWInt("MedicineModfibrosusalveolitits") - 1)
			elseif rand == 49 then
				v:SetNWInt("MedicineModdiffususnecroticusalveolitis", v:GetNWInt("MedicineModdiffususnecroticusalveolitis") - 1)
			elseif rand == 50 then
				v:SetNWInt("MedicineModeccsudatusplevritis", v:GetNWInt("MedicineModeccsudatusplevritis") - 1)
			elseif rand == 51 then
				v:SetNWInt("MedicineModfibrosusplevritis", v:GetNWInt("MedicineModfibrosusplevritis") - 1)
			elseif rand == 52 then
				v:SetNWInt("MedicineModhysticytosis", v:GetNWInt("MedicineModhysticytosis") - 1)
			elseif rand == 53 then
				v:SetNWInt("MedicineModmastocytosis", v:GetNWInt("MedicineModmastocytosis") - 1)
			elseif rand == 54 then
				v:SetNWInt("MedicineModessencialitistrombicitaemia", v:GetNWInt("MedicineModessencialitistrombicitaemia") - 1)
			elseif rand == 55 then
				v:SetNWInt("MedicineModcentralicatrombocitaemia", v:GetNWInt("MedicineModcentralicatrombocitaemia") - 1)
			elseif rand == 56 then
				v:SetNWInt("MedicineModlangergansishystiocytosis", v:GetNWInt("MedicineModlangergansishystiocytosis") - 1)
			elseif rand == 57 then
				v:SetNWInt("MedicineModsystemicpoliangiit", v:GetNWInt("MedicineModsystemicpoliangiit") - 1)
			elseif rand == 58 then
				v:SetNWInt("MedicineModnecroticperiarteriit", v:GetNWInt("MedicineModnecroticperiarteriit") - 1)
			elseif rand == 59 then
				v:SetNWInt("MedicineModrevmaticpoliangiit", v:GetNWInt("MedicineModrevmaticpoliangiit") - 1)
			elseif rand == 60 then
				v:SetNWInt("MedicineModnecroticpoliangiit", v:GetNWInt("MedicineModnecroticpoliangiit") - 1)
			elseif rand == 61 then
				v:SetNWInt("MedicineModglobulinaemicusflebidis", v:GetNWInt("MedicineModglobulinaemicusflebidis") - 1)
			elseif rand == 62 then
				v:SetNWInt("MedicineModgranulematosispoliflebitis", v:GetNWInt("MedicineModgranulematosispoliflebitis") - 1)
			elseif rand == 63 then
				v:SetNWInt("MedicineModcerebrovasculitis", v:GetNWInt("MedicineModcerebrovasculitis") - 1)
			elseif rand == 64 then
				v:SetNWInt("MedicineModacsonopaticpolinevritis", v:GetNWInt("MedicineModacsonopaticpolinevritis") - 1)
			elseif rand == 65 then
				v:SetNWInt("MedicineModdemieliticnevritis", v:GetNWInt("MedicineModdemieliticnevritis") - 1)
			elseif rand == 66 then
				v:SetNWInt("MedicineModdiffususpolinevritis", v:GetNWInt("MedicineModdiffususpolinevritis") - 1)
			elseif rand == 67 then
				v:SetNWInt("MedicineModrevmaticplexitis", v:GetNWInt("MedicineModrevmaticplexitis") - 1)
			elseif rand == 68 then
				v:SetNWInt("MedicineModexacerbatiosusradiculitis", v:GetNWInt("MedicineModexacerbatiosusradiculitis") - 1)
			elseif rand == 69 then
				v:SetNWInt("MedicineModencephalitis", v:GetNWInt("MedicineModencephalitis") - 1)
			elseif rand == 70 then
				v:SetNWInt("MedicineModserosusminengitis", v:GetNWInt("MedicineModserosusminengitis") - 1)
			elseif rand == 71 then
				v:SetNWInt("MedicineModprotozoaminengitis", v:GetNWInt("MedicineModprotozoaminengitis") - 1)
			elseif rand == 72 then
				v:SetNWInt("MedicineModspondilodiscitis", v:GetNWInt("MedicineModspondilodiscitis") - 1)
			elseif rand == 73 then
				v:SetNWInt("MedicineModpyogenicusmielitis", v:GetNWInt("MedicineModpyogenicusmielitis") - 1)
			elseif rand == 74 then
				v:SetNWInt("MedicineModeshemicusencephalopatia", v:GetNWInt("MedicineModeshemicusencephalopatia") - 1)
			elseif rand == 75 then
				v:SetNWInt("MedicineModgangliolitis", v:GetNWInt("MedicineModgangliolitis") - 1)
			elseif rand == 76 then
				v:SetNWInt("MedicineModosteomielit", v:GetNWInt("MedicineModosteomielit") - 1)
			elseif rand == 77 then
				v:SetNWInt("MedicineModpyonephrosum", v:GetNWInt("MedicineModpyonephrosum") - 1)
			elseif rand == 78 then
				v:SetNWInt("MedicineModneprosclerosis", v:GetNWInt("MedicineModneprosclerosis") - 1)
			elseif rand == 79 then
				v:SetNWInt("MedicineModglomerulonefritisfast", v:GetNWInt("MedicineModglomerulonefritisfast") - 1)
			elseif rand == 80 then
				v:SetNWInt("MedicineModdiffususglomerulonephritis", v:GetNWInt("MedicineModdiffususglomerulonephritis") - 1)
			elseif rand == 81 then
				v:SetNWInt("MedicineModuretritis", v:GetNWInt("MedicineModuretritis") - 1)
			elseif rand == 82 then
				v:SetNWInt("MedicineModcystitis", v:GetNWInt("MedicineModcystitis") - 1)
			elseif rand == 83 then
				v:SetNWInt("MedicineModacantomediasiskeratitis", v:GetNWInt("MedicineModacantomediasiskeratitis") - 1)
			elseif rand == 84 then
				v:SetNWInt("MedicineModophtalmoangiopathia", v:GetNWInt("MedicineModophtalmoangiopathia") - 1)
			elseif rand == 85 then
				v:SetNWInt("MedicineModconjunktivitis", v:GetNWInt("MedicineModconjunktivitis") - 1)
			elseif rand == 86 then
				v:SetNWInt("MedicineModdacryoadenitis", v:GetNWInt("MedicineModdacryoadenitis") - 1)
			elseif rand == 87 then
				v:SetNWInt("MedicineModiridocyclitis", v:GetNWInt("MedicineModiridocyclitis") - 1)
			elseif rand == 88 then
				v:SetNWInt("MedicineModkeratit", v:GetNWInt("MedicineModkeratit") - 1)
			elseif rand == 89 then
				v:SetNWInt("MedicineModxenophtalmia", v:GetNWInt("MedicineModxenophtalmia") - 1)
			elseif rand == 90 then
				v:SetNWInt("MedicineModinfiltratusopticusneuropathia", v:GetNWInt("MedicineModinfiltratusopticusneuropathia") - 1)
			elseif rand == 91 then
				v:SetNWInt("MedicineModpanaphtalmitis", v:GetNWInt("MedicineModpanaphtalmitis") - 1)
			elseif rand == 92 then
				v:SetNWInt("MedicineModretinitis", v:GetNWInt("MedicineModretinitis") - 1)
			elseif rand == 93 then
				v:SetNWInt("MedicineModinfiltratusscleritis", v:GetNWInt("MedicineModinfiltratusscleritis") - 1)
			elseif rand == 94 then
				v:SetNWInt("MedicineModuveitis", v:GetNWInt("MedicineModuveitis") - 1)
			elseif rand == 95 then
				v:SetNWInt("MedicineModendophtalmitis", v:GetNWInt("MedicineModendophtalmitis") - 1)
			elseif rand == 96 then
				v:SetNWInt("MedicineModepiscleritis", v:GetNWInt("MedicineModepiscleritis") - 1)
			elseif rand == 97 then
				v:SetNWInt("MedicineModmeibomitis", v:GetNWInt("MedicineModmeibomitis") - 1)
			elseif rand == 98 then
				v:SetNWInt("MedicineModblefaritis", v:GetNWInt("MedicineModblefaritis") - 1)
			elseif rand == 99 then
				v:SetNWInt("MedicineModneuromyotomia", v:GetNWInt("MedicineModneuromyotomia") - 1)
			elseif rand == 100 then
				v:SetNWInt("MedicineModdacryocystitis", v:GetNWInt("MedicineModdacryocystitis") - 1)
			elseif rand == 101 then
				v:SetNWInt("MedicineModotitisexterna", v:GetNWInt("MedicineModotitisexterna") - 1)
			elseif rand == 102 then
				v:SetNWInt("MedicineModotitismedialis", v:GetNWInt("MedicineModotitismedialis") - 1)
			elseif rand == 103 then
				v:SetNWInt("MedicineModololicvorea", v:GetNWInt("MedicineModololicvorea") - 1)
			elseif rand == 104 then
				v:SetNWInt("MedicineModotohaemotorea", v:GetNWInt("MedicineModotohaemotorea") - 1)
			elseif rand == 105 then
				v:SetNWInt("MedicineModotovestibulitis", v:GetNWInt("MedicineModotovestibulitis") - 1)
			end
			self:Remove()
		end
    end)
end
