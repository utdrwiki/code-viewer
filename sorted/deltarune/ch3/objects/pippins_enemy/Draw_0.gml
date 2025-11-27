if (i_ex(obj_shadowman_sharpshoot_target))
    exit;
if (attackanim == true)
{
    if (attackanimcon == 0)
    {
        attackanimtimer++;
        attackanimindex += (2/3);
        if (attackanimindex > 3)
            attackanimindex = 3;
        if (attackanimtimer == 1)
        {
            speed = 10;
            friction = 1;
            snd_stop(snd_wing);
            snd_play(snd_wing);
        }
        if (attackanimtimer == 10)
        {
            attackanimtimer = 0;
            attackanimcon = 1;
        }
        draw_sprite_ext(spr_pippins_prepare, attackanimindex, x, y, 2, 2, 0, c_white, 1);
    }
    if (attackanimcon == 1)
    {
        attackanimtimer++;
        attackanimindex += (2/3);
        if (attackanimtimer == 3)
        {
            speed = -10;
            friction = 1;
        }
        if (global.turntimer < 1)
        {
            attackanimtimer = 0;
            attackanimcon = 2;
        }
        if (attackanimindex >= 6)
        {
            var rand = choose(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3);
            var spinsprite = 54;
            draw_sprite_ext(spinsprite, attackanimindex, x, y, 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(spr_pippins_prepare, attackanimindex, x, y, 2, 2, 0, c_white, 1);
        }
    }
    if (attackanimcon == 2)
    {
        attackanimcon = 0;
        attackanim = false;
        x = xstart;
    }
}
if (attackanim == false)
{
    var _image_speed = 0.25;
    if (global.mercymod[myself] >= global.mercymax[myself])
        _image_speed = 1/3;
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(_image_speed);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
