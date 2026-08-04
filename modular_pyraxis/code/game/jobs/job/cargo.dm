//Cargo
//////////////////////////////////
//			Quartermaster
//////////////////////////////////
/datum/job/qm
	title = JOB_QUARTERMASTER
	flag = QUARTERMASTER
	departments = list(DEPARTMENT_CARGO)
	sorting_order = 1
	departments_managed = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	pto_type = PTO_CARGO
	supervisors = "the " + JOB_SITE_MANAGER
	selection_color = "#9b633e"
	economic_modifier = 5
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_RC_ANNOUNCE)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_RC_ANNOUNCE)
	banned_job_species = list(FBP_DIGITAL, SPECIES_PROMETHEAN)

	ideal_character_age = 40
	dept_time_required = 20

	outfit_type = /datum/decl/hierarchy/outfit/job/cargo/qm
	job_description = "The " + JOB_QUARTERMASTER + " manages the Supply department, checking cargo orders and ensuring supplies get to where they are needed."
	alt_titles = list(JOB_ALT_SUPPLY_CHIEF = /datum/alt_title/supply_chief, JOB_ALT_LOGISTICS_MANAGER = /datum/alt_title/logistics_manager, JOB_ALT_CARGO_SUPERVISOR = /datum/alt_title/cargo_supervisor)

/datum/job/qm/get_request_reasons()
	return list("Training crew")

// Quartermaster Alt Titles
/datum/alt_title/supply_chief
	title = JOB_ALT_SUPPLY_CHIEF

/datum/alt_title/logistics_manager
	title = JOB_ALT_LOGISTICS_MANAGER

/datum/alt_title/cargo_supervisor
	title = JOB_ALT_CARGO_SUPERVISOR

//////////////////////////////////
//			Cargo Tech
//////////////////////////////////
/datum/job/cargo_tech
	title = JOB_CARGO_TECHNICIAN
	flag = CARGOTECH
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CARGO
	supervisors = "the " + JOB_QUARTERMASTER + " and the " + JOB_HEAD_OF_PERSONNEL
	selection_color = "#7a4f33"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_MINING_STATION)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING)

	outfit_type = /datum/decl/hierarchy/outfit/job/cargo/cargo_tech
	job_description = "A " + JOB_CARGO_TECHNICIAN + " fills and delivers cargo orders. They are encouraged to return delivered crates to the Cargo Shuttle, \
						because Central Command gives a partial refund."

	alt_titles = list(JOB_ALT_CARGO_LOADER = /datum/alt_title/cargo_loader, JOB_ALT_CARGO_HANDLER = /datum/alt_title/cargo_handler, JOB_ALT_SUPPLY_COURIER = /datum/alt_title/supply_courier,
					JOB_ALT_DISPOSALS_SORTER = /datum/alt_title/disposal_sorter, JOB_ALT_MAILMAN = /datum/alt_title/mailman, JOB_ALT_DELIVERY_WORKER = /datum/alt_title/delivery_worker,
					JOB_ALT_LOGISTICS_CONTRACTOR = /datum/alt_title/logistics_contractor)

/datum/alt_title/supply_courier
	title = JOB_ALT_SUPPLY_COURIER
	title_blurb = "A " + JOB_ALT_SUPPLY_COURIER + " is usually tasked with delivering packages or cargo directly to whoever requires it."

/datum/alt_title/cargo_loader
	title = JOB_ALT_CARGO_LOADER
	title_blurb = "A " + JOB_ALT_CARGO_LOADER + " is usually tasked with more menial labor within Supply department, such as loading and unloading supply shuttle."

/datum/alt_title/cargo_handler
	title = JOB_ALT_CARGO_HANDLER
	title_blurb = "A " + JOB_ALT_CARGO_HANDLER + " is usually tasked with more menial labor within Supply department, such as loading and unloading supply shuttle."

/datum/alt_title/disposal_sorter
	title = JOB_ALT_DISPOSALS_SORTER
	title_blurb = "A " + JOB_ALT_DISPOSALS_SORTER + " is usually tasked with operating disposals delivery system, sorting the trash and tagging parcels for delivery."

/datum/alt_title/mailman
	title = JOB_ALT_MAILMAN
	title_blurb = "A Mail Carrier is tasked with delivering packages or mail to whoever it might adress."
	title_outfit = /datum/decl/hierarchy/outfit/job/cargo/cargo_tech/mailman

/datum/alt_title/delivery_worker
	title = JOB_ALT_DELIVERY_WORKER
	title_blurb = "A " + JOB_ALT_DELIVERY_WORKER + " takes a more personal role in delivering items directly to those who ordered them."

/datum/alt_title/logistics_contractor
	title = JOB_ALT_LOGISTICS_CONTRACTOR
	title_blurb = "A " + JOB_ALT_LOGISTICS_CONTRACTOR + " someone who handles various fields of logistics, but isn't directly employed by NT proper."

//////////////////////////////////
//			Shaft Miner
//////////////////////////////////

/datum/job/mining
	title = JOB_SHAFT_MINER
	flag = MINER
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	pto_type = PTO_CARGO
	supervisors = "the " + JOB_QUARTERMASTER
	selection_color = "#7a4f33"
	economic_modifier = 5
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_MINING_STATION)
	minimal_access = list(ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING)

	outfit_type = /datum/decl/hierarchy/outfit/job/cargo/mining
	job_description = "A " + JOB_SHAFT_MINER + " mines and processes minerals to be delivered to departments that need them."
	alt_titles = list(JOB_ALT_DEEP_SPACE_MINER = /datum/alt_title/deep_space_miner, JOB_ALT_DRILL_TECHNICIAN = /datum/alt_title/drill_tech, JOB_ALT_PROSPECTOR = /datum/alt_title/prospector,
						JOB_ALT_EXCAVATOR = /datum/alt_title/excavator, JOB_ALT_MINING_CONTRACTOR = /datum/alt_title/mining_contractor)

/datum/job/mining/get_request_reasons()
	return list("Assembling expedition team")

/datum/alt_title/drill_tech
	title = JOB_ALT_DRILL_TECHNICIAN
	title_blurb = "A " + JOB_ALT_DRILL_TECHNICIAN + " specializes in operating and maintaining the machinery needed to extract ore from veins deep below the surface."

/datum/alt_title/deep_space_miner
	title = JOB_ALT_DEEP_SPACE_MINER
	title_blurb = "A " + JOB_ALT_DEEP_SPACE_MINER + " specializes primarily in mining operations in zero-g environments, mostly in asteroid and debris fields."

/datum/alt_title/prospector
	title = JOB_ALT_PROSPECTOR

/datum/alt_title/excavator
	title = JOB_ALT_EXCAVATOR

/datum/alt_title/mining_contractor
	title = JOB_ALT_MINING_CONTRACTOR
	title_blurb = "A " + JOB_ALT_MINING_CONTRACTOR + " executes mining operations, including drilling, blasting, and excavation, but isn't directly employed by NT proper."

//////////////////////////////////
//			Janitor
//////////////////////////////////
/datum/job/janitor
	title = JOB_JANITOR
	flag = JANITOR
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CARGO
	supervisors = "the " + JOB_QUARTERMASTER
	selection_color = "#7a4f33"
	access = list(ACCESS_JANITOR, ACCESS_CARGO, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_JANITOR, ACCESS_CARGO, ACCESS_MAINT_TUNNELS)

	outfit_type = /datum/decl/hierarchy/outfit/job/service/janitor
	job_description = "A " + JOB_JANITOR + " keeps the station clean, as long as it doesn't interfere with active crime scenes."
	alt_titles = list(JOB_ALT_CUSTODIAN = /datum/alt_title/custodian, JOB_ALT_SANITATION_TECHNICIAN = /datum/alt_title/sanitation_tech,
					JOB_ALT_MAID = /datum/alt_title/maid, JOB_ALT_GARBAGE_COLLECTOR = /datum/alt_title/garbage_collector)

// Janitor Alt Titles
/datum/alt_title/custodian
	title = JOB_ALT_CUSTODIAN

/datum/alt_title/sanitation_tech
	title = JOB_ALT_SANITATION_TECHNICIAN

/datum/alt_title/maid
	title = JOB_ALT_MAID

/datum/alt_title/garbage_collector
	title = JOB_ALT_GARBAGE_COLLECTOR
	title_blurb = "A " + JOB_ALT_GARBAGE_COLLECTOR + " keeps the station clean, though focuses moreso on collecting larger trash, with wet cleaning being secondary task."

//////////////////////////////////
//			Bartender
//////////////////////////////////

/datum/job/bartender
	title = JOB_BARTENDER
	flag = BARTENDER
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CARGO
	supervisors = "the " + JOB_QUARTERMASTER
	selection_color = "#7a4f33"
	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR)

	outfit_type = /datum/decl/hierarchy/outfit/job/service/bartender
	job_description = "A " + JOB_BARTENDER + " mixes drinks for the crew. They generally have permission to charge for drinks or deny service to unruly patrons."
	alt_titles = list(JOB_ALT_BARKEEPR = /datum/alt_title/barkeeper, JOB_ALT_BARMAID = /datum/alt_title/barmaid, JOB_ALT_BARISTA = /datum/alt_title/barista, JOB_ALT_MIXOLOGIST = /datum/alt_title/mixologist)

// Bartender Alt Titles
/datum/alt_title/barista
	title = JOB_ALT_BARISTA
	title_blurb = "A " + JOB_ALT_BARISTA + " mans the Cafe, serving primarily non-alcoholic drinks to the crew. They generally have permission to charge for drinks \
					or deny service to unruly patrons."
	title_outfit = /datum/decl/hierarchy/outfit/job/service/bartender/barista

/datum/alt_title/barkeeper
	title = JOB_ALT_BARKEEPR

/datum/alt_title/barmaid
	title = JOB_ALT_BARMAID

/datum/alt_title/mixologist
	title = JOB_ALT_MIXOLOGIST

//////////////////////////////////
//			   Chef
//////////////////////////////////

/datum/job/chef
	title = JOB_CHEF
	flag = CHEF
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	pto_type = PTO_CARGO
	supervisors = "the "+ JOB_QUARTERMASTER
	selection_color = "#7a4f33"
	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_KITCHEN)

	outfit_type = /datum/decl/hierarchy/outfit/job/service/chef
	job_description = "A " + JOB_CHEF + " cooks food for the crew. They generally have permission to charge for food or deny service to unruly diners."
	alt_titles = list(JOB_ALT_SOUSCHEF = /datum/alt_title/souschef, JOB_ALT_COOK = /datum/alt_title/cook, JOB_ALT_KITCHEN_WORKER = /datum/alt_title/kitchen_worker)

// Chef Alt Titles
/datum/alt_title/cook
	title = JOB_ALT_COOK
	title_blurb = "A " + JOB_ALT_COOK + " has the same duties, though they may be less experienced."

/datum/alt_title/souschef
	title = JOB_ALT_SOUSCHEF

/datum/alt_title/kitchen_worker
	title = JOB_ALT_KITCHEN_WORKER
	title_blurb = "A " + JOB_ALT_KITCHEN_WORKER + " has the same duties, though they may be less experienced."
