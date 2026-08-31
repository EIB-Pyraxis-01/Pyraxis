/turf/simulated/floor/outdoors/grass/sif/seasonal
	var/snow_chance = 10

/turf/simulated/floor/outdoors/grass/sif/seasonal/Initialize(mapload)

	switch(GLOB.world_time_season)
		if("spring")
			snow_chance = 25
		if("summer")
			snow_chance = 5
		if("autumn")
			snow_chance = 10
		if("winter")
			snow_chance = 75

	if(prob(snow_chance))
		chill()

	. = ..()
