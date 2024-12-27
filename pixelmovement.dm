/*

// File:    Movement.dm
// Library: Xirre.MultiKeyMovement
// Author:  Xirre

Notes: Make sure to disable default macros but have your macro name in your skins set to "macro".

*/

//Initialize the script.
client
	New()
		SetMacros()
		..()

	var
		step_dir = 0 // Direction the user is facing


	verb
		KeyDown(n as num)
			set hidden = 1
			step_dir += n
			walk(src.mob, step_dir)
			if(n == 1)
				usr.IsPressingW = 1
			if(n == 2)
				usr.IsPressingS = 1
			if(n == 8)
				usr.IsPressingA = 1
			if(n == 4)
				usr.IsPressingD = 1
			if (usr.IsMoving == 1)
				return
			else
				if(usr.unconscious == 1)
					return
				else
					usr.IsMoving = 1
					mob.StepSound()
		KeyUp(n as num)
			set hidden = 1
			step_dir -= n
			if(step_dir <= 0)
				step_dir = 0
				walk(src.mob,null)
			else
				walk(src.mob, step_dir)
			if(n == 1)
				usr.IsPressingW = 0
			if(n == 2)
				usr.IsPressingS = 0
			if(n == 8)
				usr.IsPressingA = 0
			if(n == 4)
				usr.IsPressingD = 0
			if(usr.IsPressingA == 0)
				if(usr.IsPressingD == 0)
					if(usr.IsPressingW ==0)
						if (usr.IsPressingS == 0)
							usr.IsMoving = 0


		// Set the macros to be used
		SetMacros()
			var/list/directions = list(
				"w" = 1,
				"s" = 2,
				"a" = 8,
				"d" = 4,
				"North" = 1,
				"South" = 2,
				"West" = 8,
				"East" = 4
			) //List of directions to be used.

			for(var/i in directions)
				var/d = directions[i]
				winset(src, "[i]macro", "parent=macro;name=[i];command=[url_encode("KeyDown [d]")]")
				winset(src, "[i]macroUp", "parent=macro;name=[i]+UP;command=[url_encode("KeyUp [d]")]")