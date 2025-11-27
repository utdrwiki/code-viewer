burst = 0;
shift = 1;
image_alpha = 1;
flytime = 8;
if ((global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy)) || (global.chapter == 4 && i_ex(obj_sound_of_justice_enemy) && !i_ex(obj_herokris)))
{
    distx = obj_herosusie.x - 150;
    disty = obj_herosusie.y + 40;
}
else
{
    distx = obj_herokris.x + 10;
    disty = obj_herokris.y + 40;
}
dist = point_distance(x, y, distx, disty);
move_towards_point(distx, disty, dist / flytime);
alarm[0] = flytime;
image_speed = 0;
