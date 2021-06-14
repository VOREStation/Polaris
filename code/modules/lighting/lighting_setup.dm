// Create lighting overlays on all turfs with dynamic lighting in areas with dynamic lighting.
/proc/create_all_lighting_objects()
	for(var/area/A in world)
		if(!IS_DYNAMIC_LIGHTING(A))
			continue

		for(var/turf/T in A)

			if(!IS_DYNAMIC_LIGHTING(T))
				continue

			new/datum/lighting_object(T)
			CHECK_TICK
		CHECK_TICK
