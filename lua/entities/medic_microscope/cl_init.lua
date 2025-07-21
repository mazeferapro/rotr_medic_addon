include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local col1 = Color(0, 0, 0, 150)
	local col2 = Color(140, 140, 0, 100)
	local col3 = Color(255,255,255,255)
	local colPathol = Color(255,180,180,255)
	local ColNormal = Color(255,255,180,255)
	local SurfaceWhite = Color(255, 255, 255, 255)
	local Black = (Color(0, 0, 0))
	
	ang:RotateAroundAxis(ang:Up(), -90)
	ang:RotateAroundAxis(ang:Forward(), 180)
	ang:RotateAroundAxis(ang:Right(), 0)
	
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	
	cam.Start3D2D(pos + ang:Up()*1 + ang:Right()*-3 + ang:Forward()*5, ang, 0.1)
    	surface.SetDrawColor(col1)
		surface.DrawRect(-4,-79,171,125)
		surface.SetDrawColor(col3)
		surface.SetMaterial(Material("pills/monitor.png"))
		surface.DrawTexturedRect(-4,-79,171,125)
		
		if self:GetNWBool("have_blood") == true then
			if self:GetNWInt("erythrocytes") < 120 then draw.DrawText(TranslationMedicMod.Redbloodcells..": "..self:GetNWInt("erythrocytes"), "Medicinefont2", 0, -75, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Redbloodcells..": "..self:GetNWInt("erythrocytes"), "Medicinefont2", 0, -75, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("monocytes") > 1 then draw.DrawText(TranslationMedicMod.Monocytes..": "..self:GetNWInt("monocytes"), "Medicinefont2", 0, -60, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Monocytes..": "..self:GetNWInt("monocytes"), "Medicinefont2", 0, -60, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("b_limphocytes") > 3 then draw.DrawText(TranslationMedicMod.Blymphocytes..": "..self:GetNWInt("b_limphocytes"), "Medicinefont2", 0, -45, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Blymphocytes..": "..self:GetNWInt("b_limphocytes"), "Medicinefont2", 0, -45, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("thrombocytes") < 120 then draw.DrawText(TranslationMedicMod.Thrombocytes..": "..self:GetNWInt("thrombocytes"), "Medicinefont2", 0, -30, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Thrombocytes..": "..self:GetNWInt("thrombocytes"), "Medicinefont2", 0, -30, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
		end
    cam.End3D2D()
	
	if LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "medic_blood" then
		cam.Start3D2D(self:GetPos()+Vector(0,0,22), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15)
			draw.SimpleTextOutlined(TranslationMedicMod.PRESSLMB,"Medicinefont1",0,0,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			draw.SimpleTextOutlined(TranslationMedicMod.PUTANALYSIS,"Medicinefont1",0,-20,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			surface.SetDrawColor(SurfaceWhite)
			surface.SetMaterial(Material("pills/arrow_down.png"))
			surface.DrawTexturedRect(-15,10,30,30)
		cam.End3D2D()
	end
end