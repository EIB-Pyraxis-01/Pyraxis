//////////////////////////////////
//			Botanist
//////////////////////////////////
/*
/datum/job/hydro
	title = JOB_BOTANIST
	flag = BOTANIST
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	pto_type = PTO_CIVILIAN
	supervisors = "the " + JOB_HEAD_OF_PERSONNEL
	selection_color = "#515151"
	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_HYDROPONICS)

	outfit_type = /datum/decl/hierarchy/outfit/job/service/gardener
	job_description = "A " + JOB_BOTANIST+ " grows plants for the " + JOB_CHEF + " and " + JOB_BARTENDER + "."
	alt_titles = list(JOB_ALT_HYDROPONICIST = /datum/alt_title/hydroponicist, JOB_ALT_CULTIVATOR = /datum/alt_title/cultivator, JOB_ALT_FARMER = /datum/alt_title/farmer,
						JOB_ALT_GARDENER = /datum/alt_title/gardener, JOB_ALT_FLORIST = /datum/alt_title/florsit, JOB_ALT_RANCHER = /datum/alt_title/rancher)

//Botanist Alt Titles
/datum/alt_title/gardener
	title = JOB_ALT_GARDENER
	title_blurb = "A " + JOB_ALT_GARDENER + " may be less professional than their counterparts, and are more likely to tend to the public gardens if they aren't needed elsewhere."

/datum/alt_title/hydroponicist
	title = JOB_ALT_HYDROPONICIST

/datum/alt_title/cultivator
	title = JOB_ALT_CULTIVATOR

/datum/alt_title/farmer
	title = JOB_ALT_FARMER

/datum/alt_title/florsit
	title = JOB_ALT_FLORIST
	title_blurb = "A " + JOB_ALT_FLORIST + " may be less professional than their counterparts, and are more likely to tend to the public gardens if they aren't needed elsewhere."

/datum/alt_title/rancher
	title = JOB_ALT_RANCHER
	title_blurb = "A " + JOB_ALT_RANCHER + " is tasked with the care, feeding, raising, and harvesting of livestock."

//More or less assistants
//////////////////////////////////
//			Librarian
//////////////////////////////////
/datum/job/librarian
	title = JOB_LIBRARIAN
	flag = LIBRARIAN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	pto_type = PTO_CIVILIAN
	supervisors = "the " + JOB_HEAD_OF_PERSONNEL
	selection_color = "#515151"
	access = list(ACCESS_LIBRARY, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_LIBRARY)

	outfit_type = /datum/decl/hierarchy/outfit/job/librarian
	job_description = "The " + JOB_LIBRARIAN + " curates the book selection in the Library, so the crew might enjoy it."
	alt_titles = list(JOB_ALT_JOURNALIST = /datum/alt_title/journalist, JOB_ALT_REPORTER =  /datum/alt_title/reporter, JOB_ALT_WRITER = /datum/alt_title/writer,
						JOB_ALT_HISTORIAN = /datum/alt_title/historian, JOB_ALT_ARCHIVIST = /datum/alt_title/archivist, JOB_ALT_PROFESSOR = /datum/alt_title/professor,
					JOB_ALT_ACADEMIC = /datum/alt_title/academic, JOB_ALT_PHILOSOPHER = /datum/alt_title/philosopher, JOB_ALT_CURATOR = /datum/alt_title/curator)

// Librarian Alt Titles
/datum/alt_title/journalist
	title = JOB_ALT_JOURNALIST
	title_outfit = /datum/decl/hierarchy/outfit/job/librarian/journalist
	title_blurb = "The " + JOB_ALT_JOURNALIST + " uses the Library as a base of operations, from which they can report the news and goings-on on the station with their camera."

/datum/alt_title/writer
	title = JOB_ALT_WRITER
	title_blurb = "The " + JOB_ALT_WRITER + " uses the Library as a quiet place to write whatever it is they choose to write."

/datum/alt_title/reporter
	title = JOB_ALT_REPORTER
	title_blurb = "The " + JOB_ALT_REPORTER + " uses the Library as a base of operations, from which they can report the news and goings-on on the station with their camera."

/datum/alt_title/historian
	title = JOB_ALT_HISTORIAN
	title_blurb = "The " + JOB_ALT_HISTORIAN + " uses the Library as a base of operation to record any important events occurring on station."

/datum/alt_title/archivist
	title = JOB_ALT_ARCHIVIST
	title_blurb = "The " + JOB_ALT_ARCHIVIST + " uses the Library as a base of operation to record any important events occurring on station."

/datum/alt_title/professor
	title = JOB_ALT_PROFESSOR
	title_blurb = "The " + JOB_ALT_PROFESSOR + " uses the Library as a base of operations to share their vast knowledge with the crew."

/datum/alt_title/academic
	title = JOB_ALT_ACADEMIC
	title_blurb = "The " + JOB_ALT_ACADEMIC + " uses the Library as a base of operations to share their vast knowledge with the crew."

/datum/alt_title/philosopher
	title = JOB_ALT_PHILOSOPHER
	title_blurb = "The " + JOB_ALT_PHILOSOPHER + " uses the Library as a base of operation to ruminate on nature of life and other great questions, and share their opinions with the crew."

/datum/alt_title/curator
	title = JOB_ALT_CURATOR
	title_blurb = "The " + JOB_ALT_CURATOR + " uses the Library as a base of operation to gather the finest of art for display and preservation."
*/

//////////////////////////////////
//			Detective
//////////////////////////////////
/datum/job/detective
	title = JOB_DETECTIVE
	flag = DETECTIVE
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	pto_type = PTO_CIVILIAN
	supervisors = "SolGov"
	selection_color = "#515151"
	access = list(ACCESS_FORENSICS_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_EVA, ACCESS_EXTERNAL_AIRLOCKS)
	minimal_access = list(ACCESS_FORENSICS_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_EVA, ACCESS_EXTERNAL_AIRLOCKS)
	economic_modifier = 5
	minimal_player_age = 3
	banned_job_species = list(SPECIES_ZADDAT, SPECIES_PROMETHEAN, SPECIES_DIONA)

	outfit_type = /datum/decl/hierarchy/outfit/job/security/detective
	job_description = "A " + JOB_DETECTIVE + " works to help Security find criminals who have not properly been identified, through interviews and forensic work. \
						For crimes only witnessed after the fact, or those with no survivors, they attempt to piece together what they can from pure evidence."
	alt_titles = list(JOB_ALT_INVESTIGATOR = /datum/alt_title/investigator, JOB_ALT_FORENSIC_TECHNICIAN = /datum/alt_title/forensic_tech)

/datum/job/detective/get_request_reasons()
	return list("Forensic investigation")

// Detective Alt Titles
/datum/alt_title/forensic_tech
	title = JOB_ALT_FORENSIC_TECHNICIAN
	title_blurb = "A " + JOB_ALT_FORENSIC_TECHNICIAN + " works more with hard evidence and labwork than a " + JOB_DETECTIVE + ", but they share the purpose of solving crimes."
	title_outfit = /datum/decl/hierarchy/outfit/job/security/detective/forensic

/datum/alt_title/investigator
	title = JOB_ALT_INVESTIGATOR
