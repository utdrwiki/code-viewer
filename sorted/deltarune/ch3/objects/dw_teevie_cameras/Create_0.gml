glitz_active = false;
var y_offset = -40;
bg_height = sprite_get_height(spr_dw_couch_bg_parallax_layer_1) * 2;
timer = 0;
ooaatimer = 0;
timer_max = 30;
ooaa_max = 60;
threshold_vertical = (y - 20) + 60;
max_vertical_threshold = 80;
if (room == room_dw_tv_curtain)
{
    threshold_vertical = y;
    max_vertical_threshold = 160;
}
threshold_left = x;
threshold_right = x + (20 * image_xscale);
audience_sfx[0] = snd_init("berdly_audience.ogg");
audience_sfx[1] = -4;
var size = image_xscale;
if (image_xscale < 3)
    size = 3;
y_offset = 0;
if (room == room_dw_tv_curtain)
    y_offset = 40;
cheer_audience = instance_create(x, y + y_offset, obj_dw_teevie_cameras_cheer);
cheer_audience.depth = 6010;
cheer_audience.image_xscale = size;
with (cheer_audience)
    init_crowd();
camera_crowd = 0;
camera_crowd = instance_create(x, y, obj_dw_teevie_cameras_crowd);
camera_crowd.image_xscale = size;
camera_crowd.depth = 1000301;
with (camera_crowd)
    init_crowd();
disable = false;
neverwork = false;
if (scr_ch3_violencecheck() >= 5)
{
    disable = true;
    neverwork = true;
    if (room == room_dw_teevie_intro || room == room_dw_teevie_large_01)
    {
        with (obj_dw_teevie_cameras_crowd)
            instance_destroy();
        with (obj_dw_teevie_cameras_cheer)
            instance_destroy();
        instance_destroy();
    }
}
