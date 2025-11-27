if (surface_exists(_surface1))
    surface_free(_surface1);
if (surface_exists(_surface2))
    surface_free(_surface2);
with (obj_chef_controls_ui)
    instance_destroy();
with (obj_tenna_chef_marker1)
    instance_destroy();
with (obj_tenna_chef_marker_fire)
    instance_destroy();
