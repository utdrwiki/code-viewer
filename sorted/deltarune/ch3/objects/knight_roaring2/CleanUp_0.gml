if (surface_exists(my_surface))
    surface_free(my_surface);
if (surface_exists(ball_surface))
    surface_free(ball_surface);
if (surface_exists(star_surface))
    surface_free(star_surface);
if (surface_exists(terrible_surface))
    surface_free(terrible_surface);
ds_list_destroy(bullet_list);
sprite_delete(fakey_screen);
sprite_delete(fakey_screen_2);
with (obj_knight_enemy)
{
    image_alpha = 1;
    siner2 = 0;
    chargeupcon = 0;
}
snd_stop(snd_knight_stretch);
snd_stop(snd_knight_roar);
snd_stop(snd_stardrop);
snd_stop(snd_knight_cut);
with (obj_growtangle)
    instance_destroy();
