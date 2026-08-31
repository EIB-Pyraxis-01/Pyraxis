/datum/weather/pyraxis/storm
	name = "storm"
	icon_state = "storm"
	wind_high = 4
	wind_low = 2
	light_modifier = 0.3
	flight_failure_modifier = 10
	effect_message = span_warning("Rain falls on you, drenching you in water.")

	next_lightning_strike = 0 // world.time when lightning will strike.
	min_lightning_cooldown = 5 SECONDS
	max_lightning_cooldown = 1 MINUTE

	observed_message = "An intense storm pours down over the region."
	transition_messages = list(
		"You feel intense winds hit you as the weather takes a turn for the worst.",
		"Loud thunder is heard in the distance.",
		"A bright flash heralds the approach of a storm."
	)
	imminent_transition_message = "You can hear distant thunder. Storm is coming."
	outdoor_sounds_type = /datum/looping_sound/weather/rain
	indoor_sounds_type = /datum/looping_sound/weather/rain/indoors
	effect_flags  = HAS_PLANET_EFFECT | EFFECT_ONLY_LIVING
	color_grading = COLORTINT_DIM

/datum/weather/pyraxis/storm/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_RAIN = 15,
				WEATHER_STORM = 20,
				WEATHER_LIGHT_SNOW = 0,
				WEATHER_HAIL = 15,
				WEATHER_BLIZZARD = 5
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_RAIN = 15,
				WEATHER_STORM = 20,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 5
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_RAIN = 25,
				WEATHER_STORM = 30,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 5
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_RAIN = 25,
				WEATHER_STORM = 20,
				WEATHER_SNOW = 5,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 5,
			)
	. = ..()

/datum/weather/sif/storm/planet_effect(mob/living/L)
	if(L.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(L)
		if(!T.is_outdoors())
			return // They're indoors, so no need to rain on them.

		// If they have an open umbrella, it'll guard from rain
		var/obj/item/melee/umbrella/U = L.get_active_hand()
		if(!istype(U) || !U.open)
			U = L.get_inactive_hand()

		if(istype(U) && U.open)
			if(show_message)
				to_chat(L, span_notice("Rain showers loudly onto your umbrella!"))
			return


		L.water_act(2)
		if(show_message)
			to_chat(L, effect_message)

/datum/weather/pyraxis/storm/process_effects()
	..()
	clear_effect(65)
