image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
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
bombfun1visited = 0;
blocker = instance_create(x, y, obj_board_solid);
with (blocker)
{
    scr_darksize();
    sprite_index = spr_board_breakableblock;
    depth = 999990;
    setxy_board(3168, 1216);
    visible = true;
    image_alpha = 1;
    image_index = 1;
}
timer2 = 0;
mosscon = 0;
mosstimer = 0;
mossblock = 0;
