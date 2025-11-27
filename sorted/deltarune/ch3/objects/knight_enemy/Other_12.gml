if (global.inv < 0)
{
    remdamage = damage;
    _temptarget = target;
    for (ti = 0; ti < 3; ti += 1)
    {
        global.inv = -1;
        damage = 40;
        if (ti == 0 && global.hp[1] > 1 && global.hp[1] < 41)
            damage = global.hp[1] - 1;
        if (ti == 1 && global.hp[2] > 1 && global.hp[2] < 41)
            damage = global.hp[2] - 1;
        if (ti == 2 && global.hp[3] > 1 && global.hp[3] < 41)
            damage = global.hp[3] - 1;
        target = ti;
        if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
            scr_damage();
    }
    global.inv = global.invc * 30;
    target = _temptarget;
}
