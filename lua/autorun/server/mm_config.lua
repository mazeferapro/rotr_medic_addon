ServerMedicMod = {}

ServerMedicMod.ThinkTime = 1 -- Do not touch!!!
ServerMedicMod.NextThink = 0 -- Do not touch!!!
ServerMedicMod.NextThinkAttention = 0 -- Do not touch!!!
ServerMedicMod.NextThinkSoundPlay = 0 -- Do not touch!!!

ServerMedicMod.DiseasePerThinkTime = 0.1 -- How much is reduced in one second from 100 variable disease
ServerMedicMod.DiseaseChance = 10  -- Chance of disease in 100 (Integer)
ServerMedicMod.ThinkTimeAttention = 25 -- Delay in notification of illness
ServerMedicMod.ThinkTimeSoundPlay = 5 -- Delay on sounds made by player when sick
ServerMedicMod.EnableSound = true -- Enable sounds - moans
ServerMedicMod.EnableLegsTraum = true -- Enable leg injuries (slow running)
ServerMedicMod.EnableInteralTraum = true -- Enable internal trauma module
ServerMedicMod.EnableTraum = true -- Enable external trauma module
ServerMedicMod.EnableAllDisease = true -- Enable module of all diseases (Not injuries!)
ServerMedicMod.EnableBleeding = true -- Enable bleedings
ServerMedicMod.EnableContusion = true -- Enable concussion
ServerMedicMod.EnableChatAttention = true -- Enable chat notifications about illnesses
ServerMedicMod.EnableSurgeryPay = false -- Enable payment for transactions
ServerMedicMod.SurgeryPay = 200 -- How much money is given for a successful operation?

ServerMedicMod.EnableMedKitTreatsConcussion = true -- Enable first aid kit treats concussion
ServerMedicMod.EnableMedKitTreatsTraumaLeg = true -- Enable first aid kit treats trauma leg