/datum/weather/pyraxis/overcast
	name = "overcast"
	light_modifier = 0.8
	transition_chances = list()
	observed_message = "It is overcast, all you can see are clouds."
	transition_messages = list(
		"All you can see above are clouds.",
		"Clouds cut off your view of the sky.",
		"It's very cloudy."
		)
	imminent_transition_message = "Benign clouds are quickly gathering."

/datum/weather/pyraxis/overcast/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_CLEAR = 10,
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 10,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_HAIL = 5,
				WEATHER_DOWNPOURWARNING = 1,
			)
		if("summer")
			transition_chances = list(
				WEATHER_CLEAR = 20,
				WEATHER_OVERCAST = 10,
				WEATHER_RAIN = 5,
				WEATHER_LIGHT_SNOW = 5,
				WEATHER_FOG = 2,
				WEATHER_HAIL = 2,
				WEATHER_DOWNPOURWARNING = 1,
			)
		if("autumn")
			transition_chances = list(
				WEATHER_CLEAR = 10,
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 20,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_HAIL = 5,
				WEATHER_DOWNPOURWARNING = 1,
			)
		if("winter")
			transition_chances = list(
				WEATHER_CLEAR = 5,
				WEATHER_OVERCAST = 20,
				WEATHER_RAIN = 5,
				WEATHER_LIGHT_SNOW = 20,
				WEATHER_HAIL = 10,
				WEATHER_DOWNPOURWARNING = 1,
			)
	. = ..()

/datum/weather/pyraxis/overcast/process_effects()
	..()
	clear_effect(85)
