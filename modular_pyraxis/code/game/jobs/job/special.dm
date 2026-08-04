/datum/job/centcom_officer //For Business
	title = "CentCom Officer"
	departments = list("Central Command")
	department_accounts = list(DEPARTMENT_COMMAND, DEPARTMENT_ENGINEERING, DEPARTMENT_MEDICAL, DEPARTMENT_RESEARCH, DEPARTMENT_SECURITY, DEPARTMENT_CARGO, DEPARTMENT_PLANET, DEPARTMENT_CIVILIAN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /datum/decl/hierarchy/outfit/job/centcom_officer
	job_description = "A Central Command Officer is there on official business. Most of time. Whatever it is, they're a VIP."

	minimum_character_age = 25
	ideal_character_age = 40

	pto_type = PTO_CIVILIAN

/datum/job/centcom_officer/get_access()
	return SSaccess.get_all_accesses().Copy()

/datum/job/emergency_responder //For staff managing/leading ERTs
	title = "Emergency Responder"
	departments = list("Central Command")
	department_accounts = list(DEPARTMENT_COMMAND, DEPARTMENT_ENGINEERING, DEPARTMENT_MEDICAL, DEPARTMENT_RESEARCH, DEPARTMENT_SECURITY, DEPARTMENT_CARGO, DEPARTMENT_PLANET, DEPARTMENT_CIVILIAN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /datum/decl/hierarchy/outfit/job/emergency_responder
	job_description = "Emergency Responders are usually called in to deal with on-station emergencies that the crew require assistance to deal with."

	minimum_character_age = 18
	ideal_character_age = 30

	pto_type = PTO_CIVILIAN

/datum/job/emergency_responder/get_access()
	return SSaccess.get_all_accesses().Copy()


/obj/item/card/id/civilian/lurker
	desc = "A rather old and scuffed-looking ID. It seems legit, but something also seems very off somehow. Say, what's the issue/expiry date..?"
	assignment = "NO DATA"
	rank = JOB_MAINT_LURKER

/datum/job/maint_lurker
	title = JOB_MAINT_LURKER
	departments = list(DEPARTMENT_CIVILIAN)
	faction = FACTION_STATION
	total_positions = -1
	spawn_positions = -1
	supervisors = "nobody save your own common sense and good judgement, though Security may get upset if you're not careful"
	selection_color = "#515151"
	account_allowed = FALSE	//let's not give the game away by creating accounts that someone might stumble across
	job_description = "You are a maintenance lurker! You shouldn't be able to see this description anyway! Go prank the CMO or eat the RD's hat or something instead of looking at this."
	whitelist_only = 1
	latejoin_only = 1
	requestable = FALSE
	outfit_type = /datum/decl/hierarchy/outfit/maint_lurker
	access = list(ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_MAINT_TUNNELS)
