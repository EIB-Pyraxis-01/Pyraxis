/obj/structure/barricade/cutout/cursed
	maxhealth = 50
	var/datum/weakref/pursuit_target

/obj/structure/barricade/cutout/cursed/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	pursuit_target = WEAKREF(find_nearest_target())

/obj/structure/barricade/cutout/cursed/Destroy()
	STOP_PROCESSING(SSobj, src)
	pursuit_target = null
	. = ..()

/obj/structure/barricade/cutout/cursed/process()
	if(prob(25))
		for(var/mob/living/carbon/human/mob in oview(7, src))
			mob.Blind(2)
	if(prob(50))
		if(isnull(pursuit_target))
			return
		var/turf/step_turf = get_step(src, get_dir(src, pursuit_target.resolve()))
		step_to(src, step_turf)

/obj/structure/barricade/cutout/cursed/proc/spook(mob/mob)
	step_to(src, mob)
	mob.Blind(5)

/obj/structure/barricade/cutout/cursed/examine(mob/user)
	. = ..()
	if(prob(50))
		spook(user)

/obj/structure/barricade/cutout/cursed/proc/find_nearest_target()
	var/closest_distance = INFINITY
	var/mob/living/carbon/closest_target = null
	for(var/mob/living/carbon/target in GLOB.player_list)
		if(target.z != z)
			continue
		if(SEND_SIGNAL(target, COMSIG_CHECK_FOR_GODMODE) & COMSIG_GODMODE_CANCEL)
			continue
		if(target.stat >= UNCONSCIOUS)
			continue
		var/distance_from_target = get_dist(src, target)
		if(distance_from_target >= closest_distance)
			continue
		closest_distance = distance_from_target
		closest_target = target

	return closest_target
