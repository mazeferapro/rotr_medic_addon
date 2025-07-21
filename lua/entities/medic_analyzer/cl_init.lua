include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local col1 = Color(0, 0, 0, 150)
	local col2 = Color(140, 140, 0, 100)
	local col3 = Color(255,255,255,255)
	local colPathol = Color(255,180,180,255)
	local ColNormal = Color(255,255,180,255)
	local White = Color(255, 255, 255)
	local Black = Color(0, 0, 0)
	local SurfaceWhite = Color(255, 255, 255, 255)
	local SurfaceBlack = Color(0, 0, 0, 200)
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 45)
	
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	
	cam.Start3D2D(Pos + Ang:Up()*3+ Ang:Right()*-7 + Ang:Forward()*-8, Ang, 0.1)
    	surface.SetDrawColor(col1)
		surface.DrawRect(-4,-79,171,125)
		surface.SetDrawColor(col3)
		surface.SetMaterial(Material("pills/monitor.png"))
		surface.DrawTexturedRect(-4,-79,171,125)
		
		if self:GetNWBool("have_urie") == true then
			if self:GetNWInt("leukocytes") > 5 then draw.DrawText(TranslationMedicMod.Redbloodcells..": "..self:GetNWInt("leukocytes"), "Medicinefont2", 0, -77, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Redbloodcells..": "..self:GetNWInt("leukocytes"), "Medicinefont2", 0, -77, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("uria") < 5 then draw.DrawText(TranslationMedicMod.Urea..": "..self:GetNWInt("uria"), "Medicinefont2", 0, -66, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Urea..": "..self:GetNWInt("uria"), "Medicinefont2", 0, -66, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
		end
		
		if self:GetNWBool("have_blood") == true then
			if self:GetNWInt("Angitensin") > 70 then draw.DrawText(TranslationMedicMod.Angiotensin..": "..self:GetNWInt("Angitensin"), "Medicinefont2", 0, -77, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Angiotensin..": "..self:GetNWInt("Angitensin"), "Medicinefont2", 0, -77, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("uria") > 7 then draw.DrawText(TranslationMedicMod.Urea..": "..self:GetNWInt("uria"), "Medicinefont2", 0, -66, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Urea..": "..self:GetNWInt("uria"), "Medicinefont2", 0, -66, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("vasopressin") > 280 then draw.DrawText(TranslationMedicMod.ADHVasopressin..": "..self:GetNWInt("vasopressin"), "Medicinefont2", 0, -54, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.ADHVasopressin..": "..self:GetNWInt("vasopressin"), "Medicinefont2", 0, -54, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("bilirubin") < 5 or self:GetNWInt("bilirubin") > 16 then draw.DrawText(TranslationMedicMod.Bilirubin..": "..self:GetNWInt("bilirubin"), "Medicinefont2", 0, -42, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Bilirubin..": "..self:GetNWInt("bilirubin"), "Medicinefont2", 0, -42, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("alt") > 40 then draw.DrawText(TranslationMedicMod.ALT..": "..self:GetNWInt("alt"), "Medicinefont2", 0, -30, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.ALT..": "..self:GetNWInt("alt"), "Medicinefont2", 0, -30, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("ferrum") < 9 then draw.DrawText(TranslationMedicMod.Iron..": "..self:GetNWInt("ferrum"), "Medicinefont2", 0, -18, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Iron..": "..self:GetNWInt("ferrum"), "Medicinefont2", 0, -18, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("amylasa") > 100 then draw.DrawText(TranslationMedicMod.Amylase..": "..self:GetNWInt("amylasa"), "Medicinefont2", 0, -7, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Amylase..": "..self:GetNWInt("amylasa"), "Medicinefont2", 0, -7, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
			if self:GetNWInt("lipasa") > 60 then draw.DrawText(TranslationMedicMod.Lipase..": "..self:GetNWInt("lipasa"), "Medicinefont2", 0, 4, colPathol, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) else
			draw.DrawText(TranslationMedicMod.Lipase..": "..self:GetNWInt("lipasa"), "Medicinefont2", 0, 4, ColNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT) end
		end
		
    cam.End3D2D()
	
	
	Ang:RotateAroundAxis(Ang:Up(), 0)
	Ang:RotateAroundAxis(Ang:Forward(), -45)
	
	cam.Start3D2D(Pos + Ang:Up() * 3.6 + Ang:Right() * 3 + Ang:Forward() * -7.8, Ang, 0.05)
        draw.DrawText("BIO-CHEMISTRY ANALIZATOR", "Medicinefont4", 11, -52, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
		
	Ang:RotateAroundAxis(Ang:Up(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 3.6 + Ang:Right() * -1 + Ang:Forward() * -6.5, Ang, 0.06)
        draw.DrawText("CIVILFARM", "Medicinefont3", 10, -120, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Up(), -90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 5.5 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("Produced:", "Medicinefont3", 70, -70, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("11.10.2033", "Medicinefont3", 70, -50, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Right(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 9 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("POWERED BY RU", "Medicinefont3", 0, -130, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HL2RP PROJECT", "Medicinefont3", 0, -110, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("AND PUTIN", "Medicinefont3", 0, -90, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Right(), 180)
	cam.Start3D2D(Pos + Ang:Up() * 9 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("DESIGNED", "Medicinefont3", 45, -135, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("FOR USE IN", "Medicinefont3", 45, -115, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HOSPITAL", "Medicinefont3", 45, -95, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		surface.SetDrawColor(SurfaceWhite)
		surface.SetMaterial(Material("pills/combine.png"))
		surface.DrawTexturedRect(-10,-130,30,30)
	cam.End3D2D()
	
	if LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "medic_blood" then
		cam.Start3D2D(self:GetPos()+Vector(0,0,18), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15)
			draw.SimpleTextOutlined(TranslationMedicMod.PRESSLMB,"Medicinefont1",0,0,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			draw.SimpleTextOutlined(TranslationMedicMod.PUTANALYSIS,"Medicinefont1",0,-20,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			surface.SetDrawColor(SurfaceWhite)
			surface.SetMaterial(Material("pills/arrow_down.png"))
			surface.DrawTexturedRect(-15,10,30,30)
		cam.End3D2D()
	end
end
