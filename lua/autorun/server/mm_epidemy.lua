if CLIENT then return end
hook.Add( "Think", "EpidemicMod", function()
	for k, ply in pairs ( player.GetAll() ) do
		if (!ply.nextuse or CurTime() >= ply.nextuse) then
			for _, v in pairs(ents.FindInSphere(ply:GetPos(), 100)) do
				if v:IsPlayer() and v != ply and v:Alive() and ply:Alive() then
				
					if v:GetNWInt("EpidemicModFluH1N1") < 100 then
						local rand = math.random(1,100)
						if rand <= 10 then
							ply:SetNWInt("EpidemicModFluH1N1", ply:GetNWInt("EpidemicModFluH1N1")-1)
						end
					end
					
					if v:GetNWInt("EpidemicModFluH5N1") < 100 then
						local rand = math.random(1,100)
						if rand <= 5 then
							ply:SetNWInt("EpidemicModFluH5N1", ply:GetNWInt("EpidemicModFluH5N1")-1)
						end
					end
					
				end
			end
			ply.nextuse = CurTime() + 1
		end
	end
end)