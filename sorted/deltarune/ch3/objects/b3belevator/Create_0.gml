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
blocker = 0;
tetimer = 0;
teactive = 0;
elevatorsound = 0;
ld = scr_board_marker(1470, 1410, spr_pxwhite, 0, 999998, 2);
ld.image_yscale = 58;
with (ld)
    setxy_board(x, y);
ld.image_blend = #5E5E5E;
rd = scr_board_marker(1470, 1410, spr_pxwhite, 0, 999998, 2);
rd.image_yscale = 58;
with (rd)
    setxy_board(x, y);
rd.image_blend = #5E5E5E;
block = instance_create(1440, 1440, obj_board_solid);
block.image_xscale = 2;
with (block)
    setxy_board(x, y);
