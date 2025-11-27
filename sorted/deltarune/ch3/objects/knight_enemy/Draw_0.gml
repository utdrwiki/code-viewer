if (!i_ex(obj_knight_roaring2))
    siner2++;
if (i_ex(obj_knight_swordtunnelanim))
    exit;
if (chargeupcon == 2)
{
    chargeuptimer++;
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(idlesprite, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, (10 - chargeuptimer) / 10);
    d3d_set_fog(false, c_black, 0, 0);
    if (chargeuptimer == 10)
    {
        chargeupcon = 3;
        image_alpha = 0;
    }
    exit;
}
if (state == 0 || state == 3)
{
    if (ystart != global.monstermakey[myself])
    {
    }
    image_index = 0;
    y = ystart + (cos(siner2 / 8) * 8);
    aetimer++;
    if ((aetimer % 4) == 0 && image_alpha != 0 && chargeupcon == 0)
    {
        if (state == 0 && !i_ex(obj_knight_roaring2))
        {
            afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
            afterimage.sprite_index = spr_roaringknight_idle;
            afterimage.image_index = image_index;
        }
        if (state == 3)
        {
            afterimage = instance_create_depth(x + shakex + hurtspriteoffx, y + hurtspriteoffy, depth + 1, obj_afterimage);
            afterimage.image_index = image_index;
            if ((hurttimer % 2) == 0 || stronghurtanim == false)
            {
                afterimage.sprite_index = idlesprite;
            }
            else
            {
                afterimage.sprite_index = spr_roaringknight_ball_transition;
                afterimage.image_index = 7;
            }
        }
        afterimage.image_alpha = 0.6;
        afterimage.fadeSpeed = 0.02;
        afterimage.hspeed = 2;
        afterimage.image_speed = 0;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
    }
}
if (end_cutscene_version == 1)
{
    stronghurtanim = true;
    state = 3;
    shakex = 0;
}
if (state == 3 && hurttimer >= 0)
{
    if (haveusedroaring == true && end_cutscene_version == 0 && global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.8) && endcon != 1)
    {
        with (obj_spellphase)
        {
            scr_attackphase();
            with (spellwriter)
                instance_destroy();
            with (obj_face)
                instance_destroy();
            instance_destroy();
        }
        end_cutscene_version = 1;
        endcon = 1;
        mus_fade(global.batmusic[1], 1);
        inst = instance_create(x, y, obj_shake);
        if (i_ex(inst))
        {
            inst.shakex = 30;
            inst.shakey = 8;
            inst.shakespeed = 2;
        }
        stronghurtanim = true;
        hurttimer = 999;
        snd_play_x(snd_knight_hurt, 0.8, 1);
        snd_play_x(snd_knight_hurt, 0.8, 0.7);
        snd_play_x(snd_knight_hurt, 0.8, 1.3);
    }
    if (end_cutscene_version == 1)
    {
        if ((hurttimer % 3) == 0 || stronghurtanim == false)
            draw_sprite_ext(idlesprite, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
        else
            draw_sprite_ext(spr_roaringknight_ball_transition, 7, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
    }
    else if ((hurttimer % 2) == 0 || stronghurtanim == false)
    {
        draw_sprite_ext(idlesprite, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
    }
    else
    {
        draw_sprite_ext(spr_roaringknight_ball_transition, 7, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
    }
    if (hurttimer == 29 && stronghurtanim == true && end_cutscene_version == 0)
        snd_play(snd_knight_hurtb);
    if (hurttimer == 15)
        stronghurtanim = false;
}
scr_enemy_drawidle_generic(0.16666666666666666);
if (whiteflash > 0)
{
    whiteflash--;
    d3d_set_fog(true, c_white, 0, 1);
    if (state == 3 && hurttimer >= 0)
        draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 0.62);
    if (state == 0)
        draw_sprite_ext(idlesprite, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.62);
    d3d_set_fog(false, c_black, 0, 0);
}
if (chargeupcon == 1)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(idlesprite, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, chargeuptimer / 10);
    d3d_set_fog(false, c_black, 0, 0);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
