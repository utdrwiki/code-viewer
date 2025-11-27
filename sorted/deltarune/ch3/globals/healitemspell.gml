function scr_healitemspell(arg0)
{
    var __healAmount = scr_heal_amount_modify_by_equipment(arg0);
    scr_heal(star, __healAmount);
    global.spelldelay = 15;
    with (global.charinstance[star])
    {
        ha = instance_create(x, y, obj_healanim);
        ha.target = id;
        dmgwr = scr_dmgwriter_selfchar();
        with (dmgwr)
        {
            delay = 8;
            type = 3;
            damage = __healAmount;
        }
        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
        {
            with (dmgwr)
                specialmessage = 3;
        }
        tu += 1;
        return ha;
    }
}
