surface_free(bgsurface);
surface_free(windowsurface);
ds_list_destroy(to_draw);
with (obj_marker_fancy)
    instance_destroy();
