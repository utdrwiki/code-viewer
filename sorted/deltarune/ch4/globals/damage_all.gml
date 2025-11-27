function scr_damage_all(arg0 = 1)
{
    if (global.inv < 0)
    {
        remdamage = damage;
        _temptarget = target;
        for (ti = 0; ti < 3; ti += 1)
        {
            global.inv = -1;
            damage = remdamage;
            var _inverse_proportion = 1 - arg0;
            var _damscale = global.hp[global.char[ti]] / global.maxhp[global.char[ti]];
            var _dammod = (_damscale * _inverse_proportion) + (1 * arg0);
            damage *= _dammod;
            target = ti;
            if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
                scr_damage();
        }
        global.inv = global.invc * 40;
        target = _temptarget;
    }
}
