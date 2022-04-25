scr_damage_all_overworld_ch1 = function() //gml_Script_scr_damage_all_overworld_ch1
{
    if (global.inv < 0)
    {
        remdamage = damage
        remtarget = target
        if (!instance_exists(obj_shake_ch1))
            instance_create_ch1(0, 0, obj_shake_ch1)
        with (obj_dmgwriter_ch1)
            killactive = true
        snd_stop_ch1(snd_hurt1_ch1)
        snd_play_ch1(snd_hurt1_ch1)
        for (ti = 0; ti < 3; ti += 1)
        {
            global.inv = -1
            damage = remdamage
            target = ti
            tdamage = damage
            with (global.charinstance[target])
            {
                hurt = true
                hurttimer = 0
            }
            hpdiff = tdamage
            if (hpdiff >= global.hp[global.char[target]])
                hpdiff = (global.hp[global.char[target]] - 1)
            d_cancel = false
            if (hpdiff <= 1)
            {
                d_cancel = true
                hpdiff = 0
            }
            if (d_cancel == false)
            {
                doomtype = -1
                global.hp[global.char[target]] -= hpdiff
                dmgwriter = instance_create_ch1(global.charinstance[target].x, ((global.charinstance[target].y + global.charinstance[target].myheight) - 24), obj_dmgwriter_ch1)
                dmgwriter.damage = hpdiff
                dmgwriter.type = doomtype
            }
            if (global.hp[global.char[target]] < 1)
                global.hp[global.char[target]] = 1
        }
        gameover = true
        if (global.char[0] != 0 && global.hp[global.char[0]] > 1)
            gameover = false
        if (global.char[1] != 0 && global.hp[global.char[1]] > 1)
            gameover = false
        if (global.char[2] != 0 && global.hp[global.char[2]] > 1)
            gameover = false
        if (gameover == true)
            scr_gameover_ch1()
        target = remtarget
        global.inv = (global.invc * 40)
    }
    return;
}

