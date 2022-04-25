scr_bullet_heal = function(argument0) //gml_Script_scr_bullet_heal
{
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = true
    }
    if (target == 4)
    {
        scr_randomtarget_old()
        target = mytarget
    }
    if (target < 3)
    {
        if (global.hp[global.char[target]] <= 0)
        {
            scr_randomtarget_old()
            target = mytarget
            with (global.charinstance[target])
            {
                image_blend = c_white
                darkify = false
            }
        }
    }
    scr_heal(target, argument0)
    with (global.charinstance[target])
    {
        ha = instance_create(x, y, obj_healanim)
        ha.target = id
        dmgwr = scr_dmgwriter_selfchar()
        with (dmgwr)
        {
            delay = 8
            type = 3
            damage = argument0
        }
        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
        {
            with (dmgwr)
                specialmessage = 3
        }
        tu += 1
    }
    snd_stop(snd_power)
    snd_play(snd_power)
    return;
}

