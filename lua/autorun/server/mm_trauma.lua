AddCSLuaFile()

Medicinemodplus = {}
Medicinemodplus.EntTable = {}

HITGROUP_NUTS = 98
HITGROUP_HAND = 99

function Medicinemodplus.Damage(ply,hitgroup,dmginfo)
	if (ConVarExists("sandboxteams_npcdamage") and ply:Team() != 1 ) then return end
	local dmgpos = dmginfo:GetDamagePosition()

	local PelvisIndx = ply:LookupBone("ValveBiped.Bip01_Pelvis")
	if (PelvisIndx == nil) then return dmginfo end
	local PelvisPos = ply:GetBonePosition( PelvisIndx )
	local NutsDistance = dmgpos:Distance(PelvisPos)

	local LHandIndex = ply:LookupBone("ValveBiped.Bip01_L_Hand")
	local LHandPos = ply:GetBonePosition( LHandIndex )
	local LHandDistance = dmgpos:Distance(LHandPos)

	local RHandIndex = ply:LookupBone("ValveBiped.Bip01_R_Hand")
	local RHandPos = ply:GetBonePosition(RHandIndex)
	local RHandDistance = dmgpos:Distance(RHandPos)
		
	if dmginfo:IsDamageType(DMG_BLAST) then
		if ServerMedicMod.EnableContusion == true then
			ply:SendLua("local tab = {Color(130, 130, 0), TranslationMedicMod.Yougotconcussed } chat.AddText(unpack(tab))")
			ply:SetNWInt("MedicineModcontusion", ply:GetNWInt("MedicineModcontusion") - 1)
		end
	end

	if (NutsDistance <= 7 && NutsDistance >= 5) then
		hitgroup = HITGROUP_NUTS
	elseif (LHandDistance < 6 || RHandDistance < 6 ) then
		hitgroup = HITGROUP_HAND
	end

	if (hitgroup == HITGROUP_HEAD) then
		dmginfo:ScaleDamage(4)
		if ServerMedicMod.EnableTraum == true then
			ply:SetNWInt("MedicineModHealthHead", ply:GetNWInt("MedicineModHealthHead")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumahead", 1)
				if math.random(1,2) == 1 then
					ply:SetNWInt("MedicineModbleedingarterial", 1)
				else
					ply:SetNWInt("MedicineModbleedingvenae", 1)
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjuryhead", 1)
			else
				ply:SetNWInt("MedicineModacuthead", 1)
				if math.random(1,2) == 1 then
					ply:SetNWInt("MedicineModbleedingarterial", 1)
				else
					ply:SetNWInt("MedicineModbleedingvenae", 1)
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif (hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM) then
		if ServerMedicMod.EnableTraum == true then
			dmginfo:ScaleDamage(0.5)
			ply:SetNWInt("MedicineModHealthArm", ply:GetNWInt("MedicineModHealthArm")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumaarm", 1)
				if math.random(1,2) == 1 then
					ply:SetNWInt("MedicineModbleedingarterial", 1)
				else
					ply:SetNWInt("MedicineModbleedingvenae", 1)
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjuryarm", 1)
			else
				ply:SetNWInt("MedicineModacutarm", 1)
				if math.random(1,2) == 1 then
					ply:SetNWInt("MedicineModbleedingarterial", 1)
				else
					ply:SetNWInt("MedicineModbleedingvenae", 1)
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif (hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG) then
		if ServerMedicMod.EnableTraum == true then
			dmginfo:ScaleDamage(0.5)
			ply:SetNWInt("MedicineModHealthLeg", ply:GetNWInt("MedicineModHealthLeg")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumalegs", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjurylegs", 1)
			else
				ply:SetNWInt("MedicineModacutlegs", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif (hitgroup == HITGROUP_CHEST) then
		if ServerMedicMod.EnableInteralTraum == true then
			local rand1 = math.random(1,2)
			if rand1 == 1 then
				local rand2 = math.random(1,100)
				local rand3 = math.random(1,100)
				if rand2 <= 50 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureLung",1)
					else
						ply:SetNWInt("SurgeryModHematomaLung",1)
					end
				elseif rand2 <= 100 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureHeart",1)
					else
						ply:SetNWInt("SurgeryModHematomaHeart",1)
					end
				end
			end
		end
		if ServerMedicMod.EnableTraum == true then
			dmginfo:ScaleDamage(2)
			ply:SetNWInt("MedicineModHealthChest", ply:GetNWInt("MedicineModHealthChest")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumacostae", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjurycostae", 1)
			else
				ply:SetNWInt("MedicineModacutcostae", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif (hitgroup == HITGROUP_STOMACH) then
		if ServerMedicMod.EnableInteralTraum == true then
			local rand1 = math.random(1,3)
			if rand1 == 1 then
				local rand2 = math.random(1,100)
				local rand3 = math.random(1,100)
				if rand2 <= 25 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureKidney",1)
					else
						ply:SetNWInt("SurgeryModHematomaKidney",1)
					end
				elseif rand2 <= 50 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureLiver",1)
					else
						ply:SetNWInt("SurgeryModHematomaLiver",1)
					end
				elseif rand2 <= 75 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureSpleen",1)
					else
						ply:SetNWInt("SurgeryModHematomaSpleen",1)
					end
				elseif rand2 <= 100 then
					if rand3 > 50 then
						ply:SetNWInt("SurgeryModRaptureAorta",1)
					else
						ply:SetNWInt("SurgeryModHematomaAorta",1)
					end
				end
			end
		end
		if ServerMedicMod.EnableTraum == true then
			dmginfo:ScaleDamage(0.75)
			ply:SetNWInt("MedicineModHealthStomach", ply:GetNWInt("MedicineModHealthStomach")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumastomach", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
				elseif rand == 2 then
				ply:SetNWInt("MedicineModinjurystomach", 1)
			else
				ply:SetNWInt("MedicineModacutstomach", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif (hitgroup == HITGROUP_NUTS) then
		if ServerMedicMod.EnableTraum == true then
			dmginfo:ScaleDamage(0.75)
			ply:SetNWInt("MedicineModHealthStomach", ply:GetNWInt("MedicineModHealthStomach")-25)
			local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumapenis", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjurypenis", 1)
			else
				ply:SetNWInt("MedicineModacutpenis", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	elseif(hitgroup == HITGROUP_HAND) then
	if ServerMedicMod.EnableTraum == true then
		dmginfo:ScaleDamage(0.4)
		ply:SetNWInt("MedicineModHealthArm", ply:GetNWInt("MedicineModHealthArm")-25)
		local rand = math.random(1,3)
			if rand == 1 then
				ply:SetNWInt("MedicineModtraumaarm", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("npc/barnacle/neck_snap1.wav")
			elseif rand == 2 then
				ply:SetNWInt("MedicineModinjuryarm", 1)
			else
				ply:SetNWInt("MedicineModacutarm", 1)
				if ServerMedicMod.EnableBleeding == true then
					if math.random(1,2) == 1 then
						ply:SetNWInt("MedicineModbleedingarterial", 1)
					else
						ply:SetNWInt("MedicineModbleedingvenae", 1)
					end
				end
				ply:EmitSound("physics/body/body_medium_impact_hard2.wav")
			end
		end
	end
end

function Medicinemodplus.FallDamage(ply,speed)
	local damage = speed / 15
	if (damage > ply:Health() / 2 and damage < ply:Health()) then
		ply:SetNWInt("MedicineModtraumalegs", 1)
		ply:SetNWInt("MedicineModHealthLeg", ply:GetNWInt("MedicineModHealthLeg")-40)
	end
	return damage
end

hook.Add("ScalePlayerDamage","MedicinemodplusPlayerDamage", Medicinemodplus.Damage)
hook.Add("ScaleNPCDamage","MedicinemodplusNPCDamage", Medicinemodplus.Damage)
hook.Add("GetFallDamage","MedicinemodplusFallDamage", Medicinemodplus.FallDamage)

hook.Add("PlayerSay", "MedicModHudEnableDisable", function(ply, text)
	if (string.lower(text) == "/medicmodhud") then
			if ply:GetNWBool("medicmodhud") == true then
				ply:SendLua("local tab = {Color(120, 120, 220), TranslationMedicMod.Youturnedonthehud } chat.AddText(unpack(tab))")
				ply:SetNWBool("medicmodhud", false)
			else
				ply:SendLua("local tab = {Color(120, 120, 220), TranslationMedicMod.Youturnedoffthehud } chat.AddText(unpack(tab))")
				ply:SetNWBool("medicmodhud", true)
			end
		return ""
	end
end )