/obj/item/organ/cyberimp/arm/toolkit/toolset/alien
	name = "integrated alien toolset implant"
	desc = "A version of the engineering toolset, designed to be installed on subject's arm. Contain abductor tools."
	actions_types = list(/datum/action/item_action/organ_action/toggle/toolkit)
	items_to_create = list(
		/obj/item/screwdriver/abductor,
		/obj/item/wrench/abductor,
		/obj/item/weldingtool/abductor,
		/obj/item/crowbar/abductor,
		/obj/item/wirecutters/abductor,
		/obj/item/multitool/abductor,
	)

/obj/item/organ/cyberimp/arm/toolkit/surgery/alien
	name = "alien surgical toolset implant"
	desc = "A set of alien surgical tools hidden behind a concealed panel on the user's arm."
	actions_types = list(/datum/action/item_action/organ_action/toggle/toolkit)
	items_to_create = list(
		/obj/item/retractor/alien,
		/obj/item/hemostat/alien,
		/obj/item/cautery/alien,
		/obj/item/surgicaldrill/alien,
		/obj/item/scalpel/alien,
		/obj/item/circular_saw/alien,
		/obj/item/surgical_processor,
		/obj/item/bonesetter/alien,
		/obj/item/blood_filter/alien,
	)

/obj/item/organ/cyberimp/arm/toolkit/surgery
	items_to_create = list(
		/obj/item/retractor/augment,
		/obj/item/hemostat/augment,
		/obj/item/cautery/augment,
		/obj/item/surgicaldrill/augment,
		/obj/item/scalpel/augment,
		/obj/item/circular_saw/augment,
		/obj/item/surgical_drapes,
		/obj/item/bonesetter,
		/obj/item/blood_filter,
	)
