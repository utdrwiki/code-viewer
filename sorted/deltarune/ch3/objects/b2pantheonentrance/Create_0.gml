image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
intimer = 0;
kris = 0;
susie = 0;
ralsei = 0;
kr_real = 0;
su_real = 0;
ra_real = 0;
tenna = 0;
suwalk = 0;
suwalktimer = 0;
visit = 0;
var walltile = 3506;
leftexit = instance_create(x - 32, y + 96 + 32, obj_board_solid);
with (leftexit)
{
    image_angle = 90;
    sprite_index = walltile;
    scr_darksize();
    visible = true;
    image_alpha = 1;
    depth = 999999;
}
rightexit1 = instance_create(x + 352, y + 64, obj_board_solid);
with (rightexit1)
{
    image_angle = -90;
    sprite_index = walltile;
    scr_darksize();
    visible = true;
    image_alpha = 1;
    depth = 999999;
}
rightexit2 = instance_create(x + 352, y + 96, obj_board_solid);
with (rightexit2)
{
    image_angle = -90;
    sprite_index = walltile;
    scr_darksize();
    visible = true;
    image_alpha = 1;
    depth = 999999;
}
topexit1 = instance_create(x + 128, y - 32, obj_board_solid);
with (topexit1)
{
    sprite_index = walltile;
    scr_darksize();
    visible = true;
    image_alpha = 1;
    depth = 999999;
}
topexit2 = instance_create(x + 160, y - 32, obj_board_solid);
with (topexit2)
{
    sprite_index = walltile;
    scr_darksize();
    visible = true;
    image_alpha = 1;
    depth = 999999;
}
with (topexit1)
    setxy(room_width, room_height);
with (topexit2)
    setxy(room_width, room_height);
flagtoset = 0;
made = 0;
shopwriter = 0;
raftwatch = 0;
