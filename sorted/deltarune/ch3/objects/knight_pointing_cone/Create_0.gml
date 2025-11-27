surf = -4;
starsurf = -4;
angle = 0;
target_angle = 60;
bg_x = 0;
lines_x = 0;
tween = 0;
ease = 0;
angle_lerp = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
if (i_ex(obj_knight_enemy))
{
    obj_knight_enemy.visible = false;
    aetimer = obj_knight_enemy.aetimer;
}
else
{
    aetimer = 0;
}
con = 0;
difficulty = 0;
yoff = irandom(60) + 2;
timer = 0;
fake_gt = instance_create(x, y, obj_fake_gt);
gt_x = obj_growtangle.x;
knockback = 0;
star_flicker = 0;
draw_angle = 0;
starlist[0] = -1;
childlist[0] = -1;
point_frame = 0;
afterimage_spread = 0;
image_timer = 0;
timerb = 0;
endtimer = 120;
child_attack = false;
count = 0;
