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

//var/penis_overrides = list()
//var/penis_overriden_player = list()
//var/penis_override_images = list()
//var/penis_overrides_key[][][]

//var/breasts_overrides = list()
//var/breast_overriden_player = list()
//var/breast_override_images = list()
//var/breast_overrides_key[][][]

//var/belly_overrides = list()
//var/belly_overriden_player = list()
//var/belly_override_images = list()
//var/belly_overrides_key[][][]

//var/butt_overrides = list()
//var/butt_overriden_player = list()
//var/butt_override_images = list()
//var/butt_overrides_key[][][]

//for(var/mob in GLOB.player_list)
//	var/penis_size_limit = mob.client?.read_preferences(/datum/preference/numeric/erp/penis_size_limit)
//	var/butt_size_limit = mob.client?.read_preferences(/datum/preference/numeric/erp/butt_size_limit)
//	var/breast_size_limit = mob.client?.read_preferences(/datum/preference/numeric/erp/breast_size_limit)
//	var/belly_size_limit = mob.client?.read_preferences(/datum/preference/numeric/erp/belly_size_limit)
//	for(var/mobDNA in GLOB.player_list)
//		var/butt_size = mob.dna.features["butt_size"]
//		var/belly_size = mob.dna.features["belly_size"]
//		var/breast_size = mob.dna.features["breast_size"]
//		var/penis_size = mob.dna.features["penis_size"]
//		penis_size = FLOOR(penis_size,1)
//		if(penis_size < 1)
//			penis_size = 1
//		switch(penis_size)
//			if(1 to 8)
//				penis_size = 1
//			if(9 to 15)
//				penis_size = 2
//			if(16 to 24)
//				penis_size = 3
//			if(25 to 36)
//				penis_size = 4
//			if(37 to 48)
//				penis_size = 5
//			if(49 to 60)
//				penis_size = 6
///			else
//				penis_size = 7
//		if(penis_size_affix > penis_size_limit)
//			switch(penis_size_limit)
//				if(1)
//					penis_size = 8
///				if(2)
//					penis_size = 15
//				if(3)
//					penis_size = 24
//				if(4)
//					penis_size = 36
//				if(5)
//					penis_size = 48
//				if(6)
//					penis_size = 60
//			penis_overrides.add(mob.name)
//			penis_overriden_player.add(mobDNA.name)
//			penis_override_images
//			penis_overrides_key.add([penis_overrides(mob.name)], [penis_overriden_player(mobDNA.name)], [penis_size])
//		if(butt_size > butt_size_limit))
//			butt_overrides.add(mob.name)
//			butt_overriden_player.add(mobDNA.name)
//			butt_override_images.add(generate_fake_butt_sprite_string())
//			butt_overrides_key.add([butt_overrides(mob.name)], [butt_overriden_player(mobDNA.name)], [generate_fake_butt_sprite_string])
//		if(breast_size > breast_size_limit))
//			breast_overrides.add(mob.name)
//			breast_overriden_player.add(mobDNA.name)
/			breast_override_images
//			breast_overrides_key.add([breast_overrides(mob.name)], [breast_overriden_player(mobDNA.name)], [breast_size_limit])
//		if(belly_size > belly_size_limit))
//			belly_overrides.add(mob.name)
//			belly_overriden_player.add(mobDNA.name)
//			belly_override_images.add(generate_fake_belly_sprite(mob, mobDNA, belly_size_limit))
//			belly_overrides_key.add([belly_overrides(mob.name)], [belly_overriden_player(mobDNA.name)], [belly_size_limit])



///datum/atom_hud/alternate_appearance/butt_override/mobShouldSee(mob/M)
//	if(M in butt_overrides)
//		return TRUE
//	return FALSE

///datum/atom_hud/alternate_appearance/breast_override/mobShouldSee(mob/M)
//	if(M in breast_overrides)
//		return TRUE
//	return FALSE

///datum/atom_hud/alternate_appearance/belly_override/mobShouldSee(mob/M)
//	if(M in belly_overrides)
//		return TRUE
//	return FALSE

//var/penis_override_images = list()
//var/butt_override_images = list()
//var/breast_override_images = list()
//var/belly_override_images = list()



//generate_fake_butt(mob/A, mob/B, size)
//	. = "[genital_type]_[floor(genital_size)]"
//	if(uses_skintones)
//		. += "_s"





//generate_fake_breast(mob/A, mob/B, size)
	//genital_size = B.dna.feature["breast_size"]
	//var/max_size = 5
	//if(genital_type == "pair")
	//	max_size = 19
//var/current_size = FLOOR(genital_size, 1)
	//if(current_size < 0)
	//	current_size = 0
//	if(current_size > size)
		current_size = size
//	else if (current_size > max_size)
//		current_size = max_size
//	var/passed_string = "[genital_type]_[current_size]"
//	if(uses_skintones)
//		passed_string += "_s"
//	return passed_string


//generate_fake_belly
//		. = "[genital_type]_[floor(genital_size)]"
//	if(uses_skintones)
		. += "_s"

///obj/item/organ/genital/proc/update_sprite_override()
//	sprite_suffix_override = "[get_sprite_size_string()]"

//	var/datum/bodypart_overlay/mutant/genital/our_overlay = bodypart_overlay

//	our_overlay.sprite_suffix = sprite_suffix