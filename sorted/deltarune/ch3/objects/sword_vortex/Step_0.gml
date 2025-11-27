image_alpha += 0.1;
dir -= (spinspeed * lerp(2, 1, len / 120));
image_angle = dir - 90;
if (i_ex(obj_sword_vortex_manager))
{
    len = lenstart + (sin(obj_sword_vortex_manager.siner / sinspeed) * sinpower);
    x = obj_sword_vortex_manager.swordcirclecenterx + lengthdir_x(len, dir);
    y = obj_sword_vortex_manager.swordcirclecentery + lengthdir_y(len, dir);
    lenstart -= shrinkrate;
}
timer++;
if ((timer % 4) == 0)
    grazed = 0;
