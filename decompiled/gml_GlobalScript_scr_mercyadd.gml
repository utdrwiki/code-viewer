scr_mercyadd = function(argument0, argument1) //gml_Script_scr_mercyadd
{
    global.mercymod[argument0] += argument1
    if (global.mercymod[argument0] < 0)
        global.mercymod[argument0] = 0
    if (global.mercymod[argument0] >= 100)
        global.mercymod[argument0] = 100
    var _playsound = true
    if (argument1 <= 0)
        _playsound = false
    if i_ex(obj_dmgwriter)
    {
        with (obj_dmgwriter)
        {
            if (type == 5)
                _playsound = false
        }
    }
    if _playsound
    {
        var _pitch = 0.8
        if (argument1 < 99)
            _pitch = 1
        if (argument1 <= 50)
            _pitch = 1.2
        if (argument1 <= 25)
            _pitch = 1.4
        snd_play_x(snd_mercyadd, 0.8, _pitch)
    }
    __mercydmgwriter = instance_create(global.monsterx[argument0], ((global.monstery[argument0] + 20) - (global.hittarget[argument0] * 20)), obj_dmgwriter)
    __mercydmgwriter.damage = argument1
    __mercydmgwriter.type = 5
    global.hittarget[argument0] = (global.hittarget[argument0] + 1)
    return;
}

