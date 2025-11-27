function scr_gamestart_chapter_override()
{
    global.plot = 0;
    global.char[0] = 1;
    global.char[1] = 0;
    global.char[2] = 0;
    scr_litemremove(1);
    scr_litemremove(4);
    scr_litemremove(8);
    scr_litemremove(9);
    scr_litemremove(10);
    global.phone[1] = 0;
    global.phone[2] = 0;
    scr_keyitemremove(2);
    scr_keyitemremove(3);
    scr_keyitemremove(4);
    scr_keyitemremove(5);
    scr_keyitemremove(6);
    scr_keyitemremove(7);
    scr_keyitemremove(8);
    scr_keyitemremove(9);
    scr_keyitemremove(10);
    scr_keyitemremove(11);
    scr_keyitemremove(12);
    scr_keyitemremove(14);
    scr_keyitemremove(15);
    scr_itemremove(4);
    if (global.flag[64] < 24)
        global.flag[64] = 24;
    if (global.chapter == 3)
    {
        global.flag[1173] = 0;
        global.flag[1174] = 0;
        global.flag[1194] = 0;
        global.flag[1196] = 0;
        global.flag[1198] = 0;
        for (var i = 0; i < 20; i++)
            global.battlegrade[i] = "Z";
        global.swordboardeath = 0;
        global.maxhp[1] = 160;
        global.hp[1] = global.maxhp[1];
        global.at[1] = 14;
        global.maxhp[2] = 190;
        global.hp[2] = global.maxhp[2];
        global.at[2] = 18;
        global.mag[2] = 2;
        global.maxhp[3] = 140;
        global.hp[3] = global.maxhp[3];
        global.at[3] = 12;
        global.mag[3] = 11;
        scr_funnytext_init_sounds();
    }
    if (global.chapter > 2)
    {
        global.flag[7] = 0;
        global.flag[9] = 1;
        global.flag[10] = 1;
        global.flag[16] = 0.85;
        global.flag[20] = 0;
        global.flag[21] = 0;
        global.flag[31] = 1;
        global.flag[32] = 0;
    }
}
