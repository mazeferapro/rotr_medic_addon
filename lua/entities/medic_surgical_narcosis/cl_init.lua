include("shared.lua")

local cabinet = {}
cabinet[1] = {name = "Ketamine", icon = "syringe_2.png", id = "medic_narcosis_ketamin"}
cabinet[2] = {name = "Propofol", icon = "syringe_3.png", id = "medic_narcosis_propofol"}
cabinet[3] = {name = "Thiopental", icon = "saline.png", id = "medic_narcosis_tiopental"}
cabinet[4] = {name = "Rocuronium", icon = "bottle.png", id = "medic_narcosis_rocuroni"}

function ENT:Draw()
	self:DrawModel()
	
	net.Receive(self:EntIndex().."CabinetReactiveOpen", function()
	
		local DermaPanel = vgui.Create("DFrame")
		DermaPanel:SetSize(140, 275) 
		DermaPanel:Center()
		DermaPanel:SetTitle(" ") 
		DermaPanel:SetVisible(true)
		DermaPanel:SetDraggable(true) 
		DermaPanel:ShowCloseButton(false) 
		DermaPanel:MakePopup()
		DermaPanel.Paint = function() 
			draw.RoundedBox (5, 0, 0, DermaPanel:GetWide(), DermaPanel:GetTall(), Color(255,255,255,190)) 
			draw.RoundedBox (5, 0, 0, DermaPanel:GetWide(), 25, Color(140,140,0,100)) 
			draw.SimpleText(TranslationMedicMod.DRUG, "Medicinefont1", 5, 2, Color(90,90,90,230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end
	
		
		local button = vgui.Create("DColorButton", DermaPanel); button:SetSize(15,8); button:SetPos(119,5); button:SetText(""); button:SetColor(Color(110, 110, 0)); 
		button.Paint = function() 
			draw.RoundedBox (2, 0, 0, button:GetWide(), button:GetTall(), Color(255,0,0,220)) ; 
		end; 
		button.DoClick = function()
			DermaPanel:Close()
		end

		
		local reader = self
		
		local scroll = vgui.Create("DScrollPanel", DermaPanel)
		scroll:SetPos(15,25)
		scroll:SetSize(125,250)
		
		local sbar = scroll:GetVBar()
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
		
		for _,v in pairs(cabinet) do
				local button = vgui.Create("DColorButton", scroll); button:SetSize(100,100); button:Dock(TOP); button:SetText(""); button:SetColor(Color(110, 110, 0)); button.Paint = function() draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
				draw.SimpleText(v.name, "Medicinefont2", 33, 0, Color(255,227,107,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) end;
				button.Paint = function() 
					draw.RoundedBox (5, 0, 0, button:GetWide(), button:GetTall(), Color(0,0,0,100)) ; 
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(Material(v.icon))
					surface.DrawTexturedRect(2,2,96,96)
					draw.DrawText(v.name,"Medicinefont1",2,0,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
				end; 
				function button:DoClick() net.Start(reader:EntIndex().."TakeReactive"); net.WriteString(v.id,32); net.SendToServer() end

				button:DockMargin(0,5,10,0)
		end
	end)
	

	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	
	local White = (Color(255, 255, 255))
	local Black = (Color(0, 0, 0))
	local SurfaceWhite = Color(255, 255, 255, 255)
	local SurfaceBlack = Color(0, 0, 0, 200)
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	
	cam.Start3D2D(Pos + Ang:Up() * 8 + Ang:Right() * -1.8 + Ang:Forward() * -3.9, Ang, 0.1)
        draw.DrawText("NARCOSIS", "Medicinefont4", 0, -75, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	cam.Start3D2D(Pos + Ang:Up() * 8 + Ang:Right() * 1.2 + Ang:Forward() * -4.7, Ang, 0.1)
		surface.SetDrawColor(SurfaceWhite)
		surface.SetMaterial(Material("pills/combine.png"))
		surface.DrawTexturedRect(-30,-110,30,30)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 8 + Ang:Right() * -1 + Ang:Forward() * -6, Ang, 0.06)
        draw.DrawText("CIVILFARM", "Medicinefont3", 10, -120, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Up(), -90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)	
	Ang:RotateAroundAxis(Ang:Right(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 11.3 + Ang:Right() * 6 + Ang:Forward() * -5, Ang, 0.1)
        draw.DrawText("POWERED BY RU", "Medicinefont3", 0, -130, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HL2RP PROJECT", "Medicinefont3", 0, -110, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("AND PUTIN", "Medicinefont3", 0, -90, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Right(), 180)
	cam.Start3D2D(Pos + Ang:Up() * 11.3 + Ang:Right() * 6 + Ang:Forward() * -5, Ang, 0.1)
        draw.DrawText("DESIGNED", "Medicinefont3", 45, -135, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("FOR USE IN", "Medicinefont3", 45, -115, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HOSPITAL", "Medicinefont3", 45, -95, Black, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
end
