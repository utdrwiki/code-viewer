if (init == 0)
{
    maxhp = hp;
    init = 1;
}
if (firstbullet == 1)
{
    with (obj_shadowman_sharpshoot_target)
        bullet_timer = 0;
}
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con >= 2 && !vanish)
{
    image_blend = c_white;
    scr_afterimage_grow();
    instance_destroy();
    exit;
}
if (vanish)
{
    hspeed = 0;
    image_alpha -= 0.2;
    if (image_alpha < 0)
        instance_destroy();
    exit;
}
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    obj_tenna_zoom.minigameinsanitytimer = obj_tenna_zoom.minigameinsanitytimermax - 7;
timer++;
if (timer > 200 && firstbullet == 0)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
if (hittimer >= 0)
{
    baseimageblend = merge_color(c_red, c_white, hp / maxhp);
    image_blend = baseimageblend;
    hittimer--;
}
if (invincibility >= 0)
{
    invincibility--;
    if (invincibility <= 0)
        image_blend = c_white;
}
global.inv--;
if (firstbullet == 0)
    damagetimer--;
if (damagetimer == 2)
    snd_play(snd_heartshot_dr);
if (damagetimer <= 0)
{
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con > 1)
    {
    }
    else
    {
        snd_play(snd_explosion_mmx);
        snd_play(snd_hurt1);
        if (i_ex(obj_tenna_enemy) && obj_lightemup_controller.invincibility < 1)
        {
            obj_tenna_enemy.minigamefailcount++;
            obj_lightemup_controller.invincibility = 30;
            instance_create(x, y, obj_clearbullets_fx);
            if (obj_tenna_enemy.minigameinsanity == 1)
            {
                with (obj_tenna_enemy)
                    minigamefailcount = 1;
            }
        }
        else
        {
            global.inv = -1;
            damage = 0;
            target = 3;
            scr_damage_all(damage);
        }
        scr_shakescreen();
    }
    image_blend = c_white;
    scr_afterimage_grow();
    instance_destroy();
}
if ((damagetimer % 3) == 0 && spritechangecon == 0)
{
    var afterimage = scr_afterimage();
    afterimage.image_alpha = 0.5;
}
if (specialmovement == 1)
{
    if (specialmovementcon == 0)
    {
        scr_lerpvar("x", xstart, xstart + random_range(-150, -20), specialmovementexpansiontime, 2, "out");
        scr_lerpvar("y", ystart, ystart + random_range(-76, 76), specialmovementexpansiontime, 2, "out");
        specialmovementcon = 1;
        specialmovementtimer = 0;
    }
    if (specialmovementcon == 1)
    {
        specialmovementtimer++;
        if (specialmovementtimer > specialmovementexpansiontime)
        {
            specialmovementtimer = 0;
            specialmovementcon = 2;
        }
    }
    if (specialmovementcon == 2)
    {
        specialmovementtimer++;
        if (specialmovementtimer >= specialmovementwaittime)
        {
            specialmovementcon = 3;
            if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.phaseturn == 18)
                damagetimer = round(specialmovementattacktime);
            scr_lerpvar("x", x, camerax() + 160, specialmovementattacktime, 0, "out");
            var midy = cameray() + 180;
            vspeed = (y - midy) / (specialmovementattacktime / 1.7);
            gravity = -vspeed / (specialmovementattacktime / 1.7);
        }
    }
    if (x < (camerax() + 170))
    {
        if (y < (cameray() + 178))
            y += 2;
        if (y > (cameray() + 182))
            y -= 2;
    }
}
if (sprite_index != spr_ball_collision_full_3xscale)
{
    if (y < ((cameray() + 180) - 80))
        y = (cameray() + 180) - 80;
    if (y > (cameray() + 180 + 80))
        y = cameray() + 180 + 80;
}
if (auto >= 1)
{
    if (auto == 1 && x < (camerax() + 220))
    {
        auto = 2;
        scr_lerpvar("y", y, cameray() + 160, 8, 2, "out");
        friction = 1;
        damagetimer = 5;
    }
}
if (bounce)
{
    if (y >= maxy)
        vspeed = -abs(vspeed);
    if (y <= miny)
        vspeed = abs(vspeed);
}
