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
blackmarker = 0;
overhang = scr_board_marker(1442, 1600, spr_board_b3belevatorroomoverhang, 0, 100005, 2);
with (overhang)
    setxy_board(x, y);
blocker = instance_create(1440, 1660, obj_board_solid);
blocker.image_xscale = 2;
with (blocker)
    setxy_board(x, y);
