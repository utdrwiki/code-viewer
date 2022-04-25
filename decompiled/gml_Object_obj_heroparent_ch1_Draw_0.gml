if (global.hp[global.char[myself]] > 0)
{
    if (global.myfight == 3 && global.faceaction[myself] == 6)
        state = 6
    if (state == 0 && hurt == false)
    {
        acttimer = 0
        thissprite = idlesprite
        if (global.faceaction[myself] == 1)
            thissprite = attackreadysprite
        if (global.faceaction[myself] == 3)
            thissprite = itemreadysprite
        if (global.faceaction[myself] == 2)
            thissprite = spellreadysprite
        if (global.faceaction[myself] == 6)
            thissprite = actreadysprite
        if (global.charcond[myself] == 5)
        {
            thissprite = defeatsprite
            global.faceaction[myself] = 9
        }
        if (global.faceaction[myself] == 4)
        {
            thissprite = defendsprite
            index = defendtimer
            if (defendtimer < defendframes)
                defendtimer += 0.5
        }
        else
        {
            defendtimer = 0
            index = (siner / 5)
        }
        siner += 1
    }
    if (state == 1 && hurt == false)
    {
        siner += 1
        if (attacked == false)
        {
            snd_stop_ch1(snd_laz_c_ch1)
            if (object_index == obj_herokris_ch1)
                snd_play_ch1(snd_laz_c_ch1)
            if (object_index == obj_heroralsei_ch1)
            {
                ls = snd_play_ch1(snd_laz_c_ch1)
                snd_pitch_ch1(ls, 1.15)
            }
            if (object_index == obj_herosusie_ch1)
            {
                ls = snd_play_ch1(snd_laz_c_ch1)
                snd_pitch_ch1(ls, 0.9)
            }
            if (points == 150)
            {
                snd_stop_ch1(snd_criticalswing_ch1)
                snd_play_ch1(snd_criticalswing_ch1)
                repeat (3)
                {
                    anim = instance_create_ch1(((x + mywidth) + random(50)), ((y + 30) + random(30)), obj_afterimage_ch1)
                    anim.sprite_index = spr_lightfairy_ch1
                    anim.image_speed = 0.25
                    anim.depth = -20
                    anim.image_xscale = 2
                    anim.image_yscale = 2
                    anim.hspeed = (2 + random(4))
                    anim.friction = -0.25
                }
            }
            attacked = true
            alarm[1] = 10
        }
        if (attacktimer < attackframes)
            image_index = attacktimer
        else
            image_index = attackframes
        thissprite = attacksprite
        index = image_index
        attacktimer += attackspeed
    }
    if (state == 2 && hurt == false)
    {
        siner += 1
        if (itemed == false)
        {
            itemed = true
            alarm[4] = 15
        }
        if (attacktimer < spellframes)
            image_index = attacktimer
        else
            image_index = spellframes
        if (scr_monsterpop_ch1() == 0)
            attacktimer = 0
        thissprite = spellsprite
        index = image_index
        attacktimer += 0.5
    }
    if (state == 4 && hurt == false)
    {
        siner += 1
        if (itemed == false)
        {
            itemed = true
            alarm[4] = 15
        }
        if (attacktimer < itemframes)
            image_index = attacktimer
        else
            image_index = itemframes
        if (scr_monsterpop_ch1() == 0)
            attacktimer = 0
        index = image_index
        thissprite = itemsprite
        attacktimer += 0.5
    }
    if (state == 6)
    {
        if (global.myfight == 3)
        {
            if (acttimer < actframes)
                acttimer += 0.5
        }
        else
            acttimer += 0.5
        thissprite = actsprite
        index = acttimer
        if (acttimer >= actreturnframes)
        {
            acttimer = 0
            state = 0
            global.faceaction[myself] = 0
        }
    }
    if (state == 7)
    {
        hurt = false
        hurttimer = 0
        if (victoryanim < victoryframes)
        {
            thissprite = victorysprite
            index = victoryanim
            victoryanim += 0.334
        }
        else
        {
            thissprite = normalsprite
            index = 0
        }
    }
    if (hurt == true)
    {
        hurtindex = (hurttimer / 2)
        if (hurtindex > 2)
            hurtindex = 2
        if (global.charcond[myself] == 5)
        {
            global.faceaction[myself] = 5
            global.charmove[myself] = true
            global.charcond[myself] = 0
        }
        if (global.faceaction[myself] == 0)
            global.faceaction[myself] = 5
        if (global.faceaction[myself] != 4)
        {
            specdraw = 1
            draw_sprite_ext(hurtsprite, hurtindex, ((x - 20) + (hurtindex * 10)), y, 2, 2, 0, image_blend, image_alpha)
        }
        else
        {
            specdraw = 1
            thissprite = defendsprite
            index = defendtimer
            draw_sprite_ext(defendsprite, defendtimer, ((x - 20) + (hurtindex * 10)), y, 2, 2, 0, image_blend, image_alpha)
        }
        if (hurttimer > 15)
        {
            hurttimer = 0
            hurt = false
            if (global.faceaction[myself] == 5)
                global.faceaction[myself] = 0
        }
        hurttimer += 1
    }
}
else
{
    global.charcond[myself] = 0
    hurttimer = 0
    hurt = false
    thissprite = defeatsprite
    index = 0
    siner += 1
}
if (specdraw == 0)
{
    sprite_index = thissprite
    image_index = index
    draw_sprite_ext(thissprite, index, x, y, 2, 2, 0, image_blend, image_alpha)
    if (flash == true)
    {
        fsiner += 1
        d3d_set_fog_ch1(true, c_white, 0, 1)
        draw_sprite_ext(thissprite, index, x, y, 2, 2, 0, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
        d3d_set_fog_ch1(false, c_black, 0, 0)
    }
}
specdraw = 0
if (becomeflash == false)
    flash = false
if (global.targeted[myself] == true)
{
    if (global.mnfight == 1)
        draw_sprite_ext(spr_chartarget_ch1, (siner / 10), x, y, 2, 2, 0, c_white, 1)
}
else if (combatdarken == true && instance_exists(obj_darkener_ch1))
{
    if (darkify == true)
    {
        if (darkentimer < 15)
            darkentimer += 1
        image_blend = merge_color(c_white, c_black, (darkentimer / 30))
    }
}
if (darkify == false)
{
    if (darkentimer > 0)
        darkentimer -= 3
    image_blend = merge_color(c_white, c_black, (darkentimer / 30))
}
becomeflash = false
