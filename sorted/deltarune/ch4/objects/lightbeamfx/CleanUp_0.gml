part_emitter_destroy_all(ps);
part_system_destroy(ps);
part_type_destroy(ptdust);
if (surface_exists(surfdust))
    surface_free(surfdust);
if (surface_exists(surfdust_tiled))
    surface_free(surfdust_tiled);
if (surface_exists(surfmask))
    surface_free(surfmask);
