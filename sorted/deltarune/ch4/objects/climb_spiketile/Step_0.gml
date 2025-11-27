if (r_init == 0)
{
    if (_rdamage != -1)
        damage = _rdamage;
    r_init = 1;
    with (instance_create(x, y, obj_climb_notsafe))
        scr_sizeexact(40, 40);
}
