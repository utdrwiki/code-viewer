con = -1;
customcon = 0;
blackall = scr_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = -110;
blackall.image_blend = c_black;
shelter_marker = instance_find(obj_town_shelter_event, 0);
shelter_marker.sprite_index = spr_shelter_open;
hit_door = false;
hit_timer = 0;
hit_timer_max = 3;
hit_stop = false;
hit_finished = false;
punch_timer = 0;
punch_anim = 4;
punch_speed = 1;
smoke = instance_create(0, 0, obj_dw_blacksmoke);
deep_audio_start = false;
deep_audio_stop = false;
crickets_track = -4;
crickets_start = false;
crickets_stop = false;
border_hide = false;
panel_fall = false;
if (global.plot < 350)
{
    con = 0;
    with (obj_border_controller)
        show_border(1);
}
else
{
    instance_destroy();
}
