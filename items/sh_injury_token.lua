
ITEM.name = "Injury Token"
ITEM.model = Model("models/cards/chip.mdl")
ITEM.description = "This token sets an attribute or skill."

ITEM.functions.Consume = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
        local char = client:GetCharacter()

        char:AddBoost("tempboost","Wits",1)
	end
}