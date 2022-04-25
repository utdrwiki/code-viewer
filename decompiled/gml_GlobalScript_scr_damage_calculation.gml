scr_damage_calculation = function(argument0, argument1) //gml_Script_scr_damage_calculation
{
    var _tdamage = argument0
    var _tdef = global.battledf[argument1]
    var _tmaxhp = global.maxhp[global.char[argument1]]
    var _finaldamage = 1
    var _hpthresholda = (_tmaxhp / 5)
    var _hpthresholdb = (_tmaxhp / 8)
    for (var _di = 0; _di < _tdef; _di++)
    {
        if (_tdamage > _hpthresholda)
            _tdamage -= 3
        else if (_tdamage > _hpthresholdb)
            _tdamage -= 2
        else
            _tdamage -= 1
    }
    return max(_tdamage, _finaldamage);
}

