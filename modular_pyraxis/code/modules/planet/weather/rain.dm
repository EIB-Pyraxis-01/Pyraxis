/datum/weather/pyraxis/rain
	name = "rain"
	icon_state = "rain"
	wind_high = 2
	wind_low = 1
	light_modifier = 0.5
	effect_message = span_warning("Rain falls on you.")

	transition_chances = list()
	observed_message = "It is raining."
	transition_messages = list(
		"The sky is dark, and rain falls down upon you."
	)
	imminent_transition_message = "Light drips of water are starting to fall from the sky."
	outdoor_sounds_type = /datum/looping_sound/weather/rain
	indoor_sounds_type = /datum/looping_sound/weather/rain/indoors
	effect_flags  = HAS_PLANET_EFFECT | EFFECT_ONLY_LIVING
	color_grading = COLORTINT_DIM

/datum/weather/pyraxis/rain/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_RAIN = 20,
				WEATHER_STORM = 15,
				WEATHER_LIGHT_SNOW = 10,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 2
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 15,
				WEATHER_STORM = 20,
				WEATHER_LIGHT_SNOW = 5,
				WEATHER_HAIL = 5
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_LIGHT_SNOW = 10,
				WEATHER_RAIN = 30,
				WEATHER_STORM = 25,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 2
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_RAIN = 25,
				WEATHER_STORM = 10,
				WEATHER_LIGHT_SNOW = 25,
				WEATHER_SNOW = 15,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 5,
			)
	. = ..()

/datum/weather/pyraxis/rain/planet_effect(mob/living/L)
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
				to_chat(L, span_notice("Rain patters softly onto your umbrella."))
			return

		L.water_act(1)
		if(show_message)
			to_chat(L, effect_message)

/datum/weather/pyraxis/rain/process_effects()
	..()
	clear_effect(75)
