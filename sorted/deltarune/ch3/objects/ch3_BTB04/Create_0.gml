depth = 0;
visible = true;
image_alpha = 0;
con = -1;
customcon = 0;
tenna_zoom = false;
tenna_zoom_timer = 0;
faceeffect = instance_create(1604, 136, obj_btb04_facescreeneffect);
camera_zoom = false;
camera_zoom_x = 0;
camera_zoom_y = 0;
camera_zoom_scale = 1;
camera_zoom_timer = 0;
text_shake = false;
static_noise = false;
static_fx = -4;
set_tenna_pitch = false;
global.flag[1054] = 1;
short_bg = false;
short_rooms = false;
if (global.plot >= 280)
{
    with (obj_doorAny)
    {
        if (x < 320)
        {
            var door = instance_create(x, y, object_index);
            door.doorRoom = room_dw_puzzlecloset_3;
            door.doorEntrance = "D";
            door.doorFadeMusic = 1;
            door.image_xscale = image_xscale;
            door.image_yscale = image_yscale;
            instance_destroy();
        }
    }
}
if (i_ex(obj_dw_snow_zone_battle_bg))
{
    with (obj_dw_snow_zone_battle_bg)
        instance_destroy();
}
if (global.plot > 200 && global.plot < 290)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 60);
    if (audio_is_playing(snd_tv_static))
    {
        snd_stop(snd_tv_static);
        snd_free(103);
    }
}
else if (global.plot == 290)
{
    con = 10;
}
else
{
    instance_destroy();
}
tennaface = 0;
tennafacealpha = 0;
tennafacetimer = 0;
tennafacecolor = 3353901;
tennafacecolorindex = 0;
tennafacescale = 2;
tenna = 0;
whiteoverlay = 0;
whiteoverlayindex = 0;
staticalpha = 0;
facestatic = 0;
facestaticindex = 0;
