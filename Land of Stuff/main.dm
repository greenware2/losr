// LOS:REMAKE CODE
// BY LUA AND JIMMY CHEN

world
	fps = 60		// now 30fps
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)
	name = "The Land of Stuff"


mob
	icon = 'player.dmi'
	icon_state = "player"
	step_size = 6
	var
		rules = "" // link to your rules
		HP = 100
		maxHP = 100
		currency = 20
		list/inventory = list("Reheal", "e")
		hand = ""
	Login()
		..()
		world << "<b>[usr]</b> has just joined. Please give them a warm welcome!"
		usr << "Welcome to the Land of Stuff. Please <a href='[rules]'>read the rules</a>."

	verb
		say(msg as text)
			world << "<b>[usr]</b> says, '[msg]'"
		Debug()
			set category = "Admin"
			if (client.key == "Suspecting")
				usr.icon_state = "invis"
				density = 0
			else
				usr << "You don't have access to this command."
		Inventory()
			var inv = input("What would you like to use?", "Inventory") in inventory
			hand = inv
			usr << "You now have [hand] equipped."
	Click()
		if(usr == src || get_dist(usr, src) > 1) return
		oview(6) << "[usr] attacked [src]!"
		src.HP -= 4

obj
	step_size = 6