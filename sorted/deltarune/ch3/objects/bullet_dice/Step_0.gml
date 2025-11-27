event_inherited();
image_angle += rot_speed;
if (abs((x + hspeed) - obj_growtangle.x) > 65)
{
    rot_speed *= -0.8;
    hspeed *= -0.9;
    x += hspeed;
}
if (decel == -1)
{
    vspeed = scr_approach(vspeed, max_speed, 0.4);
}
else if (decel > 0)
{
    speed = scr_approach_curve(speed, 0, decel);
    hspeed = scr_approach_curve(hspeed, 0, sqr(decel));
    rot_speed = scr_approach_curve(rot_speed, 0, decel);
    decel--;
    if (decel == 10)
        queue_lock = true;
    if (decel == 0)
    {
        if (alarm[1] == -1)
            alarm[1] = 20;
        decel = -2;
    }
}
if ((y + vspeed) > (obj_growtangle.y + 58) && vspeed > 0)
{
    vspeed *= choose(-0.3, -0.6, -0.8, -1);
    if (decel == -1)
        decel = 15;
    snd_play(snd_bump);
}
if ((mercified && sprite_index == spr_bullet_dice_all4s) || (mercified && image_index >= 10 && image_index < 15 && sprite_index == spr_bullet_dice4pip))
    mask_index = spr_bullet_dice_6;
else
    mask_index = spr_bullet_dice4pip;
