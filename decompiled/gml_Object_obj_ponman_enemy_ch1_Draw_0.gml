if (state == 3)
{
    if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
    {
        global.monsterstatus[myself] = true
        if (global.monstercomment[myself] == " ")
            global.monstercomment[myself] = scr_84_get_lang_string_ch1("obj_ponman_enemy_slash_Draw_0_gml_6_0")
    }
    hurttimer -= 1
    if (hurttimer < 0)
        state = 0
    else
    {
        if (global.monster[myself] == false)
        {
            hspeed = 12
            turnt -= 8
            vspeed = -4
        }
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
        draw_sprite_ext(spr_ponman_idle_ch1, 0, (x + shakex), y, 2, 2, 0, image_blend, 1)
        if (sleeping == false)
            draw_sprite_ext(spr_ponman_eye_ch1, 0, ((x + 28) + eyex), ((y + 32) + eyey), 2, 2, 0, c_white, 1)
        if (sleeping == true)
        {
            scr_mercyadd_ch1(myself, -100)
            sprite_index = spr_ponman_idle_ch1
            image_index = 0
            sleeping = false
        }
    }
}
if (state == 0)
{
    thissprite = spr_ponman_idle_ch1
    this_index = image_index
    if (sleeping == true)
    {
        thissprite = spr_ponman_appear_ch1
        this_index = sleep_index
        if (sleep_index > 0.5)
            sleep_index -= 0.25
    }
    draw_sprite_ext(thissprite, this_index, x, y, 2, 2, 0, image_blend, 1)
    if (sleeping == false)
        draw_sprite_ext(spr_ponman_eye_ch1, 0, ((x + 28) + eyex), ((y + 32) + eyey), 2, 2, 0, c_white, 1)
    if (flash == true)
    {
        fsiner += 1
        d3d_set_fog_ch1(true, c_white, 0, 1)
        draw_sprite_ext(thissprite, this_index, x, y, 2, 2, 0, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
        d3d_set_fog_ch1(false, c_black, 0, 0)
    }
}
if (becomeflash == false)
    flash = false
becomeflash = false
