//The Butt.

/obj/item/organ/genital/butt
	name = "butt"
	desc = "You see a pair of asscheeks."
	icon = 'modular_zubbers/icons/obj/medical/lewdorgan/butt.dmi'
	icon_state = "butt"
	slot = ORGAN_SLOT_BUTT
	zone = BODY_ZONE_PRECISE_GROIN
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/butt
	aroused = AROUSAL_CANT

	mutantpart_key = ORGAN_SLOT_BUTT
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))

/obj/item/organ/genital/butt/get_description_string(datum/sprite_accessory/genital/gas)
	var/size_name
	switch(round(genital_size))
		if(1)
			size_name = "average"
		if(2)
			size_name = "sizable"
		if(3)
			size_name = "squeezable"
		if(4)
			size_name = "hefty"
		if(5)
			size_name = pick("massive", "very generous")
		if(6)
			size_name = pick("gigantic", "big bubbly", "enormous")
		if(7)
			size_name = pick("unfathomably large", "extreme")
		if(8)
			size_name = pick("absolute dumptruck", "humongous", "dummy thick")
		else
			size_name = "nonexistent"

	return "You see a [LOWER_TEXT(gas.icon_state)] of [size_name] asscheeks."

/obj/item/organ/genital/butt/set_size(size)
	. = ..()
	var/obj/item/organ/genital/anus/anus = owner?.get_organ_slot(ORGAN_SLOT_ANUS) //sometimes
	if(!anus)
		return

	anus.set_size(size)

/obj/item/organ/genital/butt/get_sprite_size_string()
	. = "[genital_type]_[floor(genital_size)]"
	if(uses_skintones)
		. += "_s"

/obj/item/organ/genital/butt/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["butt_uses_skincolor"]
	set_size(DNA.features["butt_size"])

	return ..()

/obj/item/organ/genital/butt/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["butt_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading
	return ..()

/datum/bodypart_overlay/mutant/genital/butt
	feature_key = ORGAN_SLOT_BUTT
	layers = EXTERNAL_ADJACENT | EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/genital/butt/get_global_feature_list()
	return SSaccessories.sprite_accessories[ORGAN_SLOT_BUTT]

/obj/item/organ/genital/anus/get_sprite_size_string()
    . = "[genital_type]_[floor(genital_size)]"
    if(uses_skintones)
        . += "_s"

/obj/item/organ/genital/anus/build_from_dna(datum/dna/DNA, associated_key)
    set_size(DNA.features["butt_size"]) // yes
    uses_skin_color = DNA.features["anus_uses_skincolor"]

    return ..()

/datum/bodypart_overlay/mutant/genital/anus
    layers = EXTERNAL_FRONT

//The Tummy.

/obj/item/organ/genital/belly
	name = "belly"
	desc = "You see a belly on their midsection."
	icon = null //apparently theres no organ sprite?
	icon_state = null
	drop_when_organ_spilling = FALSE
	slot = ORGAN_SLOT_BELLY
	zone = BODY_ZONE_CHEST
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/belly
	genital_location = CHEST
	aroused = AROUSAL_CANT

	mutantpart_key = ORGAN_SLOT_BELLY
	mutantpart_info = list(MUTANT_INDEX_NAME = "Belly", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))

/obj/item/organ/genital/belly/get_sprite_size_string()
	. = "[genital_type]_[floor(genital_size)]"
	if(uses_skintones)
		. += "_s"

/obj/item/organ/genital/belly/set_size(size)
	var/old_size = genital_size
	. = ..()
	if(size > old_size)
		to_chat(owner, span_warning("Your guts [pick("swell up to", "gurgle into", "expand into", "plump up into", "grow eagerly into", "fatten up into", "distend into")] a larger midsection."))
	else if (size < old_size)
		to_chat(owner, span_warning("Your guts [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller midsection."))


/obj/item/organ/genital/belly/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["belly_uses_skincolor"]
	set_size(DNA.features["belly_size"])

	return ..()

/obj/item/organ/genital/belly/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["belly_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading
	return ..()

/obj/item/organ/genital/belly/get_description_string(datum/sprite_accessory/genital/gas)
	var/size_name
	switch(round(genital_size))
		if(1)
			size_name = "average"
		if(2)
			size_name = "round"
		if(3)
			size_name = "squishable"
		if(4)
			size_name = "fat"
		if(5)
			size_name = "sagging"
		if(6)
			size_name = "gigantic"
		if(7 to INFINITY)
			size_name = pick("massive", "unfathomably bulging", "enormous", "very generous", "humongous", "big bubbly")
		else
			size_name = "nonexistent"

	var/returned_string = "You see a [size_name] [round(genital_size) >= 4 ? "belly, it's quite large." : "belly in [owner?.p_their() ? owner?.p_their() : "their"] midsection"]."
	return returned_string



/datum/bodypart_overlay/mutant/genital/belly
	feature_key = ORGAN_SLOT_BELLY
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/belly/get_global_feature_list()
	return SSaccessories.sprite_accessories[ORGAN_SLOT_BELLY]

//datum/bodypart_overlay/mutant/genital/belly/get_global_feature_list()
	//for(var/client/client in GLOB.clients)
		//var/belly_size_limit = client?.read_preferences(/datum/preference/numeric/erp/belly_size_limit)
	//	var/breast_size_limit = client?.read_preferences(/datum/preference/numeric/erp/breast_size_limit)
	//	var/butt_size_limit = client?.read_preferences(/datum/preference/numeric/erp/butt_size_limit)
	//	var/penis_size_limit = client?.read_preferences(/datum/preference/numeric/erp/penis_size_limit)

//belly override concept

//var/size_override = DNA.features["belly_size"]
//if(size_override > belly_size_limit)
//	size_override = belly_size_limit

//datum/atom_hud/alternate_appearance/belly_size_override
	//set_size(DNA.features["belly_size"])
//	hud_icons = list(appearance_key)
//	belly_appearance_override = get_sprite_size_string(size_override)

//datum/atom_hud/alternate_appearance/New(datum/dna/DNA)

//	appearance_key = key
//	hud_icons = list(appearance_key)
//	..()
//
//	GLOB.active_alternate_appearances += src
//
//	for(var/mob in GLOB.player_list)
//		if(DNA.features["breasts_size"] > client?.read_preferences(/datum/preference/numeric/erp/breast_size_limit))
//			apply_to_new_mob(mob)

/obj/item/organ/genital/override_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	var/datum/sprite_accessory/genital/accessory = SSaccessories.sprite_accessories[associated_key][DNA.mutant_bodyparts[associated_key][MUTANT_INDEX_NAME]]
	genital_name = accessory.name
	genital_type = accessory.icon_state
	build_from_accessory(accessory, DNA)
	update_sprite_suffix()

	var/datum/bodypart_overlay/mutant/genital/our_overlay = bodypart_overlay

	our_overlay.color_source = uses_skin_color ? ORGAN_COLOR_INHERIT : ORGAN_COLOR_OVERRIDE
	var/image/override_image = image(icon = sprite_suffix, icon_state = genital_type, loc = src)
	override_image.add_overlay(bodypart_overlay)
	add_alt_appearance(/datum/atom_hud/alternate_appearance/genital_size_override, DNA, override_image)

/obj/item/organ/genital/penis/override_from_dna(datum/dna/DNA, associated_key)
	for(var/mob in GLOB.player_list)
		genital_size = DNA.features["penis_size"]
		var/measured_size = FLOOR(genital_size,1)
		if(measured_size < 1)
			measured_size = 1
		switch(measured_size)
			if(1 to 8)
				size_affix = 1
			if(9 to 15)
				size_affix = 2
			if(16 to 24)
				size_affix = 3
			if(25 to 36)
				size_affix = 4
			if(37 to 48)
				size_affix = 5
			if(49 to 60)
				size_affix = 6
			else
				size_affix = 7
		if(size_affix > mob.client?.read_preferences(/datum/preference/numeric/erp/penis_size_limit))
			size_affix = mob.client?.read_preferences(/datum/preference/numeric/erp/penis_size_limit
		switch(size_affix)
			if(1)
				measured size = 1
			if(2)
				measured_size = 9
			if(3)
				measured_size = 16
			if(4)
				measured_size = 25
			if(5)
				measured_size = 37
			if(6)
				measured_size = 49
			else
				measured_size = 61
		list(girth = DNA.features["penis_girth"])
		uses_skin_color = DNA.features["penis_uses_skincolor"]
		set_size(measured_size)

		return ..()

for(var/mob in GLOB.player_list)
	var/penis_overrides = list(mob.client?.read_preferences(/datum/preference/numeric/erp/penis_size_limit))
	var/breasts_overrides = list(mob.client?.read_preferences(/datum/preference/numeric/erp/breast_size_limit))
	var/belly_overrides = list(mob.client?.read_preferences(/datum/preference/numeric/erp/belly_size_limit))
	var/butt_overrides = list(mob.client?.read_preferences(/datum/preference/numeric/erp/butt_size_limit))

/datum/atom_hud/alternate_appearance/penis_size_limit(penis_overrides)

/datum/atom_hud/alternate_appearance/breast_size_limit(breasts_overrides)

/datum/atom_hud/alternate_appearance/belly_size_limit(belly_overrides)

/datum/atom_hud/alternate_appearance/butt_size_limi(butt_overrides)