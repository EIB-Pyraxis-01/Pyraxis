/datum/job/mechatronic_engineer
	title = JOB_MECHATRONIC_ENGINEER
	flag = MECHENG
	departments = list(DEPARTMENT_ENGINEERING)
	department_flag = MEDSCI
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_ENGINEERING
	supervisors = "the " + JOB_ALT_FOREMAN
	selection_color = "#5B4D20"
	economic_modifier = 5
	access = list(ACCESS_MECHA, ACCESS_EVA, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_ATMOSPHERICS, ACCESS_EXTERNAL_AIRLOCKS)
	minimal_access = list(ACCESS_MECHA, ACCESS_EVA, ACCESS_ENGINE, ACCESS_ATMOSPHERICS, ACCESS_MAINT_TUNNELS, ACCESS_EMERGENCY_STORAGE, ACCESS_CONSTRUCTION, ACCESS_EXTERNAL_AIRLOCKS)

	// alt_titles

	minimal_player_age = 3
	min_age_by_species = list(SPECIES_PROMETHEAN = 2)
	outfit_type = /datum/decl/hierarchy/outfit/job/engineering/mechatronic
	job_description = "A " + JOB_MECHATRONIC_ENGINEER + " is primarly concerned about the station's large machinery, like Cyborgs, mechs, and the AI."

/datum/alt_title/head_engineer
	title = JOB_ALT_HEAD_ENGINEER

/datum/alt_title/foreman
	title = JOB_ALT_FOREMAN

/datum/alt_title/maintenance_manager
	title = JOB_ALT_MAINTENANCE_MANAGER

//////////////////////////////////
//			Engineer
//////////////////////////////////
/datum/job/engineer
	title = JOB_ENGINEER
	flag = ENGINEER
	departments = list(DEPARTMENT_ENGINEERING)
	department_flag = ENGSEC
	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 5
	supervisors = "the "+ JOB_ALT_FOREMAN
	selection_color = "#5B4D20"
	economic_modifier = 5
	pto_type = PTO_ENGINEERING

	access = list(ACCESS_EVA, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_ATMOSPHERICS, ACCESS_MECHA)
	minimal_access = list(ACCESS_EVA, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_MECHA)
	alt_titles = list(JOB_ALT_MAINTENANCE_TECHNICIAN = /datum/alt_title/maint_tech, JOB_ALT_ENGINE_TECHNICIAN = /datum/alt_title/engine_tech,
						JOB_ALT_ELECTRICIAN = /datum/alt_title/electrician, JOB_ALT_CONSTRUCTION_ENGINEER = /datum/alt_title/construction_engi, JOB_ALT_COMPUTER_TECHNICIAN = /datum/alt_title/computer_tech, JOB_ALT_SALVAGE_TECHNICIAN = /datum/alt_title/salvage_tech, JOB_ALT_DAMAGE_CONTROL_SPECIALIST = /datum/alt_title/damage_control_specialist)

	minimal_player_age = 3
	min_age_by_species = list(SPECIES_PROMETHEAN = 2)

	outfit_type = /datum/decl/hierarchy/outfit/job/engineering/engineer
	job_description = "An " + JOB_ENGINEER + " keeps the station running. They repair damages, keep the atmosphere stable, and ensure that power is being \
						generated and distributed. On quiet shifts, they may be called upon to make cosmetic alterations to the station."

/datum/job/engineer/get_request_reasons()
	return list("Engine setup", "Construction project", "Repairs necessary", "Assembling expedition team")

// Engineer Alt Titles
/datum/alt_title/maint_tech
	title = JOB_ALT_MAINTENANCE_TECHNICIAN
	title_blurb = "A " + JOB_ALT_MAINTENANCE_TECHNICIAN + " is generally a junior Engineer, and can be expected to run the mildly unpleasant or boring tasks that other \
					Engineers don't care to do."

/datum/alt_title/engine_tech
	title = JOB_ALT_ENGINE_TECHNICIAN
	title_blurb = "An " + JOB_ALT_ENGINE_TECHNICIAN + " tends to the engine, most commonly a Supermatter crystal. They are expected to be able to keep it stable, and \
					possibly even run it beyond normal tolerances."

/datum/alt_title/electrician
	title = JOB_ALT_ELECTRICIAN
	title_blurb = "An " + JOB_ALT_ELECTRICIAN + "'s primary duty is making sure power is properly distributed thoughout the station, utilizing solars, substations, and other \
					methods to ensure every department has power in an emergency."

/datum/alt_title/construction_engi
	title = JOB_ALT_CONSTRUCTION_ENGINEER
	title_blurb = "A " + JOB_ALT_CONSTRUCTION_ENGINEER + " fulfills similar duties to other engineers, but usually occupies spare time with construction of extra facilities in dedicated areas or \
					as additions to station layout."

/datum/alt_title/computer_tech
	title = JOB_ALT_COMPUTER_TECHNICIAN
	title_blurb = "A " + JOB_ALT_COMPUTER_TECHNICIAN + " fulfills similar duties to other engineers, but specializes in working with software and computers. They also often deal with integrated circuits."

/datum/alt_title/salvage_tech
	title = JOB_ALT_SALVAGE_TECHNICIAN
	title_blurb = "A " + JOB_ALT_SALVAGE_TECHNICIAN + " is responsible for breaking down debris and obsolete equipment to recover useful components and materials."

/datum/alt_title/damage_control_specialist
	title = JOB_ALT_DAMAGE_CONTROL_SPECIALIST
	title_blurb = "A " + JOB_ALT_DAMAGE_CONTROL_SPECIALIST + " is the Engineering Department's answer to first responders like the " + JOB_PARAMEDIC + ", being responsible for stabilizing situations and evacuating personnel, then conducting repairs."

//////////////////////////////////
//			Atmos Tech
//////////////////////////////////
/datum/job/atmos
	title = JOB_ATMOSPHERIC_TECHNICIAN
	flag = ATMOSTECH
	departments = list(DEPARTMENT_ENGINEERING)
	department_flag = ENGSEC
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_ENGINEERING
	supervisors = "the " + JOB_ALT_FOREMAN
	selection_color = "#5B4D20"
	economic_modifier = 5
	access = list(ACCESS_EVA, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_ATMOSPHERICS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MECHA)
	minimal_access = list(ACCESS_EVA, ACCESS_ENGINE, ACCESS_ATMOSPHERICS, ACCESS_MAINT_TUNNELS, ACCESS_EMERGENCY_STORAGE, ACCESS_CONSTRUCTION, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MECHA)

	alt_titles = list(JOB_ALT_ATMOSPHERIC_ENGINEER = /datum/alt_title/atmos_engi, JOB_ALT_ATMOSPHERIC_MAINTAINER = /datum/alt_title/atmos_maint, JOB_ALT_DISPOSALS_TECHNICIAN = /datum/alt_title/disposals_tech,
						JOB_ALT_FUEL_TECHNICIAN = /datum/alt_title/refuel_tech, JOB_ALT_FIREFIGHTER = /datum/alt_title/firefighter)

	minimal_player_age = 3
	min_age_by_species = list(SPECIES_PROMETHEAN = 2)

	outfit_type = /datum/decl/hierarchy/outfit/job/engineering/atmos
	job_description = "An " + JOB_ATMOSPHERIC_TECHNICIAN + " is primarily concerned with keeping the station's atmosphere breathable. They are expected to have a good \
						understanding of the pipes, vents, and scrubbers that move gasses around the station, and to be familiar with proper firefighting procedure."

/datum/job/atmos/get_request_reasons()
	return list("Construction project", "Repairs necessary", "Assembling expedition team")

/datum/alt_title/refuel_tech
	title = JOB_ALT_FUEL_TECHNICIAN

/datum/alt_title/atmos_maint
	title = JOB_ALT_ATMOSPHERIC_MAINTAINER

/datum/alt_title/atmos_engi
	title = JOB_ALT_ATMOSPHERIC_ENGINEER

/datum/alt_title/firefighter
	title = JOB_ALT_FIREFIGHTER
	title_blurb = "A " + JOB_ALT_FIREFIGHTER + " is an " + JOB_ATMOSPHERIC_TECHNICIAN + " still and can fulfill all the same duties, although specizlizes more in tackling fires."

/datum/alt_title/disposals_tech
	title = JOB_ALT_DISPOSALS_TECHNICIAN
	title_blurb = "A " + JOB_ALT_DISPOSALS_TECHNICIAN + " is an " + JOB_ATMOSPHERIC_TECHNICIAN + " still and can fulfill all the same duties, although specializes more in disposals delivery system's operations and configurations."
