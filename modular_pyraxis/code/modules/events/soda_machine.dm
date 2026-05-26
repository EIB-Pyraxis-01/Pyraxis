/datum/event/soda_machine
	startWhen = 0
	endWhen = 500

	var/obj/machinery/vending/sovietsoda/soda_machine

/datum/event/soda_machine/start()
	var/turf/T = pick(GLOB.anomalystart)
	if(!T)
		kill()
		return

	soda_machine = new /obj/machinery/vending/sovietsoda
	soda_machine.forceMove(T)

/datum/event/soda_machine/end()
	var/obj/item/paper/soda_paper = new(get_turf(soda_machine))
	soda_paper.info = "Gone for a walk :)"
	qdel(soda_machine)
