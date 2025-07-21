include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	local White = (Color(255, 255, 255))
	local Black = (Color(0, 0, 0))
	local SurfaceWhite = Color(255, 255, 255, 255)
	local SurfaceBlack = Color(0, 0, 0, 200)
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	
	cam.Start3D2D(Pos + Ang:Up() * 3.2 + Ang:Right() * -1 + Ang:Forward() * -12, Ang, 0.12)
        draw.DrawText("ELECTROCARDIOGRAPH", "Medicinefont3", 11, -52, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	cam.Start3D2D(Pos + Ang:Up() * 3.2 + Ang:Right() * 1.2 + Ang:Forward() * -4.7, Ang, 0.06)
		surface.SetDrawColor(SurfaceWhite)
		surface.SetMaterial(Material("pills/ecg_apparature.png"))
		surface.DrawTexturedRect(5,-70,150,150)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 3.2 + Ang:Right() * -3.4 + Ang:Forward() * -5.8, Ang, 0.06)
        draw.DrawText("CIVILFARM", "Medicinefont3", 0, -120, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Up(), -90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 5.5 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("Produced:", "Medicinefont3", 70, -70, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("11.10.2033", "Medicinefont3", 70, -50, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Right(), 90)
	cam.Start3D2D(Pos + Ang:Up() * 11 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("POWERED BY RU", "Medicinefont3", 0, -130, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HL2RP PROJECT", "Medicinefont3", 0, -110, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("AND PUTIN", "Medicinefont3", 0, -90, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Right(), 180)
	cam.Start3D2D(Pos + Ang:Up() * 11 + Ang:Right() * 5 + Ang:Forward() * -5, Ang, 0.06)
        draw.DrawText("DESIGNED", "Medicinefont3", 45, -135, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("FOR USE IN", "Medicinefont3", 45, -115, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        draw.DrawText("HOSPITAL", "Medicinefont3", 45, -95, White, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	cam.End3D2D()
	
	if LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "medic_ecg_temp" then
		cam.Start3D2D(self:GetPos()+Vector(0,0,18), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15)
			draw.SimpleTextOutlined(TranslationMedicMod.PRESSE,"Medicinefont1",0,0,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			draw.SimpleTextOutlined(TranslationMedicMod.PUTTHETAPEIN,"Medicinefont1",0,-20,col3,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Black)
			surface.SetDrawColor(SurfaceWhite)
			surface.SetMaterial(Material("pills/arrow_down.png"))
			surface.DrawTexturedRect(-15,10,30,30)
		cam.End3D2D()
	end
end