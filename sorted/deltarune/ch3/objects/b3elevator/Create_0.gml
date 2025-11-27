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
banister = instance_create(x, y, obj_board_solid);
banister.visible = true;
banister.sprite_index = spr_board_b3banister;
scr_darksize(banister);
with (banister)
    setxy_board(1600, 1696);
with (banister)
    scr_board_depth();
delbanister = 0;
