// LOS:REMAKE CODE
// BY LUA AND JIMMY CHEN

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)
	name = "The Land of Stuff"


// Make objects move 8 pixels per tick when walking

mob
	icon = 'player.dmi'
	icon_state = "player"
	step_size = 8
	var
		health = 100
	var
		object = list("carpet", "grass", "sidewalk", "stone", "tree")

	verb
		say(msg as text)
			world << "[usr] says, '[msg]'"
		Debug()
			if (client.key == "Suspecting")
				usr.icon_state = "invis"
				density = 0
			else
				usr << "You don't have access to this command."

	Click(mob/M in oview(1))
		if (M in object)
			return //nothing happens
		else
			M << "[usr] attacked you!"
			usr << "You attacked [M]!"

obj
	step_size = 8

var
	currency = 0

mob
	NPC
		Shopkeeper
			icon = 'npc.dmi'
			icon_state = "shop"
			Click()
				usr << "Hi"