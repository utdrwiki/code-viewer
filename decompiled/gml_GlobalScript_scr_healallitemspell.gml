scr_healallitemspell = function(argument0) //gml_Script_scr_healallitemspell
{
    scr_healall(argument0)
    for (i = 0; i < 3; i += 1)
    {
        with (global.charinstance[i])
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
    }
    global.spelldelay = 20
    return;
}

