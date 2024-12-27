mob
	verb
		Say(T as text)
			if (usr.dead == 1)
				return
			if (usr.watcher == 1)
				return
			if (usr.ingame == 0)
				return
			if (usr.gagged ==1)
				usr << "Your mouth is gagged!"
			if (usr.unconscious == 1)
				usr << "You are unconscious!"
			else
				view()<<"<STYLE>BODY IMG.icon {width: 20px; height: 20px}</STYLE><IMG CLASS=icon SRC=\ref['face.dmi'] ICONSTATE=\"[usr.icon_state]\">[usr.icon_state] says:[T]"
		Whisper(T as text)
			if (usr.dead == 1)
				return
			if (usr.watcher == 1)
				return
			if (usr.ingame == 0)
				return
			if (usr.gagged ==1)
				usr << "Your mouth is gagged!"
			if (usr.unconscious == 1)
				usr << "You are unconscious!"
			else
				view(2)<<"[usr.icon_state] whispers:[T]"
				view(4)<<"[usr.icon_state] whispers something."
		Shout(T as text)
			if (usr.dead == 1)
				return
			if (usr.watcher == 1)
				return
			if (usr.ingame == 0)
				return
			if (usr.gagged ==1)
				usr << "Your mouth is gagged!"
			if (usr.unconscious == 1)
				usr << "You are unconscious!"
			else
				world<<"[usr.icon_state] whispers:[T]"
