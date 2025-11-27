function scr_damage_manual(arg0)
{
    var _rem_damage = arg0;
    if (v_ex("damage"))
        _rem_damage = damage;
    damage = arg0;
    scr_damage();
    damage = _rem_damage;
}
