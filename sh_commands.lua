-- [[ COMMANDS ]] --

--[[
	COMMAND: /Roll
	DESCRIPTION: Allows the player to roll an arbitrary amount of dice and apply bonuses as needed.
]]--

ix.command.Add("Roll", {
	syntax = "<dice roll>",
	description = "Calculates a dice roll (e.g. 2d6 + 2) and shows the result.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, rolltext)
		result, rolltext = ix.dice.Roll( rolltext, client )

		ix.chat.Send( client, "rollgeneric", tostring( result ), nil, nil,{
			roll = "( "..rolltext.." )"
		} )
	end
})

--[[
	COMMAND: /RollStat
	DESCRIPTION: Rolls a d20 and applies modifiers to the dice roll for the stat provided.
]]--

ix.command.Add("RollStat", {
	syntax = "<stat>",
	description = "Rolls and adds a bonus for the stat provided.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		local character = client:GetCharacter()
		local statname
		local bonus = 0

		for k, v in pairs(ix.attributes.list) do
			if ix.util.StringMatches(k, stat) or ix.util.StringMatches(v.name, stat) then
				stat = k
				statname = v.name
				bonus = character:GetAttribute(stat, 0)
			end
		end

		if not (statname) then
			for k, v in pairs(ix.skills.list) do
				if ix.util.StringMatches(k, stat) or ix.util.StringMatches(v.name, stat) then
					stat = k
					statname = v.name
					bonus = character:GetSkill(stat, 0)
				end
			end
		end

		if not statname then client:Notify( "Provided stat is invalid." ) return end

		if (character and character:GetAttribute(stat, 0)) then
			local roll1 = tostring(math.random(1, 6))
			local roll2 = tostring(math.random(1, 6))

			ix.chat.Send(client, "roll20", (roll1 + roll2 + bonus).." ( "..roll1.." + "..roll2.." + "..bonus.." )", nil, nil, {
				rolltype = statname
			})
		end
	end
})

--[[
	COMMAND: /RollAttack
	DESCRIPTION: Automatically makes an attack roll based on the weapon that the player is holding.
]]--

ix.command.Add("RollAttack", {
	syntax = nil,
	description = "Makes an attack roll and adds any modifiers.",
	arguments = nil,
	OnRun = function(self, client, stat)
		local critcolor = Color( 255, 30, 30 )
		local character = client:GetCharacter()
		local weapon = client:GetActiveWeapon()
		local statTable = weapon.ixItem.HRPGStats or weapon.HRPGStats

		if (character and statTable) then
			local bonus = character:GetAttribute( statTable.mainAttribute, 0 )
			local roll = math.random(1, 20)
			local dmg = calcDice( statTable.rollDamage )

			local chatdata = {
				damage = dmg,
				color = nil
			}

			if ( roll == 20 ) then 
				chatdata.damage = dmg * 2
				chatdata.color = critcolor 
			end

			ix.chat.Send(client, "roll20attack", (roll + bonus).." ( "..roll.." + "..bonus.." )", nil, nil, chatdata)
		end
	end
})

ix.command.Add("GetSkill", {
	syntax = "<skill>",
	description = "Gets a skill.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, skill)
		--[[for k, v in pairs( ix.skills.list ) do
			print(k)
			print(v)
		end]]
		char = client:GetCharacter()

		skilltab = char:GetAttributes()

		if ( table.IsEmpty(skilltab) ) then
			print( "Skill table is empty")
		else
			for k, v in pairs( skilltab ) do 
				print(k)
				print(v)
			end
		end
	end
})

ix.command.Add("GetTrait", {
	syntax = "<trait>",
	description = "Gets a Trait.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, trait)
		--[[for k, v in pairs( ix.skills.list ) do
			print(k)
			print(v)
		end]]
		char = client:GetCharacter()
		traittab = char:GetTraits()

		if ( table.IsEmpty(traittab) ) then
			print( "Trait table is empty")
		else
			for k, v in pairs( traittab ) do 
				print(k)
				print(v)
			end
		end
	end
})


ix.command.Add("Panic", {
	syntax = "<stat>",
	description = "Make a Panic Roll.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		local roll1 = 999
		local bonus = 0
		local character = client:GetCharacter()
		local resultStr = ""
		local totalValue = 0
		
		local cards = {
			"KEEP IT TOGETHER",
			"develop a NERVOUS TWITCH",
			"begin to TREMBLE",
			"DROP AN ITEM",
			"FREEZE",
			"attempt to SEEK COVER",
			"SCREAM",
			"attempt to FLEE",
			"go BERSERK",
			"go CATATONIC"
		}
		--[[9]]
		

		if (character and character:GetAttribute("[STRESS LEVEL]", 0)) then
			roll1 = tostring(math.random(1, 6))
			bonus = character:GetAttribute("stress", 0)
			totalValue = roll1 + bonus

			if totalValue <= 6 then
				resultStr = cards[1]
			elseif totalValue == 7 then
				resultStr = cards[2]
			elseif totalValue == 8 then
				resultStr = cards[3]
			elseif totalValue == 9 then
				resultStr = cards[4]
			elseif totalValue == 10 then
				resultStr = cards[5]
			elseif totalValue == 11 then
				resultStr = cards[6]
			elseif totalValue == 12 then
				resultStr = cards[7]
			elseif totalValue == 13 then
				resultStr = cards[8]
			elseif totalValue == 14 then
				resultStr = cards[9]
			elseif totalValue == 15 then
				resultStr = cards[10]
			else
				resultStr = cards[10]
			end

			ix.chat.Send(client, "Panic Roll", (roll1 + bonus).." ( "..roll1.." + "..bonus..") they "..resultStr, nil, nil, {
				rolltype = statname
			})
		end
	end
})

ix.command.Add("Injury", {
	description = "Make a Critical Injury Roll.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		local roll = math.random(1, 36)
		local resultStr = ""
		local character = client:GetCharacter()
		local myInjuries = {
			"become Winded (STRESS LEVEL +1)",
			"become Stunned (STRESS LEVEL +1)",
			"recieve Crippling Pain (STRESS LEVEL +1)",
			"recieve a Sprained Ankle (MOBILITY -2 until given aid)",
			"recieve Blood in Their Eyes (OBSERVATION and RANGED COMBAT -2 until given aid)",
			"recieve a Concussion (MOBILITY -2 for remainder of session)",
			"recieve a Severed Ear (STRESS LEVEL +1 and OBSERVATION -2 for remainder of session)",
			"recieve Broken Toes (MOBILITY -2 until given aid)",
			"recieve a Broken Hand (Unable to use hand until given aid)",
			"recieve Knocked Out Teeth (MANIPULATION and COMMAND -2 for remainder of session)",
			"recieve an Impaled Thigh (MOBILITY -2 until given aid)",
			"recieve a Slashed Shoulder (Can't use arm until given aid)",
			"recieve a Broken Nose (MANIPULATION and OBSERVATION -1 for remainder of session)",
			"are Hit in the Crotch (MOBILITY -2 for remainder of session)",
			"recieve Broken Ribs (MOBILITY and CLOSE COMBAT -2)",
			"recieve a Gouged Eye (RANGED COMBAT and OBSERVATION perminently reduced by -2)",
			"recieve a Busted Kneecap (Can't run, only crawl. MOBILITY -1 until given aid)",
			"recieve a Broken Arm (Unable to use arm until given aid)",
			"recieve a Broken Leg (Can't run, only crawl. MOBILITY -2 until given aid)",
			"recieve a Crushed Foot (Can't run, only crawl. MOBILITY -1 until given aid)",
			"recieve a Crushed Elbow (Unable to use arm until given aid)",
			"recieve a Punctured Lung (AGILITY and MOBILITY -2, FATAL if aid is not given by the end of the session)",
			"recieve a Bleeding Gut (MOBILITY and CLOSE COMBAT -2, FATAL if aid is not given by the end of the session)",
			"recieve Ruptured Intestines (MOBILITY and CLOSE COMBAT -2, FATAL if aid is not given by the end of the session)",
			"recieve a Busted Kidney (MOBILITY and CLOSE COMBAT -2, FATAL if aid is not given by the end of the session)",
			"have their Arm Artery Cut (Can't use arm, FATAL after ONE ROUND if aid is not given)",
			"have their Leg Artery Cut (Can't run, FATAL after ONE ROUND if aid is not given)",
			"recieve a Severed Arm (Can't use arm, FATAL after ONE ROUND if aid is not given)",
			"recieve a Severed Leg (Can't use leg, only crawl, FATAL after ONE ROUND if aid is not given)",
			"recieve a Cracked Spine (Paralized from the neck down, PERMINENT after ONE ROUND if aid is not given)",
			"recieve a Ruptured Jugular (AGILITY -1, FATAL after ONE TURN if aid is not given)",
			"recieve a Ruptured Aorta (AGILITY -2, FATAL after ONE TURN if aid is not given)",
			"are Disemboweled (Instant death)",
			"recieve a Crushed Skull (Your story ends here)",
			"recieve a Pierced Head (You die immediately)",
			"recieve an Impaled Heart (Your heart beats for the last time)"
		}
		local receivers = {}
	
		--[[resultStr = injuries[roll]]--
	
		for _, v in ipairs(player.GetAll()) do
																if v:IsAdmin() or v:IsSuperAdmin() then
				table.insert(receivers, v)
			end
		end

		character:SetSkill("Mobility", 4)

		resultStr = myInjuries[roll]
		ix.chat.Send(client, "Injury Roll", (roll).." ( "..roll..") they.12221"..resultStr, nil, nil, {
		})

		
		if roll <= 3 then
			character:UpdateAttrib("stress",1)
		elseif roll > 20 then
			character:GetSkill(stat, 0)
		else
			roll = 9
		end
	end
})

ix.command.Add("TraitFind", {
	syntax = "<stat>",
	description = "Make a Panic Roll.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		local roll1 = 999
		local charater = client:GetCharacter()
		--[[if(char and char:GetTrait("Subdue", 0))]]
		local myTrait = charater:GetTrait("Subdue", 0)

		ix.chat.Send(client, "Find Trait","stuff:"..tostring( myTrait ).." ;", nil, nil)
	end
})

if SERVER then
	util.AddNetworkString( "ixTestDerma" )
else
	net.Receive( "ixTestDerma", function()
		local frame = vgui.Create( "DFrame" )
		frame:SetPos( 500, 500 )
		frame:SetSize( 200, 300 )
		frame:SetTitle( "Frame" )
		frame:MakePopup()
		 
		local grid = vgui.Create( "DGrid", frame )
		grid:SetPos( 10, 30 )
		grid:SetCols( 5 )
		grid:SetColWide( 36 )
		 
		for i = 1, 30 do
			local but = vgui.Create( "DButton" )
			but:SetText( i )
			but:SetSize( 30, 20 )
			grid:AddItem( but )
		end
	end)
end

ix.command.Add("DermaTest", {
	syntax = "",
	description = "Tests Derma",
	OnRun = function(self, client, skill)
		net.Start( "ixTestDerma" )
		net.Send(client)
	end
})


ix.command.Add("AC", {
	syntax = "<stat>",
	description = "Show AC.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		local character = client:GetCharacter()
		if (character and character:GetAttribute("Wits", 0)) then
			witsVal = character:GetAttribute("wits", 0)
			defVal = 4
			bonus = witsVal + defVal
		end

		ix.chat.Send(client, "Armour Class", " Armour class value is: "..(bonus), nil, nil, {
			rolltype = statname
		})
	end
})

ix.command.Add("RaiseStressEveryone", {
	syntax = "<stat>",
	description = "Raise the stress of all users.",
	arguments = {
		ix.type.text
	},
	OnRun = function(self, client, stat)
		for client, character in ix.util.GetCharacters() do
			character:UpdateAttrib("stress", 1)
		end

		ix.chat.Send(client, "Generic", "", nil, nil, {
			rolltype = statname
		})
	end
})
