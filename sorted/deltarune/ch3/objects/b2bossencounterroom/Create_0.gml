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
door = instance_create(x, y, obj_board_warptouch);
with (door)
{
    warpx = 896;
    warpy = 3392;
    playerX = 1024;
    playerY = 3552;
}
var displacex = -1536;
var displacey = 1552;
lefteye = scr_board_marker(4062 + displacex, 150 + displacey, spr_board_shutta_eyeShape, 0, 998080);
with (lefteye)
    setxy_board(x, y);
righteye = scr_board_marker(4222 + displacex, 150 + displacey, spr_board_shutta_eyeShape, 0, 998080);
with (righteye)
    setxy_board(x, y);
mouth = scr_board_marker(4128 + displacex, 160 + displacey, spr_board_shutta_mouth, 0, 998160);
with (mouth)
    setxy_board(x, y);
mouth.depth = 998119;
leftsolid = instance_create(4064 + displacex, 160 + displacey, obj_board_solid);
with (leftsolid)
    setxy_board(x, y);
rightsolid = instance_create(4224 + displacex, 160 + displacey, obj_board_solid);
with (rightsolid)
    setxy_board(x, y);
mouthsolid = instance_create(4128 + displacex, 172 + displacey, obj_board_solid);
with (mouthsolid)
    setxy_board(x, y);
mouthsolid.image_xscale = 2;
shopwriter = 0;
doorhide = 0;
prebat = 0;
batcon = 0;
battimer = 0;
cleanup = 0;
lpupil = 0;
rpupil = 0;
retry = false;
rebuild = false;
rauhoh = 0;
eyemarker1 = instance_create(x + 80, y + 96, obj_board_b2entrance_animatecamera);
with (eyemarker1)
{
    type = 1;
    amount = 0;
    sprite_index = spr_board_shutta_pupil;
    scr_size(2, 2);
    depth = 999990;
}
eyemarker1 = instance_create(x + 240, y + 96, obj_board_b2entrance_animatecamera);
with (eyemarker1)
{
    type = 1;
    amount = 0;
    sprite_index = spr_board_shutta_pupil;
    scr_size(2, 2);
    depth = 999990;
}
