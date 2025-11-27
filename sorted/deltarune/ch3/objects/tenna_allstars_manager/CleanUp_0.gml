ds_list_destroy(bullet_list);
snd_stop(snd_crowd_laughter_loop);
if (surface_exists(my_surface))
    surface_free(my_surface);
if (surface_exists(my_surface2))
    surface_free(my_surface2);
