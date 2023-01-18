
ITEM.name = "Bandage Test"
ITEM.model = Model("models/carlsmei/escapefromtarkov/medical/bandage_army.mdl")
ITEM.description = "Sterilized bandage wrapped in camoflauge plastic."
ITEM.category = "TEST"
ITEM.price = 18

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 10, 100))

		ix.chat.Send(client, "bandage", "hi", nil, nil, {
		})
	end
}