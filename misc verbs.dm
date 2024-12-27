mob
	verb
		ShiftNorth()
			set hidden = 1
			if(usr.unconscious==1)return
			usr.dir=NORTH
		ShiftSouth()
			set hidden = 1
			if(usr.unconscious==1)return
			usr.dir=SOUTH
		ShiftWest()
			set hidden = 1
			if(usr.unconscious==1)return
			usr.dir=WEST
		ShiftEast()
			set hidden = 1
			if(usr.unconscious==1)return
			usr.dir=EAST