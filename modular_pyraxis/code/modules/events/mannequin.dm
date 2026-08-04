/datum/event/mannequin
	startWhen = 0

/datum/event/mannequin/start()
	var/turf/T = pick(GLOB.anomalystart)
	if(!T)
		kill()
		return

	new /obj/structure/barricade/cutout/cursed(T)
