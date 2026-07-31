/datum/rem_event/random_disease
	min_mode = REM_LOW
	max_mode = REM_ANOMALOUS
	departments = list(DEPARTMENT_MEDICAL)
	event_path = /datum/event/disease_outbreak

/datum/rem_event/appendicitis
	min_mode = REM_CALM
	max_mode = REM_HIGH
	departments = list(DEPARTMENT_MEDICAL)
	event_path = /datum/event/spontaneous_appendicitis
