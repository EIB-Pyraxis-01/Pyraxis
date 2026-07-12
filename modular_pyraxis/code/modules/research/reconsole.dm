/obj/machinery/computer/rdconsole_tg
	var/filter_department = null
	var/is_remote = FALSE

/obj/machinery/computer/rdconsole_tg/remote_locked
	name = "Remote License Console"
	desc = "Used to remotely work with the research and development lab. Locked by default."
	locked = TRUE
	circuit = /obj/item/circuitboard/rdconsole/locked
	is_remote = TRUE

/obj/item/circuitboard/rdconsole/locked
	name = T_BOARD("Remote License control console")
	build_path = /obj/machinery/computer/rdconsole_tg/remote_locked
	hidden = TRUE

/obj/machinery/computer/rdconsole_tg/engineering
	name = "Engineering License Console"
	req_access = null
	req_one_access = list(ACCESS_RESEARCH, ACCESS_MECHA, ACCESS_ENGINE)
	circuit = /obj/item/circuitboard/rdconsole/engineering
	filter_department = CHANNEL_ENGINEERING
	is_remote = TRUE

/obj/item/circuitboard/rdconsole/engineering
	name = T_BOARD("Robotics R&D console")
	build_path = /obj/machinery/computer/rdconsole_tg/robotics_remote
	hidden = TRUE

/obj/machinery/computer/rdconsole_tg/medical
	name = "Medical License Console"
	req_access = null
	req_one_access = list(ACCESS_RESEARCH, ACCESS_MEDICAL)
	circuit = /obj/item/circuitboard/rdconsole/medical
	filter_department = CHANNEL_MEDICAL
	is_remote = TRUE

/obj/item/circuitboard/rdconsole/medical
	name = T_BOARD("Medical License console")
	build_path = /obj/machinery/computer/rdconsole_tg/medical
	hidden = TRUE

/obj/machinery/computer/rdconsole_tg/cargo
	name = "Cargo License Console"
	req_access = null
	req_one_access = list(ACCESS_CARGO)
	circuit = /obj/item/circuitboard/rdconsole/cargo
	filter_department = CHANNEL_SERVICE
	is_remote = TRUE

/obj/item/circuitboard/rdconsole/cargo
	name = T_BOARD("Cargo License console")
	build_path = /obj/machinery/computer/rdconsole_tg/cargo
	hidden = TRUE
