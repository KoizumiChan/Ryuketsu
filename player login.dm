mob
	Login()
		world << "<b><font color=aqua><small>RAVEN BOT</small></b> </font>[src.key]([src.name]) logs in."
		icon='player.dmi'
		icon_state="The Girl With a Hat"
		usr.character = "The Girl with a Hat"
		src.loc = locate(10,7,1)
		usr.health = 100
		usr.stamina = 100
		usr.shock = 0
		step_size = 8
		hpbar = new/obj/maskbar/HP()
		stambar = new/obj/maskbar/Stam()
		shockbar = new/obj/maskbar/Shock()
		client.screen.Add(hpbar)
		client.screen.Add(stambar)
		client.screen.Add(shockbar)
		client.UpdateUI()
		..()
	Logout()
		world << "<b><font color=navy><small>CROW BOT</small></b> </font>[src.key]([src.name]) logs out."
	verb
		TestDamage()
			usr<<"You hurt yourself!"
			health -= 10
			client.UpdateUI()