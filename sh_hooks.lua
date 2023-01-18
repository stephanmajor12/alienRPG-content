-- [[ HOOKS ]] --

function PLUGIN:GetMaximumAttributePoints()

	return ix.config.Get( "maxAttributes", 5 )

end

function PLUGIN:GetMaximumSkillPoints()

	return ix.config.Get( "maxSkills", 10 )

end

function PLUGIN:GetDefaultTraitPoints()

	return ix.config.Get( "maxTraits", 3 )

end

function PLUGIN:GetDefaultAttributePoints( client )

	return ix.config.Get( "startingAttributePoints", 10 )

end

function PLUGIN:GetDefaultSkillPoints( client )

	return ix.config.Get( "startingSkillPoints", 20 )

end

function PLUGIN:PlayerDeath( victim, inflictor, attacker )
	local character = victim:GetCharacter()
	local bonus = character:GetAttribute("con", 0)
	local roll = math.random(1, 36)
	local resultStr = ""
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

	resultStr = myInjuries[roll]
	

	ix.chat.Send(victim, "critinjury", "for a Critical Injury, they "..resultStr.."!", nil, receivers, { max = maximum })
end