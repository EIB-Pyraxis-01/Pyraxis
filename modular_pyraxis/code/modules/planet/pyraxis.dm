GLOBAL_LIST_INIT(season_modifiers, list(
    "spring" = list("brightness" = 0.05, "color" = "#CCFFCC"),
    "summer" = list("brightness" = 0.15, "color" = "#FFCC66"),
    "autumn" = list("brightness" = -0.05, "color" = "#CC8844"),
    "winter" = list("brightness" = -0.15, "color" = "#4477AA")
))

GLOBAL_DATUM(planet_pyraxis, /datum/planet/pyraxis)

/datum/planet/pyraxis
	name = "Pyraxis"
	desc = "A frigid planet, in the edge of SolGov's controlled space. Some stories talk about anomalous activities in it, but it's yet to be proven."
	current_time = new /datum/time/pyraxis
	planetary_wall_type = /turf/unsimulated/wall/planetary/sif
	cryogenic_temp_shift = TRUE

/datum/planet/pyraxis/New()
	weather_holder = new /datum/weather_holder/pyraxis(src)

/datum/planet/pyraxis/update_sun()
    ..()
    var/datum/time/time = current_time
    var/length_of_day = time.seconds_in_day / 10 / 60 / 60 // 32
    var/noon = length_of_day / 2
    var/distance_from_noon = abs(text2num(time.show_time("hh")) - noon)
    sun_position = 1 - (distance_from_noon / noon)

    var/low_brightness = null
    var/high_brightness = null

    var/low_color = null
    var/high_color = null
    var/min = 0
    var/max = 0

    switch(sun_position)
        if(0 to 0.40) // Night
            low_brightness = 0.15
            low_color = "#19195c"

            high_brightness = 0.3
            high_color = "#66004D"
            min = 0
            max = 0.40

        if(0.40 to 0.50) // Twilight
            low_brightness = 0.3
            low_color = "#66004D"

            high_brightness = 0.65
            high_color = "#CC3300"
            min = 0.40
            max = 0.50

        if(0.50 to 0.60) // Sunrise/set
            low_brightness = 0.65
            low_color = "#CC3300"

            high_brightness = 0.9
            high_color = "#FF9933"
            min = 0.50
            max = 0.60

        if(0.60 to 1.00) // Noon
            low_brightness = 0.9
            low_color = "#DDDDDD"

            high_brightness = 1.0
            high_color = "#FFFFFF"
            min = 0.60
            max = 1.00

    var/interpolate_weight = (sun_position - min) / (max - min)

    // Season modifier
    var/list/season_mod = get_season_modifier()
    var/season_brightness_mod = season_mod["brightness"]
    var/season_color = season_mod["color"]

    var/weather_light_modifier = 1
    if(weather_holder && weather_holder.current_weather)
        weather_light_modifier = weather_holder.current_weather.light_modifier

    var/new_brightness = clamp((LERP(low_brightness, high_brightness, interpolate_weight) + season_brightness_mod) * weather_light_modifier, 0, 1)

    var/new_color = null
    if(weather_holder && weather_holder.current_weather && weather_holder.current_weather.light_color)
        new_color = weather_holder.current_weather.light_color
    else
        var/list/low_color_list = hex2rgb(low_color)
        var/low_r = low_color_list[1]
        var/low_g = low_color_list[2]
        var/low_b = low_color_list[3]

        var/list/high_color_list = hex2rgb(high_color)
        var/high_r = high_color_list[1]
        var/high_g = high_color_list[2]
        var/high_b = high_color_list[3]

        var/new_r = LERP(low_r, high_r, interpolate_weight)
        var/new_g = LERP(low_g, high_g, interpolate_weight)
        var/new_b = LERP(low_b, high_b, interpolate_weight)

        new_color = rgb(new_r, new_g, new_b)
        new_color = blend_color(new_color, season_color, 0.25) // seasonal tint, 25% strength

    spawn(1)
        update_sun_deferred(new_brightness, new_color)

/datum/planet/pyraxis/proc/get_season_modifier()
    var/season_order = GLOB.world_time_season
    var/days_per_season = 365 / 4
    var/day_in_year = GLOB.world_time_day % 365

    var/season_idx = round(day_in_year / days_per_season) % 4
    var/current = season_order[season_idx + 1]
    var/next = season_order[(season_idx + 1) % 4 + 1]

    var/progress = (day_in_year % days_per_season) / days_per_season

    var/cur_mod = GLOB.season_modifiers[current]
    var/next_mod = GLOB.season_modifiers[next]

    var/brightness_mod = cur_mod["brightness"] + (next_mod["brightness"] - cur_mod["brightness"]) * progress
    var/color = blend_color(cur_mod["color"], next_mod["color"], progress)

    return list("brightness" = brightness_mod, "color" = color)

/proc/get_pyraxis_time()
	if(GLOB.planet_pyraxis)
		return GLOB.planet_pyraxis.current_time

/proc/blend_color(color_a, color_b, weight)
    var/list/a = hex2rgb(color_a)
    var/list/b = hex2rgb(color_b)
    var/r = LERP(a[1], b[1], weight)
    var/g = LERP(a[2], b[2], weight)
    var/bl = LERP(a[3], b[3], weight)
    return rgb(r, g, bl)

/datum/time/pyraxis
	seconds_in_day = 60 * 60 * 27 * 10 // 972000 seconds - 27 hours

/datum/weather/pyraxis
	var/next_lightning_strike = 0
	var/min_lightning_cooldown = 0
	var/max_lightning_cooldown = 0

/datum/weather/pyraxis/proc/snow_effect(fail_chance = 90)
	if(holder.our_planet.planet_floors.len)
		var/i = rand(5, 15)
		while(i-- > 0)
			if(prob(fail_chance))
				continue
			var/turf/T = pick(holder.our_planet.planet_floors)
			if(T.is_outdoors() && isfloor(T))
				var/turf/simulated/floor/floor = T
				floor.chill()

/datum/weather/pyraxis/proc/clear_effect(fail_chance = 90)
	if(holder.our_planet.planet_floors.len)
		var/i = rand(5, 15)
		while(i-- > 0)
			if(prob(fail_chance))
				continue
			var/turf/T = pick(holder.our_planet.planet_floors)
			if(T.is_outdoors() && isfloor(T))
				var/turf/simulated/floor/floor = T

				if(istype(T, /turf/simulated/floor/outdoors/ice))
					T.ChangeTurf(/turf/simulated/floor/water)
				if(istype(T, /turf/simulated/floor/outdoors/snow))
					T.ChangeTurf(/turf/simulated/floor/outdoors/grass/sif)

/datum/weather/pyraxis/proc/handle_lightning()
	if(world.time < next_lightning_strike)
		return
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors)
	lightning_strike(T)
