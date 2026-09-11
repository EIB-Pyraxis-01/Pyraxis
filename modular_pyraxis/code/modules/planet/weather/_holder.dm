/datum/weather/pyraxis
	name = "pyraxis base"
	temp_low = 243.15 // -30C
	temp_high = 253.15 // -20C
	icon = 'modular_pyraxis/icons/effects/weather.dmi'

/datum/weather_holder/pyraxis
	temperature = TN60C
	allowed_weather_types = list(
		WEATHER_CLEAR 			= new /datum/weather/pyraxis/clear(),
		WEATHER_LIGHT_SNOW 		= new /datum/weather/pyraxis/light_snow(),
		WEATHER_SNOW 			= new /datum/weather/pyraxis/snow(),
		WEATHER_BLIZZARD 		= new /datum/weather/pyraxis/blizzard(),
		WEATHER_OVERCAST 		= new /datum/weather/pyraxis/clear(),
		WEATHER_FOG 			= new /datum/weather/pyraxis/fog(),
		WEATHER_RAIN 			= new /datum/weather/pyraxis/rain(),
		WEATHER_STORM 			= new /datum/weather/pyraxis/storm(),
		WEATHER_HAIL 			= new /datum/weather/pyraxis/hail(),
		WEATHER_DOWNPOURWARNING = new /datum/weather/pyraxis/downpourwarning(),
		WEATHER_DOWNPOUR 		= new /datum/weather/pyraxis/downpour(),
		WEATHER_DOWNPOURFATAL 	= new /datum/weather/pyraxis/downpourfatal()
	)
	roundstart_weather_chances = list()

/datum/weather_holder/pyraxis/New(source)
	switch(GLOB.world_time_season)
		if("spring")
			roundstart_weather_chances = list(
				WEATHER_CLEAR = 5,
				WEATHER_LIGHT_SNOW = 25,
				WEATHER_OVERCAST = 10,
				WEATHER_FOG = 10,
				WEATHER_RAIN = 40,
				WEATHER_STORM = 20,
				WEATHER_HAIL = 15,
				WEATHER_BLIZZARD = 10
			)
		if("summer")
			roundstart_weather_chances = list(
				WEATHER_CLEAR = 10,
				WEATHER_LIGHT_SNOW = 15,
				WEATHER_OVERCAST = 10,
				WEATHER_FOG = 0,
				WEATHER_RAIN = 20,
				WEATHER_STORM = 25,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 0
			)
		if("autumn")
			roundstart_weather_chances = list(
				WEATHER_CLEAR = 5,
				WEATHER_LIGHT_SNOW = 20,
				WEATHER_OVERCAST = 10,
				WEATHER_FOG = 10,
				WEATHER_RAIN = 40,
				WEATHER_STORM = 30,
				WEATHER_HAIL = 5,
				WEATHER_BLIZZARD = 0
			)
		if("winter")
			roundstart_weather_chances = list(
				WEATHER_CLEAR = 0,
				WEATHER_LIGHT_SNOW = 40,
				WEATHER_SNOW = 40,
				WEATHER_OVERCAST = 5,
				WEATHER_FOG = 5,
				WEATHER_RAIN = 0,
				WEATHER_STORM = 0,
				WEATHER_HAIL = 20,
				WEATHER_BLIZZARD = 40
			)
	. = ..()
