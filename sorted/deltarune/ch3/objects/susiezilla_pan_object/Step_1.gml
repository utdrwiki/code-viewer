if (!instance_exists(obj_susiezilla_player))
    instance_destroy();
var lx = 0;
var rx = 1280;
var shakeval = 0;
var susie_x = obj_susiezilla_player.myxcenter;
var camx = 0;
with (obj_susiezilla_gamecontroller)
{
    lx = xorig;
    rx = xorig + width;
    shakeval = shake;
    if (gameover)
    {
        instance_destroy(other.id);
        exit;
    }
}
if (alarm[0] != -1)
{
    sus_mult = scr_approach(sus_mult, 0, 0.025);
    pan_mult = scr_approach(pan_mult, 1, 0.025);
}
if (alarm[2] != -1)
{
    sus_mult = scr_approach(sus_mult, 1, 1/30);
    pan_mult = scr_approach(pan_mult, 0, 1/30);
}
camx = (susie_x * sus_mult) + (pan_x * pan_mult);
camerax_set(clamp(camx - 320, lx, rx - 640) + random_range(-shakeval, shakeval));
cameray_set(random_range(-shakeval, shakeval));
