/datum/weather/pyraxis/downpour
	name = "extreme monsoon"
	icon_state = "downpour"
	light_modifier = 0.3
	timer_low_bound = 1
	timer_high_bound = 1
	wind_high = 4
	wind_low = 2
	flight_failure_modifier = 100
	effect_message = span_warning("Extreme rain is knocking you down!")

	next_lightning_strike = 0 // world.time when lightning will strike.
	min_lightning_cooldown = 5 SECONDS
	max_lightning_cooldown = 15 SECONDS

	transition_chances = list(
		WEATHER_DOWNPOURFATAL = 90,
		WEATHER_STORM = 10
	)
	observed_message = "Extreme rain is crushing you, get to cover!"
	transition_messages = list(
		span_danger("An immense downpour of falls on top of of the planet crushing anything in its path!")
	)
	outdoor_sounds_type = /datum/looping_sound/weather/rainheavy
	indoor_sounds_type = /datum/looping_sound/weather/rainindoors

/datum/weather/pyraxis/downpour/process_effects()
	..()
	for(var/mob/living/L as anything in GLOB.living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to rain on them.

			// If they have an open umbrella, knock it off, this is more then an umbrella
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				var/obj/item/melee/umbrella/U = L.get_active_hand()
				if(!istype(U) || !U.open)
					U = L.get_inactive_hand()

				if(istype(U) && U.open)
					if(show_message)
						to_chat(L, span_notice("The rain pushes the umbrella off your hands!"))
						H.drop_both_hands()

			L.water_act(2)
			L.Weaken(3)
			if(show_message)
				to_chat(L, effect_message)

	handle_lightning()

/datum/weather/pyraxis/downpour/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)

/datum/weather/pyraxis/downpourfatal
	name = "fatal monsoon"
	icon_state = "downpourfatal"
	light_modifier = 0.15
	timer_low_bound = 1
	timer_high_bound = 3
	wind_high = 6
	wind_low = 4
	flight_failure_modifier = 100
	effect_message = span_warning("Extreme rain is crushing you!")

	next_lightning_strike = 0 // world.time when lightning will strike.
	min_lightning_cooldown = 1 SECONDS
	max_lightning_cooldown = 3 SECONDS

	transition_chances = list(
		WEATHER_RAIN = 90,
		WEATHER_STORM = 10
	)
	observed_message = "Extreme rain is crushing you, get to cover!"
	//No transition message, supposed to be the 'actual' rain
	outdoor_sounds_type = /datum/looping_sound/weather/rainextreme
	indoor_sounds_type = /datum/looping_sound/weather/rainindoors

/datum/weather/pyraxis/downpourfatal/process_effects()
	..()
	for(var/mob/living/L as anything in GLOB.living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to rain on them.

			// Knock the umbrella off your hands, aint protecting you c:
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				var/obj/item/melee/umbrella/U = L.get_active_hand()
				if(!istype(U) || !U.open)
					U = L.get_inactive_hand()

				if(istype(U) && U.open)
					if(show_message)
						to_chat(L, span_notice("The rain pushes the umbrella off your hands!"))
						H.drop_both_hands()

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = L.run_armor_check(target_zone, "melee")

			var/damage = rand(10,30) //Ow

			if(amount_blocked >= 30)
				continue

			L.apply_damage(damage, BRUTE, target_zone, amount_blocked, used_weapon = "rain bludgeoning")
			L.Weaken(3)
			if(show_message)
				to_chat(L, effect_message)

	clear_effect(0)
	handle_lightning()

/datum/weather/pyraxis/downpourfatal/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)
