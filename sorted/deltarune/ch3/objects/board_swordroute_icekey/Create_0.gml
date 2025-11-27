myinteract = 0;
scr_darksize();
depth = 999980;
image_speed = 0;
active = 0;
con = 0;
drawblack = false;
drawblue = false;
draw_static = false;
statictimer = 0;
init = 0;
d = 0;
killoutertrees = false;
with (obj_board_screenColorChanger)
    instance_destroy();
with (instance_create(x, y, obj_board_screenColorChanger))
{
    image_blend = #FF9B00;
    active = true;
    init = 0;
}
