if (state == 3)
{
    if (global.monsterhp[myself] < (global.monstermaxhp[myself] / 4))
    {
        with (obj_monsterparent_ch1)
            defeated = 1
        global.monsterhp[myself] = (global.monstermaxhp[myself] / 4)
    }
    hurttimer -= 1
    if (hurttimer < 0)
        state = 0
    else
    {
        if (global.monster[myself] == false)
            hspeed = 12
        hurtshake += 1
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1
            if (shakex < 0)
                shakex += 1
            shakex = (-shakex)
            hurtshake = 0
        }
        draw_sprite_ext(spr_lancerbike_hurt_ch1, (hurttimer / 2), (x + shakex), y, 2, 2, 0, image_blend, 1)
    }
}
if (state == 4)
{
    dodgetimer += 1
    dodgeamt = (cos((((dodgetimer * 2) * pi) / 15)) * 2)
    draw_sprite_ext(spr_lancerbike_l_ch1, 0, x, y, dodgeamt, 2, 0, image_blend, 1)
    if (dodgetimer >= 15)
        state = 0
}
if (state == 0)
{
    siner += 1
    thissprite = idlesprite
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = idlesprite
    draw_sprite_ext(thissprite, (siner / 5), x, y, 2, 2, 0, image_blend, 1)
    if (flash == true)
    {
        fsiner += 1
        d3d_set_fog_ch1(true, c_white, 0, 1)
        draw_sprite_ext(thissprite, (siner / 5), x, y, 2, 2, 0, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
        d3d_set_fog_ch1(false, c_black, 0, 0)
    }
}
if (becomeflash == false)
    flash = false
becomeflash = false
