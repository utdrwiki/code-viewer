if (cutoffpoint == 1)
{
    var _damage = floor((global.hp[1] - 1) / 2);
    with (obj_darkswordthrower)
    {
        damage = _damage;
        spring_length = 45;
        heavy = true;
    }
    with (obj_dw_churchc_darkswords)
        wound_kneeltime = 30;
}
if (cutoffpoint == 2)
{
    var _damage = global.hp[1] - 1;
    with (obj_darkswordthrower)
        damage = _damage;
}
if (cutoffpoint == 3)
{
    spring_length = 45;
    var _damage = floor((global.hp[2] - 1) / 3);
    with (obj_darkswordthrower)
    {
        damage = _damage;
        target = 1;
    }
    with (obj_dw_churchc_darkswords)
        friends_protecc_state = 1;
}
if (cutoffpoint == 4)
{
    var _damage = global.hp[2] - 1;
    with (obj_darkswordthrower)
        damage = _damage;
}
if (cutoffpoint == 5)
{
    spring_length = 45;
    target = 2;
    var _damage = floor((global.hp[3] - 1) / 2);
    with (obj_darkswordthrower)
    {
        damage = _damage;
        target = 2;
    }
    with (obj_dw_churchc_darkswords)
        friends_protecc_state = 4;
}
if (cutoffpoint == 6)
{
    var _damage = global.hp[3] - 1;
    with (obj_darkswordthrower)
        damage = _damage;
}
switch (pattern)
{
    case 0:
    default:
        Sword(20, 3);
        Sword(260, 3);
        break;
    case 1:
        Sword(40, 1);
        break;
    case 2:
        Sword(80, 1);
        break;
    case 3:
        Sword(180, 1);
        break;
    case 4:
        Sword(100, 1);
        Sword(180, 1);
        Sword(260, 1);
        break;
    case 5:
        Sword(140, 3);
        break;
    case 6:
        Sword(20, 1);
        Sword(100, 1);
        Sword(180, 1);
        Sword(260, 1);
        Sword(340, 1);
        break;
    case 7:
        Sword(20, 9);
        break;
    case 8:
        Sword(60, 1);
        Sword(140, 1);
        Sword(220, 1);
        Sword(300, 1);
        break;
    case 9:
        Sword(20, 1);
        Sword(100, 1);
        Sword(180, 1);
        Sword(220, 1);
        Sword(260, 1);
        Sword(300, 1);
        Sword(340, 1);
        break;
    case 10:
        Sword(20, 5);
        Sword(260, 3);
        break;
}
instance_destroy();
