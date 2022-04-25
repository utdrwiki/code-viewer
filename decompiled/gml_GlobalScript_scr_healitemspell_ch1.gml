scr_healitemspell_ch1 = function(argument0) //gml_Script_scr_healitemspell_ch1
{
    scr_heal_ch1(star, argument0)
    with (global.charinstance[star])
    {
        ha = instance_create_ch1(x, y, obj_healanim_ch1)
        ha.target = id
        dmgwr = scr_dmgwriter_selfchar_ch1()
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
    global.spelldelay = 15
    return;
}

