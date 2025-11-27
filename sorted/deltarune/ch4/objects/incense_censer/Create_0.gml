box_offset = 24;
anchor_x = x;
anchor_y = y;
hang_x = x;
hang_y = __view_get(e__VW.YView, 0) - 40;
height = y - hang_y;
height_goal = obj_growtangle.y - 70 - (obj_growtangle.sprite_height * 0.5) - box_offset - hang_y;
hangle = 270;
cur_angle = 270;
swing_max = 35;
acceleration_val = 0;
timer = 0;
con = 0;
ratio = 1;
do_return = false;
creatorid = -4;
creatordepthsave = 0;
depthinit = 0;
string_shake_x = 0;
string_shake_y = 0;
string_shake_timer = 0;
lightup = false;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
