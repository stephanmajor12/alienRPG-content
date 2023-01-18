
-- Since this faction is not a default, any player that wants to become part of this faction will need to be manually
-- whitelisted by an administrator.

FACTION.name = "Union of Progressive Peoples"
FACTION.isDefault = false
FACTION.description = "The workers and peasants of the Union of Progressive Peoples."
FACTION.color = Color(127, 0, 0)
FACTION.isGloballyRecognized = false -- Makes it so that everyone knows the name of the characters in this faction.


-- Note that FACTION.models is optional. If it is not defined, it will use all the standard HL2 citizen models.
FACTION.models = {
	"models/tnb/npc/male_1.mdl",
	"models/tnb/npc/male_2.mdl",
	"models/tnb/npc/male_3.mdl",
	"models/tnb/npc/male_4.mdl",
	"models/tnb/npc/male_5.mdl",
	"models/tnb/npc/male_6.mdl",
	"models/tnb/npc/male_7.mdl",
	"models/tnb/npc/male_8.mdl",
	"models/tnb/npc/male_9.mdl",
	"models/tnb/npc/female_1.mdl",
	"models/tnb/npc/female_2.mdl",
	"models/tnb/npc/female_3.mdl",
	"models/tnb/npc/female_4.mdl",
	"models/tnb/npc/female_5.mdl",
	"models/tnb/npc/female_6.mdl",
	"models/tnb/npc/female_7.mdl",
	"models/tnb/npc/female_8.mdl",
	"models/tnb/npc/female_9.mdl"
}

FACTION_PROGRESSIVEPEOPLES = FACTION.index