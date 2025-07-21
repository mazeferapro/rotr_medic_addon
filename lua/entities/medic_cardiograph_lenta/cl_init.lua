include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local col1 = Color(255,255,255,255)
	local col3 = Color(0,0,0,255)
	local col4 = Color(160,160,160,255)
	
	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), 0)
	ang:RotateAroundAxis(ang:Right(), 0)
	
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 50000 then return end
	
	cam.Start3D2D(pos + ang:Up()*1.2 + ang:Right()*-6 + ang:Forward()*2, ang, 0.1)
    	surface.SetDrawColor(col4)
		surface.DrawRect(-5, -50, 216, 106)
		if self:GetNWBool("have_bacstenosisclapmitralis") == true then
			surface.SetDrawColor(col4)
			surface.SetMaterial(Material("ecg_stenosis_lavc_bact.png"))
			surface.DrawTexturedRect(-5,-50,216,106)
		elseif self:GetNWBool("have_avblock") == true then
			surface.SetDrawColor(col4)
			surface.SetMaterial(Material("ecg_av_block.png"))
			surface.DrawTexturedRect(-5,-50,216,106)
		elseif self:GetNWBool("have_fungendocarditis") == true then
			surface.SetDrawColor(col4)
			surface.SetMaterial(Material("ecg_fug_endocard.png"))
			surface.DrawTexturedRect(-5,-50,216,106)
		else
			surface.SetDrawColor(col4)
			surface.SetMaterial(Material("ecg_norma.png"))
			surface.DrawTexturedRect(-5,-50,216,106)
		end
        draw.DrawText(self:GetNWString("patient_name"), "Medicinefont2", 13, 25, col1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
