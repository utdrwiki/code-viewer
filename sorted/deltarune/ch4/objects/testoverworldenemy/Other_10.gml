if (encountered == 0)
{
    if (global.interact == 0 || global.interact == 4 || washit == 1)
    {
        encountered = 1;
        global.specialbattle = 0;
        global.flag[9] = 1;
        if (global.flag[9] == 1)
        {
            if (global.encounterno != 160 && global.encounterno != 174 && global.encounterno != 176)
            {
                if (global.chapter == 4 && room != room_dw_castle_dojo)
                    global.batmusic[0] = snd_init("ch4_battle.ogg");
                else
                    global.batmusic[0] = snd_init("battle.ogg");
            }
            if (global.encounterno == 160)
                global.batmusic[0] = snd_init("ch4_extra_boss.ogg");
            if (global.encounterno == 174)
            {
                global.batmusic[0] = snd_init("pumpkin_boss.ogg");
                scr_setchar(1, 1);
            }
            if (global.encounterno == 175)
            {
                global.batmusic[0] = snd_init("titan_battle.ogg");
                scr_setchar(1, 1);
            }
            if (global.encounterno == 176 || global.encounterno == 186)
            {
                global.batmusic[0] = snd_init("statue_chord_basic.ogg");
                scr_setchar(1, 1);
            }
            if (global.encounterno == 177)
            {
                global.batmusic[0] = snd_init("titan_battle.ogg");
                scr_setchar(1, 1);
            }
            if (global.encounterno == 178)
                scr_setchar(1, 1);
        }
        alarm[5] = -300;
        vspeed = 0;
        global.interact = 1;
        con = 1;
    }
}
