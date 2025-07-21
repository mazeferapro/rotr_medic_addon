SWEP.PrintName = "General inspection"
SWEP.Category = "[Medic Addon] - Diagnostic"
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
    self:SetNextPrimaryFire(CurTime() + 5)
    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then return end
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambient/materials/bump1.wav")
		self:EmitSound("ambient/materials/dinnerplates3.wav")
		if ent:GetNWInt("MedicineModRhinitus") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Mucousdischargefromthenose } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModsinusitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Purulentnasaldischarge } chat.AddText(unpack(tab))")
		elseif ent:GetNWInt("MedicineModnasovestibulit") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Bloodymucusdischargefromthenose] } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModAngiotensinicusHypertensia") < 100 or ent:GetNWInt("MedicineModVasopressicusHypertensia") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Rednessofthechestandneck } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModspondilodiscitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Decreasedspinalmobility } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModHepatitisA") < 100 or ent:GetNWInt("MedicineModIntoxication") > 50 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintherighthypochondrium } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModGastritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheepigastriumandlefthypochondrium } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModDyodenitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheepigastriumandrighthypochondrium } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModEunitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthelefthypochondriumandumbilicalregion } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModIelitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintherightiliacregionandperiumbilicalregion } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModColitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthesubcostalandiliacregions } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModSigmoiditis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheleftiliacregion } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModProctitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheanus } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModPancreatitisexacerbatiosus") < 100 or ent:GetNWInt("MedicineModPancreatitispara") < 100 or ent:GetNWInt("MedicineModPancreatitissepticus") < 100 
		or ent:GetNWInt("MedicineModPancreatitishaemorragicus") < 100 or ent:GetNWInt("MedicineModPancreatitisinfiltratus") < 100 or ent:GetNWInt("MedicineModPancreatitisautoimmunicus") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthelefthypochondrium } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModHepatitisA") < 100 or ent:GetNWInt("MedicineModIntoxication") > 50 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Yellownessoftheskinandscleraoftheeyes } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModfungendocarditis") != 100 or ent:GetNWInt( "MedicineModmegaloblasticanemia") != 100 or ent:GetNWInt( "MedicineModhaemoliticanemia") != 100 
		or ent:GetNWInt( "MedicineModdishaemopoeticanemia") != 100 or ent:GetNWInt( "MedicineModdisforotocidyriae") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Bluenessoftheskin } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModhaerptonsilitis") != 100 or ent:GetNWInt( "MedicineModcataralistonsillitis") != 100 or ent:GetNWInt( "MedicineModlacunaristonsillitis") != 100
		or ent:GetNWInt( "MedicineModparatonsillitis") != 100 or ent:GetNWInt( "MedicineModfollicularistonsilitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Sorenessofthesuperficiallymphnodesoftheneck } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModhaerptonsilitis") != 100 or ent:GetNWInt( "MedicineModlacunaristonsillitis") != 100
		or ent:GetNWInt( "MedicineModparatonsillitis") != 100 or ent:GetNWInt( "MedicineModfollicularistonsilitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthedeeplymphnodesoftheneck } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModhysticytosis") != 100 or ent:GetNWInt( "MedicineModmastocytosis") != 100
		or ent:GetNWInt( "MedicineModessencialitistrombicitaemia") != 100 or ent:GetNWInt( "MedicineModcentralicatrombocitaemia") != 100 
		or ent:GetNWInt( "MedicineModlangergansishystiocytosis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Skinhematomas } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModsystemicpoliangiit") != 100 or ent:GetNWInt( "MedicineModrevmaticpoliangiit") != 100
		or ent:GetNWInt( "MedicineModnecroticpoliangiit") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplehemorrhagesundertheskin } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModnecroticperiarteriit") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplehemorrhagesundertheskinandswellingoftheskin } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt( "MedicineModglobulinaemicusflebidis") != 100 or ent:GetNWInt( "MedicineModgranulematosispoliflebitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplesubcutaneousinfiltratesaroundtheveins } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") < 100 or ent:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") < 100 or ent:GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 
		or ent:GetNWInt("MedicineModpyonephrosum") < 100 or ent:GetNWInt("MedicineModneprosclerosis") < 100 or ent:GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Muscletoneinthelowerback } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModpodagra") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Jointpain } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModdisfarginasa") < 100 or ent:GetNWInt("MedicineModdisffumarat") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Severemuscleweakness } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModpyonephrosum") < 100 or ent:GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paleskin } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModPyelonephritisLocalInfiltratus") < 100 or ent:GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") < 100 or ent:GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 
		or ent:GetNWInt("MedicineModbacstenosisclapmitralis") < 100 or ent:GetNWInt("MedicineModpyonephrosum") < 100 or ent:GetNWInt("MedicineModglomerulonefritisfast") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Facialswelling } chat.AddText(unpack(tab))")
		end

		if ent:GetNWInt("SurgeryModRaptureAorta") != 0 or ent:GetNWInt("SurgeryModRaptureSpleen") != 0 or ent:GetNWInt("SurgeryModRaptureLiver") != 0 or ent:GetNWInt("SurgeryModRaptureKidney") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Fluidintheabdominalcavity } chat.AddText(unpack(tab))")
		end

		if ent:GetNWInt("MedicineModacutarm") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Handcut } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModacutcostae") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Chestcut } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModacutlegs") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Legcut } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModacuthead") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Headcut } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModacutstomach") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Abdomencut } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModacutpenis") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Perinealcut } chat.AddText(unpack(tab))")
		end
		
		if ent:GetNWInt("MedicineModinjuryarm") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Handbruise } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModinjurycostae") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Chestinjury } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModinjurylegs") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Leginjury } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModinjuryhead") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Headinjury } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModinjurystomach") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Abdomeninjury } chat.AddText(unpack(tab))")
		end
		if ent:GetNWInt("MedicineModinjurypenis") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Perinealinjury } chat.AddText(unpack(tab))")
		end

		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedageneralinspection } chat.AddText(unpack(tab))")
    end)
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 5)
	if (CLIENT) then return end
    timer.Simple(5, function()
		self:EmitSound("ambiself:GetOwner()/materials/bump1.wav")
		self:EmitSound("ambiself:GetOwner()/materials/dinnerplates3.wav")
		if self:GetOwner():GetNWInt("MedicineModRhinitus") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Mucousdischargefromthenose } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModsinusitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Purulself:GetOwner()nasaldischarge } chat.AddText(unpack(tab))")
		elseif self:GetOwner():GetNWInt("MedicineModnasovestibulit") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Bloodymucusdischargefromthenose] } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModAngiotensinicusHypertensia") < 100 or self:GetOwner():GetNWInt("MedicineModVasopressicusHypertensia") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Rednessofthechestandneck } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModspondilodiscitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Decreasedspinalmobility } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModHepatitisA") < 100 or self:GetOwner():GetNWInt("MedicineModIntoxication") > 50 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintherighthypochondrium } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModGastritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheepigastriumandlefthypochondrium } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModDyodenitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheepigastriumandrighthypochondrium } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModEunitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthelefthypochondriumandumbilicalregion } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModIelitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintherightiliacregionandperiumbilicalregion } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModColitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthesubcostalandiliacregions } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModSigmoiditis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheleftiliacregion } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModProctitis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Painintheanus } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModPancreatitisexacerbatiosus") < 100 or self:GetOwner():GetNWInt("MedicineModPancreatitispara") < 100 or self:GetOwner():GetNWInt("MedicineModPancreatitissepticus") < 100 
		or self:GetOwner():GetNWInt("MedicineModPancreatitishaemorragicus") < 100 or self:GetOwner():GetNWInt("MedicineModPancreatitisinfiltratus") < 100 or self:GetOwner():GetNWInt("MedicineModPancreatitisautoimmunicus") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthelefthypochondrium } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModHepatitisA") < 100 or self:GetOwner():GetNWInt("MedicineModIntoxication") > 50 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Yellownessoftheskinandscleraoftheeyes } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModfungendocarditis") != 100 or self:GetOwner():GetNWInt( "MedicineModmegaloblasticanemia") != 100 or self:GetOwner():GetNWInt( "MedicineModhaemoliticanemia") != 100 
		or self:GetOwner():GetNWInt( "MedicineModdishaemopoeticanemia") != 100 or self:GetOwner():GetNWInt( "MedicineModdisforotocidyriae") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Bluenessoftheskin } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModhaerptonsilitis") != 100 or self:GetOwner():GetNWInt( "MedicineModcataralistonsillitis") != 100 or self:GetOwner():GetNWInt( "MedicineModlacunaristonsillitis") != 100
		or self:GetOwner():GetNWInt( "MedicineModparatonsillitis") != 100 or self:GetOwner():GetNWInt( "MedicineModfollicularistonsilitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Sorenessofthesuperficiallymphnodesoftheneck } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModhaerptonsilitis") != 100 or self:GetOwner():GetNWInt( "MedicineModlacunaristonsillitis") != 100
		or self:GetOwner():GetNWInt( "MedicineModparatonsillitis") != 100 or self:GetOwner():GetNWInt( "MedicineModfollicularistonsilitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paininthedeeplymphnodesoftheneck } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModhysticytosis") != 100 or self:GetOwner():GetNWInt( "MedicineModmastocytosis") != 100
		or self:GetOwner():GetNWInt( "MedicineModessencialitistrombicitaemia") != 100 or self:GetOwner():GetNWInt( "MedicineModcentralicatrombocitaemia") != 100 
		or self:GetOwner():GetNWInt( "MedicineModlangergansishystiocytosis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Skinhematomas } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModsystemicpoliangiit") != 100 or self:GetOwner():GetNWInt( "MedicineModrevmaticpoliangiit") != 100
		or self:GetOwner():GetNWInt( "MedicineModnecroticpoliangiit") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplehemorrhagesundertheskin } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModnecroticperiarteriit") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplehemorrhagesundertheskinandswellingoftheskin } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt( "MedicineModglobulinaemicusflebidis") != 100 or self:GetOwner():GetNWInt( "MedicineModgranulematosispoliflebitis") != 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Multiplesubcutaneousinfiltratesaroundtheveins } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModPyelonephritisLocalInfiltratus") < 100 or self:GetOwner():GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") < 100 or self:GetOwner():GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 
		or self:GetOwner():GetNWInt("MedicineModpyonephrosum") < 100 or self:GetOwner():GetNWInt("MedicineModneprosclerosis") < 100 or self:GetOwner():GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Muscletoneinthelowerback } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModpodagra") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Jointpain } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModdisfarginasa") < 100 or self:GetOwner():GetNWInt("MedicineModdisffumarat") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Severemuscleweakness } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModpyonephrosum") < 100 or self:GetOwner():GetNWInt("MedicineModdiffususglomerulonephritis") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Paleskin } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModPyelonephritisLocalInfiltratus") < 100 or self:GetOwner():GetNWInt("MedicineModPyelonephritisDiffususInfiltratus") < 100 or self:GetOwner():GetNWInt("MedicineModPyelonephritisMesenhimicus") < 100 
		or self:GetOwner():GetNWInt("MedicineModbacstenosisclapmitralis") < 100 or self:GetOwner():GetNWInt("MedicineModpyonephrosum") < 100 or self:GetOwner():GetNWInt("MedicineModglomerulonefritisfast") < 100 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Facialswelling } chat.AddText(unpack(tab))")
		end

		if self:GetOwner():GetNWInt("SurgeryModRaptureAorta") != 0 or self:GetOwner():GetNWInt("SurgeryModRaptureSpleen") != 0 or self:GetOwner():GetNWInt("SurgeryModRaptureLiver") != 0 or self:GetOwner():GetNWInt("SurgeryModRaptureKidney") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 170), TranslationMedicMod.Fluidintheabdominalcavity } chat.AddText(unpack(tab))")
		end

		if self:GetOwner():GetNWInt("MedicineModacutarm") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Handcut } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModacutcostae") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Chestcut } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModacutlegs") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Legcut } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModacuthead") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Headcut } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModacutstomach") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Abdomencut } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModacutpenis") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Perinealcut } chat.AddText(unpack(tab))")
		end
		
		if self:GetOwner():GetNWInt("MedicineModinjuryarm") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Handbruise } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModinjurycostae") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Chestinjury } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModinjurylegs") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Leginjury } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModinjuryhead") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Headinjury } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModinjurystomach") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Abdomeninjury } chat.AddText(unpack(tab))")
		end
		if self:GetOwner():GetNWInt("MedicineModinjurypenis") != 0 then
			self:GetOwner():SendLua("local tab = {Color(170, 170, 0), TranslationMedicMod.Perinealinjury } chat.AddText(unpack(tab))")
		end

		self:GetOwner():SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavecompletedageneralinspection } chat.AddText(unpack(tab))")
    end)
end