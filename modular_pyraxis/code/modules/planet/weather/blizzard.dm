/datum/weather/pyraxis/blizzard
	name = "blizzard"
	icon_state = "snowfall_heavy"
	temp_high = 243.15 // -30c
	temp_low = 233.15  // -40c
	wind_high = 4
	wind_low = 2
	light_modifier = 0.3
	flight_failure_modifier = 10
	transition_chances = list()
	observed_message = "A blizzard blows snow everywhere."
	transition_messages = list(
		"Strong winds howl around you as a blizzard appears.",
		"It starts snowing heavily, and it feels extremly cold now."
	)
	outdoor_sounds_type = /datum/looping_sound/weather/outside_blizzard
	indoor_sounds_type = /datum/looping_sound/weather/inside_blizzard


/datum/weather/pyraxis/blizzard/New()
	switch(GLOB.world_time_season)
		if("spring")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_SNOW = 20,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 10
			)
		if("summer")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_RAIN = 20,
				WEATHER_SNOW = 10,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 10
			)
		if("autumn")
			transition_chances = list(
				WEATHER_OVERCAST = 10,
				WEATHER_SNOW = 20,
				WEATHER_RAIN = 10,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 10
			)
		if("winter")
			transition_chances = list(
				WEATHER_OVERCAST = 5,
				WEATHER_SNOW = 15,
				WEATHER_HAIL = 10,
				WEATHER_BLIZZARD = 30,
			)
	. = ..()

/datum/weather/pyraxis/snow/process_effects()
	..()
	snow_effect(40)
