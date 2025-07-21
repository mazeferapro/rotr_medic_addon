include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	
	net.Receive(self:EntIndex().."MRIMenuOpen", function()
	
		local reader = self
	
		local OrganList = vgui.Create("DFrame")
		OrganList:SetSize(415, 650) 
		OrganList:Center()
		OrganList:SetTitle(" ") 
		OrganList:SetVisible(true)
		OrganList:SetDraggable(true) 
		OrganList:ShowCloseButton(false) 
		OrganList:MakePopup()
		OrganList.Paint = function() 
			draw.RoundedBox (5, 0, 0, OrganList:GetWide(), OrganList:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, OrganList:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.MRIreport, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end

		local button = vgui.Create("DColorButton", OrganList); button:SetPos(5,30); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.LUNG)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.LUNG,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetPos(5,235); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.LIVER)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.LIVER,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetPos(210,30); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.KIDNEY)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.KIDNEY,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetPos(210,235); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.HEART)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.HEART,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetPos(5,440); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.SPLEEN)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.SPLEEN,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetPos(210,440); button:SetSize(200,200); button:SetText("");
		button.Paint = function() 
			draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,220,100)) ; 
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(Material("mri/"..reader:GetNWString(TranslationMedicMod.AORTA)..".png"))
			surface.DrawTexturedRect(2,2,196,196)
			draw.DrawText(TranslationMedicMod.AORTA,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
		end
		
		local button = vgui.Create("DColorButton", OrganList); button:SetSize(15,8); button:SetPos(390,5); button:SetText(""); button:SetColor(Color(110, 110, 0)); 
		button.Paint = function() 
			draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) ; 
		end; 
		button.DoClick = function()
			OrganList:Close()
			net.Start(reader:EntIndex().."MRIDestroy")
			net.SendToServer()
		end
	end)
		
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local col1 = Color(0, 0, 0, 150)
	local col2 = Color(140, 140, 0, 100)
	local col3 = Color(255,255,255,255)
	local SurfaceWhite = Color(255, 255, 255, 255)
	local Black = (Color(0, 0, 0))
	
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 0)
	
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	
	cam.Start3D2D(pos + ang:Up()*3.5 + ang:Right()*-24.8 + ang:Forward()*-10.5, ang, 0.1)
		surface.SetDrawColor(col3)
		surface.SetMaterial(Material("pills/mri_monitor.png"))
		surface.DrawTexturedRect(-0,-0,210,165)
    cam.End3D2D()
	
end
