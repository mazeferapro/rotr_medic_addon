hook.Add( "HUDPaint", "MedicModStatus", function()

	if LocalPlayer():GetNWInt("MedicineModcontusion") <= 99 then 
		DrawMotionBlur( 0.03, 0.5, 0)
	end

	health = LocalPlayer():Health()
    if LocalPlayer():GetNWInt("MedicineModcontusion") <= 99 then
    	DrawToyTown( 3, ScrH()/1.5 )
	end
	
	if LocalPlayer():GetNWBool("medicmodhud") != true then
		surface.SetMaterial(Material("body/head.png"))
		surface.SetDrawColor(125,LocalPlayer():GetNWInt("MedicineModHealthHead")*2.5,0,100)
		surface.DrawTexturedRect(-10,25,150,147)
		
		surface.SetMaterial(Material("body/chest.png"))
		surface.SetDrawColor(125,LocalPlayer():GetNWInt("MedicineModHealthChest")*2.5,0,100)
		surface.DrawTexturedRect(-10,25,150,147)
		
		surface.SetMaterial(Material("body/arms.png"))
		surface.SetDrawColor(125,LocalPlayer():GetNWInt("MedicineModHealthArm")*2.5,0,100)
		surface.DrawTexturedRect(-10,25,150,147)
		
		surface.SetMaterial(Material("body/stomach.png"))
		surface.SetDrawColor(125,LocalPlayer():GetNWInt("MedicineModHealthStomach")*2.5,0,100)
		surface.DrawTexturedRect(-10,24,150,147)
		
		surface.SetMaterial(Material("body/legs.png"))
		surface.SetDrawColor(125,LocalPlayer():GetNWInt("MedicineModHealthLeg")*2.5,0,100)
		surface.DrawTexturedRect(-10,21,150,147)
	end
end )

function pharyng()

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 245, 270 ) 
	DermaPanel:Center()
	DermaPanel:SetTitle(" ") 
	DermaPanel:SetVisible( true )
	DermaPanel:SetDraggable( true ) 
	DermaPanel:ShowCloseButton( false ) 
	DermaPanel:MakePopup()
	DermaPanel.Paint = function()
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), DermaPanel:GetTall(), Color(255,255,255,190)) 
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), 25, Color(140,140,0,100) ) 
		draw.DrawText(TranslationMedicMod.MEDICALEXAMINATION,"Medicinefont1",5,0,Color(90,90,90,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
	end
	local button = vgui.Create("DColorButton", DermaPanel); button:SetSize(15,8); button:SetPos(225,5); button:SetText(""); button:SetColor( Color( 110, 110, 0 ) ); 
	button.Paint = function() draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) end;  button.DoClick = function() DermaPanel:Close() end

	local img_text = vgui.Create("DImageButton", DermaPanel)
	img_text:SetPos(5, 30)
	img_text:SetSize(235, 235)
	local imageid = net.ReadInt(32)
	if imageid == 1 then
	img_text:SetImage("pharyngs_red_fibrae.png")
	elseif imageid == 2 then
	img_text:SetImage("pharygs_nalet.png")
	elseif imageid == 3 then
	img_text:SetImage("pharyngs_bloodandpyo.png")
	elseif imageid == 4 then
	img_text:SetImage("pharyngs_exacerbacio.png")
	elseif imageid == 5 then
	img_text:SetImage("pharyngs_red.png")
	else
	img_text:SetImage("pharyngs_norma.png")
	end				
	img_text.DoClick = function()
		DermaPanel:Close()
	end

end
net.Receive("pharyng",pharyng)

function ophtalm()

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 245, 270 ) 
	DermaPanel:Center()
	DermaPanel:SetTitle(" ") 
	DermaPanel:SetVisible( true )
	DermaPanel:SetDraggable( true ) 
	DermaPanel:ShowCloseButton( false ) 
	DermaPanel:MakePopup()
	DermaPanel.Paint = function()
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), DermaPanel:GetTall(), Color(255,255,255,190))
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), 25, Color(140,140,0,100) ) 
		draw.DrawText(TranslationMedicMod.MEDICALEXAMINATION,"Medicinefont1",5,0,Color(90,90,90,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
	end
	local button = vgui.Create("DColorButton", DermaPanel); button:SetSize(15,8); button:SetPos(225,5); button:SetText(""); button:SetColor( Color( 110, 110, 0 ) ); 
	button.Paint = function() draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) end;  button.DoClick = function() DermaPanel:Close() end

	local img_text = vgui.Create("DImageButton", DermaPanel)
	img_text:SetPos(5, 30)
	img_text:SetSize(235, 235)
	local imageid = net.ReadInt(32)
	if imageid == 1 then
	img_text:SetImage("dacryocystit.png")
	elseif imageid == 2 then
	img_text:SetImage("blefaritis.png")
	elseif imageid == 3 then
	img_text:SetImage("meibonitis.png")
	elseif imageid == 4 then
	img_text:SetImage("episcleritis.png")
	elseif imageid == 5 then
	img_text:SetImage("endophtalmpanophtalm.png")
	elseif imageid == 7 then
	img_text:SetImage("infiltrsclerit.png")
	elseif imageid == 10 then
	img_text:SetImage("xenophtalm.png")
	elseif imageid == 11 then
	img_text:SetImage("keratitis.png")
	elseif imageid == 12 then
	img_text:SetImage("iridocyclitis.png")
	elseif imageid == 13 then
	img_text:SetImage("dacryadenitis.png")
	elseif imageid == 14 then
	img_text:SetImage("konjunctivitis.png")
	elseif imageid == 16 then
	img_text:SetImage("acantimebceratitis.png")
	else
	img_text:SetImage("norm_glaz_2.png")
	end				
	img_text.DoClick = function()
		DermaPanel:Close()
	end
	
end
net.Receive("ophtalm",ophtalm)

function ophtalm2()

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 245, 270 ) 
	DermaPanel:Center()
	DermaPanel:SetTitle(" ") 
	DermaPanel:SetVisible( true )
	DermaPanel:SetDraggable( true ) 
	DermaPanel:ShowCloseButton( false ) 
	DermaPanel:MakePopup()
	DermaPanel.Paint = function()
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), DermaPanel:GetTall(), Color(255,255,255,190))
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), 25, Color(140,140,0,100) ) 
		draw.DrawText(TranslationMedicMod.MEDICALEXAMINATION,"Medicinefont1",5,0,Color(90,90,90,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
	end
	local button = vgui.Create("DColorButton", DermaPanel); button:SetSize(15,8); button:SetPos(225,5); button:SetText(""); button:SetColor( Color( 110, 110, 0 ) ); 
	button.Paint = function() draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) end;  button.DoClick = function() DermaPanel:Close() end

	local img_text = vgui.Create("DImageButton", DermaPanel)
	img_text:SetPos(5, 30)
	img_text:SetSize(235, 235)
	local imageid = net.ReadInt(32)
	if imageid == 6 then
	img_text:SetImage("uveit.png")
	elseif imageid == 8 then
	img_text:SetImage("retinit.png")
	elseif imageid == 9 then
	img_text:SetImage("ophtalmopatia.png")
	elseif imageid == 15 then
	img_text:SetImage("ophtalmoangipatia.png")
	else
	img_text:SetImage("norm_glaz_1.png")
	end				
	img_text.DoClick = function()
		DermaPanel:Close()
	end

end
net.Receive("ophtalm2",ophtalm2)

function otos()

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 245, 270 ) 
	DermaPanel:Center()
	DermaPanel:SetTitle(" ") 
	DermaPanel:SetVisible( true )
	DermaPanel:SetDraggable( true ) 
	DermaPanel:ShowCloseButton( false ) 
	DermaPanel:MakePopup()
	DermaPanel.Paint = function()
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), DermaPanel:GetTall(), Color(255,255,255,190)) 
		draw.RoundedBox ( 5, 0, 0, DermaPanel:GetWide(), 25, Color(140,140,0,100) ) 
		draw.DrawText(TranslationMedicMod.MEDICALEXAMINATION,"Medicinefont1",5,0,Color(90,90,90,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
	end
	local button = vgui.Create("DColorButton", DermaPanel); button:SetSize(15,8); button:SetPos(225,5); button:SetText(""); button:SetColor( Color( 110, 110, 0 ) ); 
	button.Paint = function() draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) end;  button.DoClick = function() DermaPanel:Close() end

	local img_text = vgui.Create("DImageButton", DermaPanel)
	img_text:SetPos(5, 30)
	img_text:SetSize(235, 235)
	local imageid = net.ReadInt(32)
	if imageid == 1 then
	img_text:SetImage("pyo_oto.png")
	elseif imageid == 2 then
	img_text:SetImage("blood_oto.png")
	elseif imageid == 3 then
	img_text:SetImage("cataral_oto.png")
	elseif imageid == 4 then
	img_text:SetImage("pereponka_pizdec.png")
	else
	img_text:SetImage("norm_medial_oto.png")
	end				
	img_text.DoClick = function()
		DermaPanel:Close()
	end

end
net.Receive("otos",otos)