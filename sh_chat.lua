-- [[ COMMANDS ]] --

--[[
	CHAT: rollgeneric
	DESCRIPTION: Highlights generic rolls made with arbitrary dice and bonuses.
]]--

ix.chat.Register("rollgeneric", {
	format = "** %s has rolled %s %s on their roll.", 
	color = Color(150, 125, 175),
	CanHear = ix.config.Get("chatRange", 280),
	deadCanChat = true,
	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.roll
		))
	end
})

--[[
	CHAT: roll20
	DESCRIPTION: Highlights rolls made with a d20.
]]--

ix.chat.Register("roll20", {
	format = "** %s has rolled %s on their %s roll.",
	color = Color(150, 125, 175),
	CanHear = ix.config.Get("chatRange", 280),
	deadCanChat = true,
	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.rolltype
		))
	end
})

--[[
	CHAT: roll20attack
	DESCRIPTION: Highlights attack rolls made with a d20.
]]--

ix.chat.Register("roll20attack", {
	format = "** %s has rolled %s on their Attack roll for %s damage.", --"** %s has rolled %s on their Attack roll for %s %s damage."
	color = Color(150, 125, 175),
	CanHear = ix.config.Get("chatRange", 280),
	deadCanChat = true,
	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(data.color or self.color, string.format(self.format,
			speaker:GetName(), text, data.damage
		))
	end
})

ix.chat.Register("Panic Roll", {
	format = "* %s has made a Panic Roll %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})

ix.chat.Register("Injury Roll", {
	format = "* %s has rolled for a Critical Injury, %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})

ix.chat.Register("Find Trait", {
	format = "* %s has %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})

ix.chat.Register("Armour Class", {
	format = "* %s command %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})

ix.chat.Register("Generic", {
	format = "* %s Generic, %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})

ix.chat.Register("TEST", {
	format = "* %s command %s ",
	color = Color(150, 100, 100),
	CanHear = ix.config.Get("chatRange", 200),
	deadCanChat = true,
	OnChatAdd = function (self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.myText
		))
	end
})