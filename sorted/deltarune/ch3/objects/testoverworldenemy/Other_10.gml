if (encountered == 0)
{
    if (global.interact == 0 || global.interact == 4 || washit == 1)
    {
        encountered = 1;
        global.specialbattle = 0;
        global.flag[9] = 1;
        if (global.flag[9] == 1)
        {
            if (global.encounterno != 62 && global.encounterno != 84 && global.encounterno != 111 && global.encounterno != 113 && global.encounterno != 114 && global.encounterno != 115 && global.encounterno != 121 && global.encounterno != 140)
                global.batmusic[0] = snd_init("battle.ogg");
            if (global.encounterno == 111 || global.encounterno == 140)
                global.batmusic[0] = snd_init("rudebuster_boss.ogg");
            if (global.encounterno == 117 || global.encounterno == 125 || global.encounterno == 126)
                global.batmusic[0] = snd_init("battle.ogg");
            if (global.encounterno == 114)
            {
                debug_print("test hey what");
                global.batmusic[0] = snd_init("rouxls_battle.ogg");
            }
            if (global.encounterno == 115)
                global.batmusic[0] = snd_init("knight.ogg");
            if (global.encounterno == 121)
            {
                global.batmusic[0] = snd_init("tenna_battle.ogg");
                global.batmusic[2] = snd_init("tenna_battle_guitar.ogg");
                global.batmusic[3] = mus_loop(global.batmusic[2]);
                mus_volume(global.batmusic[3], 0, 0);
            }
        }
        alarm[5] = -300;
        vspeed = 0;
        global.interact = 1;
        con = 1;
    }
}
