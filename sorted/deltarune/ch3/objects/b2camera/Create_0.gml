image_alpha = 0;
active = false;
init = 0;
con = 0;
camcon = 0;
camtimer = 0;
timer = 0;
tetalker = 0;
raphoto = 0;
suphoto = 0;
krphoto = 0;
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
key = 0;
krisphoto = 0;
krtimer = 0;
batcon = 0;
battimer = 0;
lefteye = 0;
leftsolid = 0;
righteye = 0;
rightsolid = 0;
mouth = 0;
mouthsolid = 0;
realmouth = 0;
lpupil = 0;
rpupil = 0;
cleanup = 0;
makewriter = 0;
madewriter = 0;
shopwriter = 0;
prebat = 0;
noreturn = 0;
eyemarker1 = instance_create(x + 64 + 16, y + 64 + 16, obj_board_b2entrance_animatecamera);
with (eyemarker1)
{
    type = 1;
    amount = 0;
    sprite_index = spr_board_shutta_pupil;
    scr_size(2, 2);
    depth = 999990;
}
eyemarker1 = instance_create(x + 224 + 16, y + 64 + 16, obj_board_b2entrance_animatecamera);
with (eyemarker1)
{
    type = 1;
    amount = 0;
    sprite_index = spr_board_shutta_pupil;
    scr_size(2, 2);
    depth = 999990;
}
