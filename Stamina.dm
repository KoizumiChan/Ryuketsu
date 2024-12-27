mob
	var
		stamina = 100
		IsRunning = 0
		IsSneaking = 0
		IsPressingW = 0
		IsPressingS = 0
		IsPressingD = 0
		IsPressingA = 0
		IsMoving = 0
		stepsoundcounter = 0

mob
	proc
		RegenStam()
			if(usr.IsRunning ==1)
				return
			if(usr.attackcooldown == 0)
				if(usr.stamina <= 98)
					usr.stamina+=1
					sleep 2
					client.UpdateUI()
					RegenStam()
					return
				if(usr.stamina <= 99)
					usr.stamina+=1
					client.UpdateUI()
					sleep 2
			else
				return
			if(usr.stamina >= 100)
				usr<<"You feel good"
				return
		StepSound()
			if(usr.IsMoving == 1)
				if(usr.stepsoundcounter >=7)
					view()<<sound('footsteps.wav')
					usr.stepsoundcounter = 0
					StepSound()
				else
					if(usr.IsRunning ==1)
						usr.stepsoundcounter +=1
						sleep 1
						usr.stepsoundcounter +=1
						sleep 2
						StepSound()
					if(usr.IsRunning ==0)
						if(usr.IsSneaking == 0)
							usr.stepsoundcounter +=1
							sleep 2
							StepSound()
					if(usr.IsSneaking ==1)
						usr.stepsoundcounter +=0
						sleep 2
						StepSound()
			else
				return

		StaminaDrain()
			if(src.IsRunning == 1)
				if(src.IsMoving == 1)
					if(usr.stamina>=1)
						stamina-= 1
						sleep 1
						client.UpdateUI()
						StaminaDrain()
					if(usr.stamina <=0)
						usr.IsRunning =0
						usr.step_size = 8
						client.UpdateUI()
						RegenStam()
				else
					sleep 1
					client.UpdateUI()
					StaminaDrain()
	verb
		Run()
			if(src.IsRunning == 1)
				sleep 1
				src.stamina -= 1
				src.IsRunning = 0
				src.IsSneaking = 0
				usr.step_size = 8
				usr<<"You stop Sprinting"
				client.UpdateUI()
				RegenStam()
				return
			if(src.IsRunning == 0)
				if(src.stamina <=10)
					return
				if(src.stamina >=11)
					sleep 1
					src.IsRunning = 1
					src.IsSneaking = 0
					usr.step_size = 16
					usr<<"You begin to Sprint"
					client.UpdateUI()
					StaminaDrain()
					return
		Sneak()
			if(src.IsSneaking == 1)
				src.IsRunning = 0
				src.IsSneaking = 0
				usr.step_size = 8
				sleep 1
				usr<<"You stop Sneaking"
				return
			if(src.IsSneaking == 0)
				src.IsRunning = 0
				src.IsSneaking = 1
				usr.step_size = 4
				sleep 1
				usr<<"You begin Sneaking"
				return
		PressW()
			set hidden=1
			usr.IsPressingW = 1
			usr<<"pressw"
		ReleaseW()
			set hidden=1
			usr.IsPressingW = 0
		PressA()
			set hidden=1
			usr.IsPressingA = 1
		ReleaseA()
			set hidden=1
			usr.IsPressingA = 0
		PressS()
			set hidden=1
			usr.IsPressingS = 1
		ReleaseS()
			set hidden=1
			usr.IsPressingS = 0
		PressD()
			set hidden=1
			usr.IsPressingD = 1
		ReleaseD()
			set hidden=1
			usr.IsPressingD = 0
