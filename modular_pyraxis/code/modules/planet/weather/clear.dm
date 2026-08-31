/datum/weather/pyraxis/clear
	name = "clear"
	wind_high = 2
	wind_low = 1
	transition_chances = list()
	observed_message = "The sky is clear."
	transition_messages = list(
		"The sky clears up.",
		"The sky is visible.",
		"The weather is calm."
		)
	sky_visible = TRUE
	color_grading = COLORTINT_COZY

/datum/weather/pyraxis/clear/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_CLEAR = 15,
				WEATHER_OVERCAST = 40,
				WEATHER_FOG = 5
			)
		if("summer")
			transition_chances = list(
				WEATHER_CLEAR = 20,
				WEATHER_OVERCAST = 30
			)
		if("autumn")
			transition_chances = list(
				WEATHER_CLEAR = 15,
				WEATHER_OVERCAST = 35
			)
		if("winter")
			transition_chances = list(
				WEATHER_CLEAR = 5,
				WEATHER_OVERCAST = 50
			)
	. = ..()

/datum/weather/pyraxis/clear/process_effects()
	..()
	clear_effect(25)
