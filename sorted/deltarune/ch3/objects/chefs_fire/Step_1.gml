if (i_ex(obj_chefs_customer) && obj_chefs_customer.tenna)
    depth = -99999;
if (!i_ex(obj_chefs_game))
{
    instance_destroy();
    exit;
}
if (obj_chefs_game.gameover)
{
    speed = 0;
    exit;
}
if (stationary)
{
    speed = 0;
    x = xstart;
    y = ystart;
    gravity = 0;
    exit;
}
if (flamewhip == true && sprite_index != spr_tenna_grasp_chef_nose_5)
{
}
else if (jumpover != -1)
{
    var _check = collision_line(x, y, x, y - 96 - 50, obj_chefs_kris, false, true);
    if (jumpover == 1)
    {
        if (instance_place(x, y, obj_chefs_kris))
            jumpover = -1;
        if (i_ex(obj_chefs_kris) && sprite_index == spr_chefs_kris_stun)
        {
        }
        else if (_check == -4)
        {
            jumpover = 2;
            audio_stop_sound(snd_barrel_jump);
            snd_play(snd_barrel_jump);
            with (instance_create(x, y, obj_chefs_100pts))
                sprite_index = spr_chefs_plus2;
        }
    }
    if (_check != -4)
    {
        if (!_check.invincible && !_check.firewait && _check.jumping)
        {
            pcheck = _check;
            jumpover = 1;
        }
    }
}
if (falling == 1)
{
    if (side == -1 && x > room_width)
        instance_destroy();
    if (side == 1 && x < 0)
        instance_destroy();
}
if (!falling && (y < -16 || x < -16 || minigameinsanity))
{
    falling = 1;
    vspeed = 0;
    gravity = 0;
    hspeed = fallspeed * -side;
    y = obj_chefs_kris.ystart + 40;
    var _x = 0;
    if (minigameinsanity)
        _x = -10 + irandom(40);
    if (extrafar)
        _x = -310 - irandom(40);
    if (side == -1)
    {
        x = 0 + _x;
        if (!minigameinsanity)
            instance_create_depth(x + 64, y, -10, obj_chefs_foodnotice);
    }
    else
    {
        x = room_width - _x;
        if (!minigameinsanity)
            instance_create_depth(x - 64, y, -10, obj_chefs_foodnotice);
    }
}
if (falling && forcefall == false)
{
    fallspeed = 3.75 + (1 * ((90 - obj_chefs_game.timer) / 60));
    hspeed = fallspeed;
    if (side == 1)
        hspeed = -fallspeed * 1.3;
    if ((i_ex(obj_tenna_zoom) && minigameinsanity && obj_tenna_zoom.minigameinsanitytimermax <= 70) || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.completedchefwithouttakingdamage))
        hspeed *= 2;
}
