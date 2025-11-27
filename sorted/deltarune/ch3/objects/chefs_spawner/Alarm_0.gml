if (obj_chefs_game.gameover)
    exit;
var _obj = 781;
if (mode == 0)
{
    var _max = obj_chefs_game.timer_max;
    var _t = clamp(obj_chefs_game.timer, 15, _max);
    var _r = (_max - _t) / _max;
    if (obj_chefs_game.microgame == 0)
        alarm[0] = 57 - (30 * _r);
    else
        alarm[0] = freq;
}
else
{
    if (obj_chefs_game.microgame == 0)
        alarm[0] = 210 - (130 * ((obj_chefs_game.timer_max - obj_chefs_game.timer) / obj_chefs_game.timer_max));
    else
        alarm[0] = freq;
    _obj = 300;
    if (no_fire)
        exit;
}
food = instance_create(x, y, _obj);
with (food)
{
    if (other.mode == 1 && irandom(5) > 3)
    {
        side = 1;
        gravity_direction = 0;
    }
    else
    {
        firedie = other.firedie;
    }
    if (other.side != 0)
    {
        side = other.side;
        gravity_direction = 90 + (90 * side);
    }
}
if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.completedchefwithouttakingdamage && i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == false)
{
    alarm[0] = 35;
    side = choose(-1, 1);
}
var i = 0;
repeat (7)
{
    var afterimage = scr_afterimage();
    afterimage.y -= 10;
    afterimage.sprite_index = spr_launchsmoke;
    afterimage.direction = (i * 51) + random(90);
    afterimage.image_alpha = 0.8;
    afterimage.speed = 4;
    afterimage.image_xscale = 1;
    afterimage.image_yscale = 1;
    afterimage.image_blend = c_white;
    var rand = irandom(360);
    scr_lerpvar_instance(afterimage, "image_angle", rand, rand + 30, 17, 2, "in");
    scr_script_delayed(scr_lerpvar_instance, 3, afterimage, "image_xscale", 1, 0, 16, 2, "in");
    scr_script_delayed(scr_lerpvar_instance, 3, afterimage, "image_yscale", 1, 0, 16, 2, "in");
    afterimage.friction = 0.334;
    afterimage.fadeSpeed = 0.04;
    i++;
}
