/datum/weather/virgo4/snow
	name = "moderate snow"
	icon_state = "snowfall_med"
	wind_high = 2
	wind_low = 0
	light_modifier = 0.5
	flight_failure_modifier = 5
	transition_chances = list()
	observed_message = "It is snowing."
	transition_messages = list(
		"It's starting to snow.",
		"The air feels much colder as snowflakes fall from above."
	)
	imminent_transition_message = "A snowfall is starting."
	outdoor_sounds_type = /datum/looping_sound/weather/outside_snow
	indoor_sounds_type = /datum/looping_sound/weather/inside_snow

/datum/weather/pyraxis/snow/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 15,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_SNOW = 25,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 5
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 10,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_HAIL = 5
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_RAIN = 10,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 2
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_LIGHT_SNOW = 25,
				WEATHER_SNOW = 15,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 5,
			)
	. = ..()

/datum/weather/pyraxis/snow/planet_effect(mob/living/L)
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

/datum/weather/pyraxis/snow/process_effects()
	..()
	snow_effect(90)
