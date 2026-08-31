/datum/weather/pyraxis/hail
	name = "hail"
	icon_state = "hail"
	temp_low = 243.15	// -30c
	light_modifier = 0.3
	flight_failure_modifier = 15
	timer_low_bound = 2
	timer_high_bound = 5
	effect_message = span_warning("The hail smacks into you!")

	transition_chances = list()
	observed_message = "Ice is falling from the sky."
	transition_messages = list(
		"Ice begins to fall from the sky.",
		"It begins to hail.",
		"An intense chill is felt, and chunks of ice start to fall from the sky, towards you."
	)
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_HUMANS

/datum/weather/pyraxis/hail/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 15,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_HAIL = 20,
				WEATHER_BLIZZARD = 5
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 10,
				WEATHER_LIGHT_SNOW = 5,
				WEATHER_HAIL = 10
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_LIGHT_SNOW = 10,
				WEATHER_RAIN = 10,
				WEATHER_HAIL = 20,
				WEATHER_BLIZZARD = 5
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_LIGHT_SNOW = 20,
				WEATHER_SNOW = 10,
				WEATHER_HAIL = 30,
				WEATHER_BLIZZARD = 5,
			)
	. = ..()

/datum/weather/pyraxis/hail/planet_effect(mob/living/carbon/H)
	if(H.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(H)
		if(!T.is_outdoors())
			return // They're indoors, so no need to pelt them with ice.

		// If they have an open umbrella, it'll guard from hail
		var/obj/item/melee/umbrella/U = H.get_active_hand()
		if(!istype(U) || !U.open)
			U = H.get_inactive_hand()

		if(istype(U) && U.open)
			if(show_message)
				to_chat(H, span_notice("Hail patters onto your umbrella."))
			return

		var/target_zone = pick(BP_ALL)
		var/amount_blocked = H.run_armor_check(target_zone, "melee")

		var/damage = rand(1,3)

		if(amount_blocked >= 30)
			return // No need to apply damage. Hardhats are 30. They should probably protect you from hail on your head.
			//Voidsuits are likewise 40, and riot, 80. Clothes are all less than 30.

		H.apply_damage(damage, BRUTE, target_zone, amount_blocked, used_weapon = "hail")
		if(show_message)
			to_chat(H, effect_message)

/datum/weather/pyraxis/snow/process_effects()
	..()
	snow_effect(75)
