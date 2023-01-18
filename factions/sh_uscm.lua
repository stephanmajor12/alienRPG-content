
-- Since this faction is not a default, any player that wants to become part of this faction will need to be manually
-- whitelisted by an administrator.

FACTION.name = "United States Colonial Marine Corps"
FACTION.isDefault = false
FACTION.description = "The United America's force-in-readiness, known to operate far from home without any support."
FACTION.color = Color(95, 127, 63)
FACTION.isGloballyRecognized = true -- Makes it so that everyone knows the name of the characters in this faction.


-- Note that FACTION.models is optional. If it is not defined, it will use all the standard HL2 citizen models.
FACTION.models = {
	"models/playermodels/colonialmarines/colonialmarine_01.mdl",
	"models/playermodels/colonialmarines/colonialmarine_02.mdl",
	"models/playermodels/colonialmarines/colonialmarine_03.mdl",
	"models/playermodels/colonialmarines/colonialmarine_04.mdl",
	"models/playermodels/colonialmarines/colonialmarine_05.mdl",
	"models/playermodels/colonialmarines/colonialmarine_06.mdl",
	"models/playermodels/colonialmarines/colonialmarine_07.mdl",
	"models/playermodels/colonialmarines/colonialmarine_08.mdl",
	"models/playermodels/colonialmarines/colonialmarine_09.mdl",
	"models/playermodels/colonialmarines/colonialmarine_10.mdl",
	"models/playermodels/colonialmarines/female_colonialmarine_11.mdl",
	"models/playermodels/colonialmarines/female_colonialmarine_12.mdl",
	"models/playermodels/colonialmarines/female_colonialmarine_13.mdl",
	"models/playermodels/colonialmarines/female_colonialmarine_14.mdl",
	"models/playermodels/colonialmarines/female_colonialmarine_15.mdl",
}

FACTION_USCM = FACTION.index