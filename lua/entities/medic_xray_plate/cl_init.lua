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
		surface.DrawRect(-10, -55, 100, 100)
		
    	surface.SetDrawColor(col1)
		if self:GetNWString("organ") == "costae" then
			if self:GetNWBool("have_traumacostae") == true then
				surface.SetMaterial(Material("r_t_thorax.png"))
			else
				surface.SetMaterial(Material("r_n_thorax.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		elseif self:GetNWString("organ") == "arm" then
			if self:GetNWBool("have_traumaarm") == true then
				surface.SetMaterial(Material("r_t_arm.png"))
			else
				surface.SetMaterial(Material("r_n_arm.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		elseif self:GetNWString("organ") == "legs" then
			if self:GetNWBool("have_traumalegs") == true then
				surface.SetMaterial(Material("r_t_leg.png"))
			else
				surface.SetMaterial(Material("r_n_leg.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		elseif self:GetNWString("organ") == "head" then
			if self:GetNWBool("have_traumahead") == true then
				surface.SetMaterial(Material("r_t_head.png"))
			else
				surface.SetMaterial(Material("r_n_head.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		elseif self:GetNWString("organ") == "stomach" then
			if self:GetNWBool("have_traumastomach") == true then
				surface.SetMaterial(Material("r_t_stomach.png"))
			else
				surface.SetMaterial(Material("r_n_stomach.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		elseif self:GetNWString("organ") == "penis" then
			if self:GetNWBool("have_traumapenis") == true then
				surface.SetMaterial(Material("r_t_pelvis.png"))
			else
				surface.SetMaterial(Material("r_n_pelvis.png"))
			end
			surface.DrawTexturedRect(-10, -55, 100, 100)
		end
        --draw.DrawText(self:GetNWString("patient_name"), "Medicinefont2", 13, 25, col1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
