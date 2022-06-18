// NPC CODE
// BY LUA

var
	list/shop = list("Sword", "Gun")

mob
	var
		message = "r"
	NPC
		Shopkeeper
			icon = 'npc.dmi'
			icon_state = "shop"
			Click()
				message = "Shopkeeper says, 'Hello. Would you like some crack?'"
				usr << message
				var dlg = input("What would you like to buy?", "Shop", null) in shop
				currency -= 2
				usr << "You bought [dlg] for $2. You now have $[currency]."
				inventory.Add(dlg)
		The_Thing
			icon = 'npc.dmi'
			icon_state = "thing"
			Click()

			New()
				..()
				while(1)
					walk_rand(src)
					sleep(1)
