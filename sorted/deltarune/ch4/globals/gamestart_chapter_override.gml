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
    scr_keyitemremove(16);
    scr_keyitemremove(17);
    scr_keyitemremove(18);
    scr_keyitemremove(19);
    scr_keyitemremove_all(8);
    scr_itemremove(4);
    if (global.chapter == 4)
    {
        global.maxhp[1] = 200;
        global.hp[1] = global.maxhp[1];
        global.at[1] = 17;
        global.maxhp[2] = 230;
        global.hp[2] = global.maxhp[2];
        global.at[2] = 22;
        global.mag[2] = 3;
        global.maxhp[3] = 180;
        global.hp[3] = global.maxhp[3];
        global.at[3] = 15;
        global.mag[3] = 14;
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
        var took_watch = false;
        scr_litemcheck(14);
        took_watch = haveit || scr_armorcheck_equipped_party(14) || scr_armorcheck_inventory(14);
        if (took_watch)
        {
            scr_flag_set(708, 1);
            if (scr_sideb_active())
            {
                scr_litemget(3);
                scr_litemremove(14);
                scr_armorremove(14);
            }
        }
        if (global.chapter >= 3)
        {
            var has_shard = scr_weaponcheck_inventory(26) == 1 || scr_weaponcheck_equipped_any(26) >= 1;
            if (has_shard)
                scr_litemget(17);
        }
    }
    if (global.chapter >= 2)
        global.flag[64] = 24;
    if (global.chapter >= 4)
        global.flag[64] = 36;
    if (global.chapter >= 6)
        global.flag[64] = 48;
    if (global.flag[241] >= 6)
        scr_get_shadow_crystal(1);
    if (global.flag[309] >= 9)
        scr_get_shadow_crystal(2);
    if (global.flag[1047] == 1)
        scr_get_shadow_crystal(3);
}
