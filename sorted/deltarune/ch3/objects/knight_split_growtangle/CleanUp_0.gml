event_user(1);
instance_destroy(marker[0]);
instance_destroy(marker[1]);
if (surface_exists(source_surf))
    surface_free(source_surf);
if (surface_exists(half_box_a))
    surface_free(half_box_a);
if (surface_exists(half_box_b))
    surface_free(half_box_b);
