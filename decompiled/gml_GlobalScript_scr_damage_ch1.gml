scr_damage_ch1 = function() //gml_Script_scr_damage_ch1
{
    var debug_inv = false
    if variable_global_exists("chemg_god_mode")
        debug_inv = global.chemg_god_mode
    if (global.inv < 0 && debug_inv == false)
    {
        if (target < 3)
        {
            if (global.hp[global.char[target]] <= 0)
            {
                scr_randomtarget_ch1()
                target = mytarget
                with (global.charinstance[target])
                {
                    image_blend = c_white
                    darkify = false
                }
            }
        }
        chartarget = 3
        tdamage = damage
        if (target < 3)
        {
            tdamage = ceil((tdamage - (global.battledf[target] * 3)))
            chartarget = global.char[target]
            if (global.charaction[target] == 10)
                tdamage = ceil(((2 * tdamage) / 3))
            if (tdamage < 1)
                tdamage = 1
        }
        if (!instance_exists(obj_shake_ch1))
            instance_create_ch1(0, 0, obj_shake_ch1)
        with (global.charinstance[target])
        {
            hurt = true
            hurttimer = 0
        }
        hpdiff = tdamage
        with (obj_dmgwriter_ch1)
        {
            if (delaytimer >= 1)
                killactive = true
        }
        doomtype = -1
        with (obj_heart_ch1)
            dmgnoise = true
        if (target < 3)
        {
            if (global.hp[chartarget] <= 0)
            {
                doomtype = 4
                global.hp[chartarget] -= round((tdamage / 4))
                hpdiff = round((tdamage / 4))
            }
            else
            {
                global.hp[chartarget] -= tdamage
                if (global.hp[chartarget] <= 0)
                {
                    hpdiff = abs((global.hp[chartarget] - (global.maxhp[chartarget] / 2)))
                    doomtype = 4
                    global.hp[chartarget] = round(((-global.maxhp[chartarget]) / 2))
                    scr_dead_ch1(target)
                }
            }
            dmgwriter = instance_create_ch1(global.charinstance[target].x, ((global.charinstance[target].y + global.charinstance[target].myheight) - 24), obj_dmgwriter_ch1)
            dmgwriter.damage = hpdiff
            dmgwriter.type = doomtype
        }
        if (target == 3)
        {
            for (hpi = 0; hpi < 3; hpi += 1)
            {
                chartarget = global.char[hpi]
                if (global.hp[chartarget] >= 0)
                {
                    if (global.charaction[hpi] == 10)
                        global.hp[chartarget] -= ceil((tdamage / 2))
                    else
                        global.hp[chartarget] -= tdamage
                    if (global.hp[chartarget] <= 0)
                        global.hp[chartarget] = round(((-global.maxhp[0]) / 2))
                }
            }
        }
        global.inv = (global.invc * 40)
        gameover = true
        if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
            gameover = false
        if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
            gameover = false
        if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
            gameover = false
        if (gameover == true)
            scr_gameover_ch1()
    }
    return;
}

