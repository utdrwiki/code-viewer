surface_free(photo_surface);
if (screenshot != -1)
    sprite_delete(screenshot);
with (obj_herokris)
    mask_index = -1;
with (obj_herosusie)
    mask_index = -1;
with (obj_heroralsei)
    mask_index = -1;
with (obj_shutta_nobyacttest)
    instance_destroy();
with (obj_shutta_nobyact_tv)
    instance_destroy();
scr_battle_sprite_reset("ralsei");
scr_battle_sprite_reset("susie");
scr_battle_sprite_reset("kris");
with (obj_herokris)
{
    state = other.krisstate;
    global.faceaction[myself] = other.krisfaceaction;
}
with (obj_herosusie)
{
    state = other.susiestate;
    global.faceaction[myself] = other.susiefaceaction;
}
with (obj_heroralsei)
{
    state = other.ralseistate;
    global.faceaction[myself] = other.ralseifaceaction;
}
