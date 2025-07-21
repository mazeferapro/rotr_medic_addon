include("shared.lua")

local location = {}
location[1] = {name = TranslationMedicMod.HEART, icon = "heart.png"}
location[2] = {name = TranslationMedicMod.AORTA, icon = "aorta.png"}
location[3] = {name = TranslationMedicMod.SPLEEN, icon = "spleen.png"}
location[4] = {name = TranslationMedicMod.LUNG, icon = "lungs.png"}
location[5] = {name = TranslationMedicMod.LIVER, icon = "liver.png"}
location[6] = {name = TranslationMedicMod.KIDNEY, icon = "kidneys.png"}

local manipulations = {}
manipulations[1] = {name = TranslationMedicMod.CLOSEUPSECTION, icon = "scissors.png"}
manipulations[2] = {name = TranslationMedicMod.INCISION, icon = "scalpel.png"}
manipulations[3] = {name = TranslationMedicMod.SMALLCUT, icon = "scalpel_small.png"}
manipulations[4] = {name = TranslationMedicMod.EXTRACTION, icon = "tweezer.png"}
manipulations[5] = {name = TranslationMedicMod.SUTURING, icon = "hook.png"}
manipulations[6] = {name = TranslationMedicMod.SHUNTING, icon = "needle.png"}
manipulations[7] = {name = TranslationMedicMod.CLESSING, icon = "clamp_2.png"}
manipulations[8] = {name = TranslationMedicMod.RESECTION, icon = "clamp.png"}
manipulations[9] = {name = TranslationMedicMod.COAGULATION, icon = "soldering.png"}
manipulations[10] = {name = TranslationMedicMod.ASPIRATION, icon = "aspirator.png"}

local revial = {}
revial[1] = {name = TranslationMedicMod.BLOODTRANSFUSION, icon = "blood_bag.png"}
revial[2] = {name = TranslationMedicMod.ADRENALIN, icon = "bottle.png"}
revial[3] = {name = TranslationMedicMod.MEZATON, icon = "ampula.png"}
revial[4] = {name = TranslationMedicMod.AMIODARONE, icon = "syringe_3.png"}

local coagulation = {}
coagulation[1] = {name = TranslationMedicMod.VIKASOL, icon = "syringe_2.png"}
coagulation[2] = {name = TranslationMedicMod.THROMBOMASS, icon = "saline.png"}
coagulation[3] = {name = TranslationMedicMod.THROMBIN, icon = "syringe_4.png"}

function ENT:Draw()
	self:DrawModel()
	
	net.Receive(self:EntIndex().."SurgicalTableOpen", function()
	
		local reader = self
	
		local OrganList = vgui.Create("DFrame")
		OrganList:SetSize(240, 575) 
		OrganList:Center()
		OrganList:SetTitle(" ") 
		OrganList:SetVisible(true)
		OrganList:SetDraggable(true) 
		OrganList:ShowCloseButton(false) 
		OrganList:MakePopup()
		OrganList.Paint = function() 
			draw.RoundedBox (5, 0, 0, OrganList:GetWide(), OrganList:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, OrganList:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.SURGICALFIELD, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end
		local ScrollOrgans = vgui.Create("DScrollPanel", OrganList)
		ScrollOrgans:SetPos(15,25)
		ScrollOrgans:SetSize(225,550)
		local sbar = ScrollOrgans:GetVBar()
		function sbar:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnUp:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnDown:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnGrip:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		for _,v in pairs(location) do
			local button = vgui.Create("DColorButton", ScrollOrgans); button:SetSize(200,200); button:Dock(TOP); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			draw.SimpleText(v.name, "Medicinefont2", 33, 0, Color(255,227,107,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end;
			button.Paint = function() 
				draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
				surface.SetDrawColor(255,255,255,255)
				surface.SetMaterial(Material(v.icon))
				surface.DrawTexturedRect(2,2,196,196)
				draw.DrawText(v.name,"Medicinefont1",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			end; 
			function button:DoClick() net.Start(reader:EntIndex().."ChoiseOrgan"); net.WriteString(v.name,32); net.SendToServer() end

			button:DockMargin(0,5,10,0)
		end
	
		local OperationProgress = vgui.Create("DFrame")
		OperationProgress:SetPos(ScrW()*0.8,ScrH()*0.01)
		OperationProgress:SetSize(240,275)
		OperationProgress:SetTitle(" ") 
		OperationProgress:SetVisible(true)
		OperationProgress:SetDraggable(true) 
		OperationProgress:ShowCloseButton(false) 
		OperationProgress:MakePopup()
		OperationProgress.Paint = function() 
			draw.RoundedBox (5, 0, 0, OperationProgress:GetWide(), OperationProgress:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, OperationProgress:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.PROGRESSOFTHEOPERATION, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText(TranslationMedicMod.Manipulationsperformed, "Medicinefont1", 5, 25, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			if reader:GetNWString("volume_operation_stage_1") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_1"), "Medicinefont1", 5, 45, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_2") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_2"), "Medicinefont1", 5, 65, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_3") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_3"), "Medicinefont1", 5, 85, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_4") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_4"), "Medicinefont1", 5, 105, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_5") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_5"), "Medicinefont1", 5, 125, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_6") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_6"), "Medicinefont1", 5, 145, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_7") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_7"), "Medicinefont1", 5, 165, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_8") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_8"), "Medicinefont1", 5, 185, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_9") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_9"), "Medicinefont1", 5, 205, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
			if reader:GetNWString("volume_operation_stage_10") != TranslationMedicMod.Notcarriedout then draw.SimpleText(reader:GetNWString("volume_operation_stage_10"), "Medicinefont1", 5, 225, Color(90,170,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end
		end
		local button = vgui.Create("DColorButton", OperationProgress); button:SetSize(170,16); button:SetPos(5,250); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) end;
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) ; 
			draw.DrawText(TranslationMedicMod.STOPOPERATION,"Medicinefont2",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end; 
		function button:DoClick() net.Start(reader:EntIndex().."EndOperation"); net.SendToServer() end
		
		local RespirationSystem = vgui.Create("DFrame")
		RespirationSystem:SetPos(ScrW()*0.7335,ScrH()*0.77)
		RespirationSystem:SetSize(330,145)
		RespirationSystem:SetTitle(" ") 
		RespirationSystem:SetVisible(true)
		RespirationSystem:SetDraggable(true) 
		RespirationSystem:ShowCloseButton(false) 
		RespirationSystem:MakePopup()
		RespirationSystem.Paint = function() 
			draw.RoundedBox (5, 0, 0, RespirationSystem:GetWide(), RespirationSystem:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, RespirationSystem:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.EQUIPMENT, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end
		
		local button = vgui.Create("DColorButton", RespirationSystem); button:SetSize(100,100); button:SetPos(5,35); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) end;
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("ventilation.png"))
			surface.DrawTexturedRect(2,2,96,96)
			draw.DrawText(TranslationMedicMod.TURNONVENTILATION,"Medicinefont2",1,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end; 
		function button:DoClick() net.Start(reader:EntIndex().."ChoiseApparature"); net.WriteString(TranslationMedicMod.MechanicalVentilation,32); net.SendToServer() end
		local button = vgui.Create("DColorButton", RespirationSystem); button:SetSize(100,100); button:SetPos(115,35); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) end;
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("narcosis.png"))
			surface.DrawTexturedRect(2,2,96,96)
			draw.DrawText(TranslationMedicMod.GIVEANESTHESIA,"Medicinefont2",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end; 
		function button:DoClick() net.Start(reader:EntIndex().."ChoiseApparature"); net.WriteString(TranslationMedicMod.NARCOSIS,32); net.SendToServer() end
		local button = vgui.Create("DColorButton", RespirationSystem); button:SetSize(100,100); button:SetPos(225,35); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) end;
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("monitor.png"))
			surface.DrawTexturedRect(2,2,96,96)
			draw.DrawText(TranslationMedicMod.INSTRUMENTSON,"Medicinefont2",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end; 
		function button:DoClick() net.Start(reader:EntIndex().."ChoiseApparature"); net.WriteString(TranslationMedicMod.ONEQUIPMENT,32); net.SendToServer() end
		
		local LifeSystem = vgui.Create("DFrame")
		LifeSystem:SetPos(ScrW()*0.8,ScrH()*0.4)
		LifeSystem:SetSize(240,275)
		LifeSystem:SetTitle(" ") 
		LifeSystem:SetVisible(true)
		LifeSystem:SetDraggable(true) 
		LifeSystem:ShowCloseButton(false) 
		LifeSystem:MakePopup()
		LifeSystem.Paint = function() 
			draw.RoundedBox (5, 0, 0, OperationProgress:GetWide(), OperationProgress:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, OperationProgress:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(self:GetNWString("patient_name"), "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			if reader:GetNWBool("monitoring") == false then
				draw.SimpleText(TranslationMedicMod.Pressure.." SYS: NAN", "Medicinefont1", 5, 25, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.SimpleText(TranslationMedicMod.Pressure.." DIA: NAN", "Medicinefont1", 5, 45, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.SimpleText("spO2: NAN %", "Medicinefont1", 5, 65, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			else
				draw.SimpleText(TranslationMedicMod.Pressure.."SYS:"..math.Round(reader:GetNWInt("ap_systol")), "Medicinefont1", 5, 25, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.SimpleText(TranslationMedicMod.Pressure.."DIA:"..math.Round(reader:GetNWInt("ap_diastol")), "Medicinefont1", 5, 45, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.SimpleText("spO2: "..reader:GetNWInt("spO2").."%", "Medicinefont1", 5, 65, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			end
			
			surface.SetDrawColor(255,255,255,255)
			if self:GetNWInt("have_bleeding") > 0 then surface.SetMaterial(Material("bleeding.png")); surface.DrawTexturedRect(2,90,40,40) end
			if self:GetNWInt("have_bleeding") >= 100 then surface.SetMaterial(Material("bleeding.png")); surface.DrawTexturedRect(47,90,40,40) end
			if self:GetNWInt("have_bleeding") >= 200 then surface.SetMaterial(Material("bleeding.png")); surface.DrawTexturedRect(92,90,40,40) end
		end
	
		local ManipulationsList = vgui.Create("DFrame")
		ManipulationsList:SetSize(180, 575) 
		ManipulationsList:CenterVertical()
		ManipulationsList:SetTitle(" ") 
		ManipulationsList:SetVisible(true)
		ManipulationsList:SetDraggable(true) 
		ManipulationsList:ShowCloseButton(false) 
		ManipulationsList:MakePopup()
		ManipulationsList.Paint = function() 
			draw.RoundedBox (5, 0, 0, ManipulationsList:GetWide(), ManipulationsList:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, ManipulationsList:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.MANIPULATION, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end

		local ScrollManipulations = vgui.Create("DScrollPanel", ManipulationsList)
		ScrollManipulations:SetPos(15,25)
		ScrollManipulations:SetSize(165,550)
		local sbar = ScrollManipulations:GetVBar()
		function sbar:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnUp:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnDown:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnGrip:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		for _,v in pairs(manipulations) do
			local button = vgui.Create("DColorButton", ScrollManipulations); button:SetSize(140,140); button:Dock(TOP); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			draw.SimpleText(v.name, "Medicinefont2", 33, 0, Color(255,227,107,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end;
			button.Paint = function() 
				draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
				surface.SetDrawColor(255,255,255,255)
				surface.SetMaterial(Material(v.icon))
				surface.DrawTexturedRect(2,2,136,136)
				draw.DrawText(v.name,"Medicinefont2",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			end; 
			function button:DoClick() net.Start(reader:EntIndex().."ChoiseManipulation"); net.WriteString(v.name,32); net.SendToServer() end

			button:DockMargin(0,5,10,0)
		end
		
		local RevialList = vgui.Create("DFrame")
		RevialList:SetSize(190, 275) 
		RevialList:SetPos(ScrW()*0.65,ScrH()*0.4)
		RevialList:SetTitle(" ") 
		RevialList:SetVisible(true)
		RevialList:SetDraggable(true) 
		RevialList:ShowCloseButton(false) 
		RevialList:MakePopup()
		RevialList.Paint = function() 
			draw.RoundedBox (5, 0, 0, RevialList:GetWide(), RevialList:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, RevialList:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.RESUSCITATION, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end

		local ScrollRevial = vgui.Create("DScrollPanel", RevialList)
		ScrollRevial:SetPos(15,25)
		ScrollRevial:SetSize(175,250)
		local sbar = ScrollRevial:GetVBar()
		function sbar:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnUp:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnDown:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnGrip:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		for _,v in pairs(revial) do
			local button = vgui.Create("DColorButton", ScrollRevial); button:SetSize(140,140); button:Dock(TOP); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			draw.SimpleText(v.name, "Medicinefont2", 33, 0, Color(255,227,107,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end;
			button.Paint = function() 
				draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
				draw.RoundedBox (5, 0, 0, reader:GetNWInt(v.name)*100/20, button:GetTall(), Color(0,0,0,100)) ; 
				surface.SetDrawColor(255,255,255,255)
				surface.SetMaterial(Material(v.icon))
				surface.DrawTexturedRect(2,2,136,136)
				draw.DrawText(v.name,"Medicinefont2",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			end; 
			function button:DoClick() net.Start(reader:EntIndex().."ChoiseRevial"); net.WriteString(v.name,32); net.SendToServer() end

			button:DockMargin(0,5,10,0)
		end
		
		
		local CoagulationList = vgui.Create("DFrame")
		CoagulationList:SetSize(190, 275) 
		CoagulationList:SetPos(ScrW()*0.65,ScrH()*0.01)
		CoagulationList:SetTitle(" ") 
		CoagulationList:SetVisible(true)
		CoagulationList:SetDraggable(true) 
		CoagulationList:ShowCloseButton(false) 
		CoagulationList:MakePopup()
		CoagulationList.Paint = function() 
			draw.RoundedBox (5, 0, 0, CoagulationList:GetWide(), CoagulationList:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, CoagulationList:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.HEMOSTASIS, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end

		local ScrollCoagulation = vgui.Create("DScrollPanel", CoagulationList)
		ScrollCoagulation:SetPos(15,25)
		ScrollCoagulation:SetSize(175,250)
		local sbar = ScrollCoagulation:GetVBar()
		function sbar:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnUp:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnDown:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		function sbar.btnGrip:Paint(w, h)
			draw.RoundedBox(4,0,0,w,h,Color(0,0,0,100))
		end
		for _,v in pairs(coagulation) do
			local button = vgui.Create("DColorButton", ScrollCoagulation); button:SetSize(140,140); button:Dock(TOP); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
			draw.SimpleText(v.name, "Medicinefont2", 33, 0, Color(255,227,107,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end;
			button.Paint = function() 
				draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
				draw.RoundedBox (5, 0, 0, reader:GetNWInt(v.name)*100/20, button:GetTall(), Color(0,0,0,100)) ; 
				surface.SetDrawColor(255,255,255,255)
				surface.SetMaterial(Material(v.icon))
				surface.DrawTexturedRect(2,2,136,136)
				draw.DrawText(v.name,"Medicinefont2",5,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			end; 
			function button:DoClick() net.Start(reader:EntIndex().."ChoiseCoagulation"); net.WriteString(v.name,32); net.SendToServer() end

			button:DockMargin(0,5,10,0)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetSize(15,8); button:SetPos(219,5); button:SetText(""); button:SetColor(Color(110, 110, 0)); 
		button.Paint = function() 
			draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) ; 
		end; 
		button.DoClick = function()
			OrganList:Close()
			ManipulationsList:Close()
			OperationProgress:Close()
			LifeSystem:Close()
			RevialList:Close()
			CoagulationList:Close()
			RespirationSystem:Close()
		end
	end)
	
end
