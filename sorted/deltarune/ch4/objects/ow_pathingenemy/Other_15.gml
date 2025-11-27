if (active == 1)
{
    var remdam = damage;
    var lowhp = 999;
    for (var i = 1; i < 4; i++)
    {
        if (global.hp[i] < lowhp)
            lowhp = global.hp[i];
    }
    if (lowhp < 120)
        damage = 20;
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all_overworld();
    with (obj_darkcontroller)
        charcon = 1;
    global.interact = 1;
    with (obj_mainchara)
        alarm[1] = 7;
    hit = 1;
    global.inv = 60;
    damage = remdam;
}
