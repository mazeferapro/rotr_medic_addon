AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")  
include("shared.lua")

function ENT:Initialize()
self:SetModel("models/props_unique/hospital/exam_table.mdl")
self:PhysicsInit(SOLID_VPHYSICS)     
self:SetMoveType(MOVETYPE_VPHYSICS)   
self:SetSolid(SOLID_VPHYSICS)         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end

	self:SetNWInt("have_blood",4500)
	self:SetNWInt("spO2",99)
	self:SetNWInt("ap_systol", 120)
	self:SetNWInt("ap_diastol", 80)
	self:SetNWInt("have_bleeding", 0)
	self:SetNWInt(TranslationMedicMod.BLOODTRANSFUSION, 0)
	self:SetNWInt(TranslationMedicMod.ADRENALIN, 0)
	self:SetNWInt(TranslationMedicMod.MEZATON, 0)
	self:SetNWInt(TranslationMedicMod.AMIODARONE, 0)
	self:SetNWInt(TranslationMedicMod.VIKASOL, 0)
	self:SetNWInt(TranslationMedicMod.THROMBOMASS, 0)
	self:SetNWInt(TranslationMedicMod.THROMBIN, 0)
	self:SetNWString("patient_name",TranslationMedicMod.No)
	self:SetNWBool("auto_respiration_system",false)
	self:SetNWBool("narcosis",false)
	self:SetNWBool("monitoring",false)
	self:SetNWString("organ_traum",TranslationMedicMod.Absent)
	self:SetNWString("operation_organ",TranslationMedicMod.Notselected)
	self:SetNWString("volume_operation_stage_1",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_2",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_3",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_4",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_5",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_6",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_7",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_8",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_9",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_10",TranslationMedicMod.Notcarriedout)

	util.AddNetworkString(self:EntIndex().."SurgicalTableOpen")
	util.AddNetworkString(self:EntIndex().."ChoiseOrgan")
	util.AddNetworkString(self:EntIndex().."ChoiseManipulation")
	util.AddNetworkString(self:EntIndex().."ChoiseRevial")
	util.AddNetworkString(self:EntIndex().."ChoiseCoagulation")
	util.AddNetworkString(self:EntIndex().."StartRespiration")
	util.AddNetworkString(self:EntIndex().."StartNarcosis")
	util.AddNetworkString(self:EntIndex().."ChoiseApparature")
	util.AddNetworkString(self:EntIndex().."EndOperation")
	
	net.Receive(self:EntIndex().."ChoiseApparature", function(act, ply)
		local readid = net.ReadString(32)
		if self:GetNWString("patient_name") != TranslationMedicMod.No then
			if readid == TranslationMedicMod.MechanicalVentilation then
				self:SetNWBool("auto_respiration_system",true)
				self:EmitSound("buttons/lever3.wav")
			elseif readid == TranslationMedicMod.NARCOSIS then
				self:SetNWBool("narcosis",true)
				self:EmitSound("buttons/lever3.wav")
			elseif readid == TranslationMedicMod.ONEQUIPMENT then
				self:SetNWBool("monitoring",true)
				self:EmitSound("buttons/lever3.wav")
			end
		else
			ply:SendLua("local tab = {Color(170, 0, 0), TranslationMedicMod.Patientnotassigned } chat.AddText(unpack(tab))")
		end
	end)

	net.Receive(self:EntIndex().."ChoiseOrgan", function(act, ply)
		local readid = net.ReadString(32)
		if self:GetNWBool("narcosis") == true then
			if self:GetNWString("operation_organ") == TranslationMedicMod.Notselected then
				self:EmitSound("medicinemod+/blood_1.wav")
				self:SetNWString("operation_organ", readid)
				ply:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Youhavechosentheorganforsurgery } chat.AddText(unpack(tab))")
				self:SetNWInt("have_bleeding", 5)
				self:SetNWString("volume_operation_stage_1",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_2",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_3",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_4",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_5",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_6",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_7",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_8",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_9",TranslationMedicMod.Notcarriedout)
				self:SetNWString("volume_operation_stage_10",TranslationMedicMod.Notcarriedout)
			else
				ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Youhavealreadystartedtheoperationcompleteitfirst } chat.AddText(unpack(tab))")
			end
		else
			ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Noanesthesiawasgiven } chat.AddText(unpack(tab))")
		end
	end)
	
	net.Receive(self:EntIndex().."ChoiseManipulation", function(act, ply)
		local readid = net.ReadString(32)
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			self:EmitSound("medicinemod+/blood_2.wav")
			self:SetNWInt("have_bleeding", self:GetNWInt("have_bleeding")+5)
			local rand = math.random(1,100)
			if rand <= 10 then
				self:SetNWInt("have_bleeding", self:GetNWInt("have_bleeding")+100)
			end
			if self:GetNWString("volume_operation_stage_1") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_1",readid)
			elseif self:GetNWString("volume_operation_stage_2") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_2",readid)
			elseif self:GetNWString("volume_operation_stage_3") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_3",readid)
			elseif self:GetNWString("volume_operation_stage_4") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_4",readid)
			elseif self:GetNWString("volume_operation_stage_5") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_5",readid)
			elseif self:GetNWString("volume_operation_stage_6") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_6",readid)
			elseif self:GetNWString("volume_operation_stage_7") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_7",readid)
			elseif self:GetNWString("volume_operation_stage_8") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_8",readid)
			elseif self:GetNWString("volume_operation_stage_9") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_9",readid)
			elseif self:GetNWString("volume_operation_stage_10") == TranslationMedicMod.Notcarriedout then
				self:SetNWString("volume_operation_stage_10",readid)
			else
				ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Completetheoperationimmediately } chat.AddText(unpack(tab))")
			end
		else
			ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Youhaventchosenanorgan } chat.AddText(unpack(tab))")
		end
	end)
	
	net.Receive(self:EntIndex().."ChoiseRevial", function(act, ply)
		local readid = net.ReadString(32)
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			if self:GetNWInt(readid) <= 0 then
				self:EmitSound("medicinemod+/blood_1.wav")
				self:SetNWInt(readid, 30)
				timer.Create("/"..readid.."/"..self:EntIndex().."/", 0.1,100, function() 
					self:SetNWInt("have_blood", self:GetNWInt("have_blood")+5)
				end)
			end
		else
			ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Youhaventchosenanorgan } chat.AddText(unpack(tab))")
		end
	end)
	
	net.Receive(self:EntIndex().."ChoiseCoagulation", function(act, ply)
		local readid = net.ReadString(32)
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			if self:GetNWInt(readid) <= 0 then
				self:EmitSound("medicinemod+/blood_1.wav")
				self:SetNWInt(readid, 30)
				self:SetNWInt("have_bleeding", self:GetNWInt("have_bleeding")-10)
				timer.Simple(10, function()
					if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
						self:SetNWInt("have_bleeding", self:GetNWInt("have_bleeding")+10)
					end
				end)
			end
		else
			ply:SendLua("local tab = {Color(0, 0, 170), TranslationMedicMod.Youhaventchosenanorgan } chat.AddText(unpack(tab))")
		end
	end)
	
	net.Receive(self:EntIndex().."EndOperation", function(act, ply)
		self:EmitSound("medicinemod+/blood_1.wav")
		ply:SendLua("local tab = {Color(170, 90, 0), TranslationMedicMod.Youhavecompletedtheoperationbutnotcompletely } chat.AddText(unpack(tab))")
		self:Reset()
	end)
	
end

function ENT:Use(ply)
	net.Start(self:EntIndex().."SurgicalTableOpen")
	net.WriteEntity(self)
	net.Send(ply)
end

function ENT:Reset()
	self:SetNWInt("have_blood",4500)
	self:SetNWInt("spO2",99)
	self:SetNWInt("ap_systol", 120)
	self:SetNWInt("ap_diastol", 80)
	self:SetNWInt("have_bleeding", 0)
	self:SetNWInt(TranslationMedicMod.BLOODTRANSFUSION, 0)
	self:SetNWInt(TranslationMedicMod.ADRENALIN, 0)
	self:SetNWInt(TranslationMedicMod.MEZATON, 0)
	self:SetNWInt(TranslationMedicMod.AMIODARONE, 0)
	self:SetNWInt(TranslationMedicMod.VIKASOL, 0)
	self:SetNWInt(TranslationMedicMod.THROMBOMASS, 0)
	self:SetNWInt(TranslationMedicMod.THROMBIN, 0)
	self:SetNWString("patient_name",TranslationMedicMod.No)
	self:SetNWBool("auto_respiration_system",false)
	self:SetNWBool("narcosis",false)
	self:SetNWBool("monitoring",false)
	self:SetNWString("organ_traum",TranslationMedicMod.Absent)
	self:SetNWString("operation_organ",TranslationMedicMod.Notselected)
	self:SetNWString("volume_operation_stage_1",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_2",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_3",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_4",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_5",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_6",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_7",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_8",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_9",TranslationMedicMod.Notcarriedout)
	self:SetNWString("volume_operation_stage_10",TranslationMedicMod.Notcarriedout)
end

function ENT:Think()
	if (!self.nexttimer or CurTime() >= self.nexttimer) then
			local stage_1 = self:GetNWString("volume_operation_stage_1")
			local stage_2 = self:GetNWString("volume_operation_stage_2")
			local stage_3 = self:GetNWString("volume_operation_stage_3")
			local stage_4 = self:GetNWString("volume_operation_stage_4")
			local stage_5 = self:GetNWString("volume_operation_stage_5")
			local stage_6 = self:GetNWString("volume_operation_stage_6")
			local stage_7 = self:GetNWString("volume_operation_stage_7")
			local stage_8 = self:GetNWString("volume_operation_stage_8")
			local stage_9 = self:GetNWString("volume_operation_stage_9")
			local stage_10 = self:GetNWString("volume_operation_stage_10")
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.KIDNEY and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Renalrupture and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.CLESSING and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureKidney", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.KIDNEY and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Kidneyhematoma and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.COAGULATION and 
			stage_3 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaKidney", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.LUNG and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Lungrupture and 
			stage_1 == TranslationMedicMod.INCISION and stage_2 == TranslationMedicMod.CLESSING and 
			stage_3 == TranslationMedicMod.ASPIRATION and stage_4 == TranslationMedicMod.SHUNTING and 
			stage_5 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureLung", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.LUNG and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Lunghematoma and 
			stage_1 == TranslationMedicMod.INCISION and stage_2 == TranslationMedicMod.ASPIRATION and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaLung", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.LIVER and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Liverrupture and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.CLESSING and stage_4 == TranslationMedicMod.COAGULATION and 
			stage_5 == TranslationMedicMod.RESECTION and stage_6 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureLiver", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.LIVER and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Liverhematoma and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaLiver", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.HEART and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Heartrupture and 
			stage_1 == TranslationMedicMod.INCISION and stage_2 == TranslationMedicMod.SMALLCUT and 
			stage_3 == TranslationMedicMod.ASPIRATION and stage_4 == TranslationMedicMod.COAGULATION and 
			stage_5 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureHeart", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.HEART and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Hearthematoma and 
			stage_1 == TranslationMedicMod.INCISION and stage_2 == TranslationMedicMod.SMALLCUT and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaHeart", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.AORTA and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Aorticrupture and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.CLESSING and stage_4 == TranslationMedicMod.ASPIRATION and
			stage_5 == TranslationMedicMod.SHUNTING and stage_6 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureAorta", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.AORTA and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Aortichematoma and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaAorta", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.SPLEEN and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Splenicrupture and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.CLESSING and stage_4 == TranslationMedicMod.EXTRACTION and
			stage_5 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModRaptureSpleen", 0)
				end; end; self:Reset()
			end
			------------------------------------------------------------------------------------------------------------------
			if self:GetNWString("operation_organ") == TranslationMedicMod.SPLEEN and 
			self:GetNWString("organ_traum") == TranslationMedicMod.Splenichematoma and 
			stage_1 == TranslationMedicMod.CLOSEUPSECTION and stage_2 == TranslationMedicMod.INCISION and 
			stage_3 == TranslationMedicMod.COAGULATION and stage_4 == TranslationMedicMod.SUTURING then
				if ServerMedicMod.EnableSurgeryPay == true then  DarkRP.createMoneyBag(self:GetPos() + self:GetAngles():Up()*50, ServerMedicMod.SurgeryPay) end
				for k,v in pairs(player.GetAll()) do if v:Nick() == self:GetNWString("patient_name") then v:SendLua("local tab = {Color(0, 170, 0), TranslationMedicMod.Theoperationonyouwassuccessful } chat.AddText(unpack(tab))")
						v:SetNWInt("SurgeryModHematomaSpleen", 0)
				end; end; self:Reset()
			end
			
		self.nexttimer = CurTime() + 1
	end
	if self:GetNWInt("have_blood") >= 4500 then self:SetNWInt("have_blood", 4500) end
	if (!self.nextrevial or CurTime() >= self.nextrevial) then
	
		if self:GetNWInt(TranslationMedicMod.BLOODTRANSFUSION) > 0 then self:SetNWInt(TranslationMedicMod.BLOODTRANSFUSION, self:GetNWInt(TranslationMedicMod.BLOODTRANSFUSION)-2.0) end
		if self:GetNWInt(TranslationMedicMod.ADRENALIN) > 0 then self:SetNWInt(TranslationMedicMod.ADRENALIN, self:GetNWInt(TranslationMedicMod.ADRENALIN)-1.5) end
		if self:GetNWInt(TranslationMedicMod.MEZATON) > 0 then self:SetNWInt(TranslationMedicMod.MEZATON, self:GetNWInt(TranslationMedicMod.MEZATON)-1.0) end
		if self:GetNWInt(TranslationMedicMod.AMIODARONE) > 0 then self:SetNWInt(TranslationMedicMod.AMIODARONE, self:GetNWInt(TranslationMedicMod.AMIODARONE)-0.5) end
		
		if self:GetNWInt(TranslationMedicMod.VIKASOL) > 0 then self:SetNWInt(TranslationMedicMod.VIKASOL, self:GetNWInt(TranslationMedicMod.VIKASOL)-2.5) end
		if self:GetNWInt(TranslationMedicMod.THROMBOMASS) > 0 then self:SetNWInt(TranslationMedicMod.THROMBOMASS, self:GetNWInt(TranslationMedicMod.THROMBOMASS)-1.5) end
		if self:GetNWInt(TranslationMedicMod.THROMBIN) > 0 then self:SetNWInt(TranslationMedicMod.THROMBIN, self:GetNWInt(TranslationMedicMod.THROMBIN)-1.0) end
		
		self.nextrevial = CurTime() + 1
	end
	
	if (!self.nextarterialpressure or CurTime() >= self.nextarterialpressure) then
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			if self:GetNWInt("have_blood") >= 800 then
				self:SetNWInt("ap_systol", self:GetNWInt("have_blood")/4500*120)
				self:SetNWInt("ap_diastol", self:GetNWInt("have_blood")/4500*80)
			else
				self:SetNWInt("ap_systol", 0)
				self:SetNWInt("ap_diastol", 0)
			end
		end
		self.nextarterialpressure = CurTime() + 1
	end
	
	if (!self.nextblood or CurTime() >= self.nextblood) then
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			if self:GetNWInt("have_blood") > 600 then
				self:SetNWInt("have_blood", self:GetNWInt("have_blood")-self:GetNWInt("have_bleeding"))
			else
				self:SetNWInt("have_blood", 0)
				self:Reset()
			end
		end
		self.nextblood = CurTime() + 1
	end
	
	if self:GetNWInt("have_blood") >= 800 then
		if (!self.nextheart or CurTime() >= self.nextheart) then
			if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
				self:EmitSound("medicinemod+/heart_active.wav")
			end
			self.nextheart = CurTime() + self:GetNWInt("have_blood")/4500/1.6
		end
	else
		if (!self.nextheart or CurTime() >= self.nextheart) then
			self:EmitSound("medicinemod+/heart_stop.wav")
			self.nextheart = CurTime() + 1.555
		end
	end
	
	if (!self.nextrespiration or CurTime() >= self.nextrespiration) then
		if self:GetNWString("operation_organ") != TranslationMedicMod.Notselected then
			if self:GetNWBool("auto_respiration_system") == true then
				if self:GetNWInt("spO2") <= 97 then
					self:SetNWInt("spO2",self:GetNWInt("spO2")+2)
				end
				self:EmitSound("medicinemod+/respiration.wav")
			else
				self:SetNWInt("spO2",self:GetNWInt("spO2")-math.random(1,3))
				self:SetNWInt("have_blood", self:GetNWInt("have_blood")-(100-self:GetNWInt("spO2"))*10)
			end
		end
		self.nextrespiration = CurTime() + 5
	end
end
