mob
	var
		health = 100
		maxhealth = 100
		shockdamage
		shock
		damage
		staminadamage
		attackDesc
		isDead
		weaponName
		attackSpeed
		attackcooldown = 0
		weapontype
obj
	var
		damage
		shockdamage
		overlayicon
		overlayiconstate
		staminadamage
		itemdescription
		attackDesc
		attackSpeed
		weapontype
	weapon
		billhook
			name= "Billhook"
			itemdescription= "A sharp cleaver, pretty good at cutting up meat. Lethal."
			attackDesc="rips into"
			damage=10
			shockdamage=0
			icon='melee.dmi'
			icon_state="billhook"
			overlayicon='overlayweapon.dmi'
			overlayiconstate="billhook"
			staminadamage = 20
			attackSpeed = 20
			weapontype = "sword"
			verb
				Take()
					set src in oview(1)
					Move(usr)
				Equip()
					Equip_or_Unequip()
	weapon
		woodenbat
			name= "Wooden Bat"
			itemdescription= "A blunt wooden bat, good for a concussion. Non Lethal."
			attackDesc="bashes"
			damage=0
			shockdamage=20
			icon='melee.dmi'
			icon_state="woodenbat"
			overlayicon='overlayweapon.dmi'
			overlayiconstate="woodenbat"
			staminadamage = 15
			attackSpeed = 30
			weapontype = "woodenblunt"
			verb
				Take()
					set src in oview(1)
					Move(usr)
				Equip()
					Equip_or_Unequip()
	weapon
		metalbat
			name= "Metal Bat"
			itemdescription= "A blunt metal bat, good for a concussion. Lethal."
			attackDesc="bashes"
			damage=2
			shockdamage=3
			icon='melee.dmi'
			icon_state="metalbat"
			overlayicon='overlayweapon.dmi'
			overlayiconstate="metalbat"
			staminadamage = 20
			attackSpeed = 30
			weapontype = "metalblunt"
			verb
				Take()
					set src in oview(1)
					Move(usr)
				Equip()
					Equip_or_Unequip()
	proc
		Equip_or_Unequip()
			usr.damage = src.damage
			usr.shockdamage = src.shockdamage
			usr.staminadamage = src.staminadamage
			usr.overlays -= usr.overlays
			usr.overlays += icon(src.overlayicon,src.overlayiconstate)
			usr.weaponName = src.name
			usr.attackDesc = src.attackDesc
			usr.attackSpeed = src.attackSpeed
			usr.weapontype = src.weapontype
			usr<<"You equipped the [src.name]"
mob
	dummy
		icon='player.dmi'
		icon_state = "The Boy With Blonde Hair"
		health=100
		stamina=100
		shock=0
		Click()
			DealDamage()
		verb
			checkhealth()
				usr<<"src.health"
mob
	proc
		DealDamage()
			if(usr.attackcooldown==0)
				if (src.isDead==1)
					view()<<"[usr.name] [usr.attackDesc] the [src.name]'s corpse with a [usr.weaponName]"
				else
					if(usr.stamina >=usr.staminadamage)
						src.health -= usr.damage
						src.shock -= usr.shockdamage
						usr.stamina -= usr.staminadamage
						view()<<"[usr.name] [usr.attackDesc] [src.name] with a [usr.weaponName]"
						if(usr.weapontype == "sword")
							view()<<sound('billhook.wav')
						if(usr.weapontype == "metalblunt")
							view()<<sound('metalblunt.ogg')
						if(usr.weapontype == "woodenblunt")
							view()<<sound('woodenblunt.ogg')
						CheckHealth()
						usr.attackcooldown= 1
						sleep usr.attackSpeed
						usr.attackcooldown=0
						sleep 10
						RegenStam()

					else
						usr<<"You are too tired to do this"
						RegenStam()
			else
				usr<<"You must wait!"
		CheckHealth()
			if(src.health <= 20)
				LowHealth()
			if(src.health <= 0)
				usr<<"you died!"
				Death()
		Death()
			src.isDead = 1
			view()<<"[src.name] collapses to the ground and stops breathing."
		LowHealth()
			src<<"You feel incredibly weak..."