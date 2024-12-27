mob
	var
		dead = 0
		watcher = 0
		ingame = 1
		gagged = 0
		unconscious = 0
		character
		isBloody = 0
		obj/maskbar/hpbar
		obj/maskbar/stambar
		obj/maskbar/shockbar
mob
	Stat()
		stat("description",src.desc)
		if(src == usr)
			stat("health",src.health)
			stat("stamina",src.stamina)
			stat("shock",src.shock)