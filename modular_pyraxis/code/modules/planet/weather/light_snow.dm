/datum/weather/pyraxis/light_snow
	name = "light snow"
	icon_state = "snowfall_light"
	light_modifier = 0.7
	transition_chances = list()
	observed_message = "It is snowing lightly."
	transition_messages = list(
		"Small snowflakes begin to fall from above.",
		"It begins to snow lightly.",
		)
	imminent_transition_message = "It appears a light snow is about to start."

/datum/weather/pyraxis/light_snow/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_SNOW = 15,
				WEATHER_LIGHT_SNOW = 30,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 2
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 20,
				WEATHER_SNOW = 5,
				WEATHER_LIGHT_SNOW = 10,
				WEATHER_RAIN = 10,
				WEATHER_HAIL = 5
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 15,
				WEATHER_LIGHT_SNOW = 35,
				WEATHER_RAIN = 10,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 2
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_LIGHT_SNOW = 25,
				WEATHER_SNOW = 25,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 10,
			)
	. = ..()

/datum/weather/pyraxis/light_snow/process_effects()
	..()
	snow_effect(95)
