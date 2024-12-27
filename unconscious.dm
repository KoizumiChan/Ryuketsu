mob
	var
		shockcooldown = 0
	proc
		DealShock()
			if (src.shockcooldown == 1)
				return
			else
				src.shock -= usr.shockdamage
				if (src.shock >=121)
					shock = 120
					client.UpdateUI()
					DealShock()
				if (src.shock ==120)
					shockcooldown=1
					usr<<"shockcooldown"
				if (src.shockcooldown == 1)
					sleep 50
					src.shockcooldown = 0
					usr<<"shockcooldownoff"
				client.UpdateUI()
				CheckShock()
		CheckShock()
			if(src.shock >=100)
				if(src.unconscious == 0)
					src.unconscious = 1
					Unconscious()
					client.UpdateUI()
					RegenShock()
				else
					return
			if(src.shock<=99)
				if(src.unconscious == 1)
					WakeUp()
		RegenShock()
			if(src.shock >=1)
				sleep 7
				src.shock -=1
				client.UpdateUI()
				CheckShock()
				RegenShock()
			if(src.shock == 0)
				return
		Unconscious()
			usr<<"You fall unconscious"
			usr.step_size = 0.001
			usr.IsMoving = 0
			usr.sight |= BLIND
		WakeUp()
			usr<<"You wake up"
			src.unconscious = 0
			usr.step_size = 8
			StepSound()
			usr.sight &=  ~BLIND
	verb
		shockdamage()
			usr.shock += 20
			client.UpdateUI()
			DealShock()