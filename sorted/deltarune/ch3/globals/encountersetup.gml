function scr_encountersetup(arg0)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    for (i = 0; i < 3; i += 1)
    {
        global.heromakex[i] = xx + 80;
        global.heromakey[i] = yy + 50 + (80 * i);
        global.monsterinstancetype[i] = obj_baseenemy;
        global.monstertype[i] = 1;
        global.monstermakex[i] = xx + 500 + (20 * i);
        global.monstermakey[i] = yy + 40 + (90 * i);
    }
    global.monstertype[1] = 0;
    global.monstertype[2] = 0;
    if (global.char[0] != 0 && global.char[1] == 0 && global.char[2] == 0)
        global.heromakey[0] = yy + 140;
    if (global.char[0] != 0 && global.char[1] != 0 && global.char[2] == 0)
    {
        global.heromakey[0] = yy + 100;
        global.heromakey[1] = yy + 180;
    }
    global.battlemsg[0] = stringsetloc("* It is known.", "scr_encountersetup_slash_scr_encountersetup_gml_34_0");
    if (global.chapter == 3)
    {
        global.rank1time = 30;
        global.rank1turns = 4;
        global.rank1tp = 200;
        global.rank1hurtcount = 0;
    }
    var board4battleintrostring = "";
    var rr = choose(0, 1, 2, 3);
    if (rr == 0)
        board4battleintrostring = stringsetloc("* Wanna be an ACT-er...? Here's my CARD!", "scr_encountersetup_slash_scr_encountersetup_gml_52_0");
    if (rr == 1)
        board4battleintrostring = stringsetloc("* Now where the heck is my debit card?", "scr_encountersetup_slash_scr_encountersetup_gml_53_0");
    if (rr == 2)
        board4battleintrostring = stringsetloc("* If you're gonna be so dramatic... then ACT!", "scr_encountersetup_slash_scr_encountersetup_gml_54_0");
    if (rr == 3)
        board4battleintrostring = stringsetloc("* I Love TV. That's all you gotta say.", "scr_encountersetup_slash_scr_encountersetup_gml_55_0");
    switch (arg0)
    {
        case 0:
            break;
        case 1:
            global.monsterinstancetype[0] = obj_baseenemy;
            global.monstertype[0] = 1;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_baseenemy;
            global.monstertype[1] = 1;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Test enemies showed up.", "scr_encountersetup_slash_scr_encountersetup_gml_72_0");
            break;
        case 2:
            global.monsterinstancetype[0] = obj_lancerboss;
            global.monstertype[0] = 2;
            global.monstermakex[0] = xx + 540;
            global.monstermakey[0] = yy + 200;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            break;
        case 3:
            global.monsterinstancetype[0] = obj_dummyenemy;
            global.monstertype[0] = 3;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 160;
            if (instance_exists(obj_npc_room))
            {
                global.monstermakex[0] = obj_npc_room.xstart;
                global.monstermakey[0] = obj_npc_room.ystart;
            }
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            break;
        case 4:
            global.monsterinstancetype[0] = obj_diamondenemy;
            global.monstertype[0] = 5;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 140;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rudinn drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_98_0");
            if (global.flag[500] >= 1)
                global.battlemsg[0] = stringsetloc("* A different Rudinn from last time drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_99_0");
            if (global.flag[500] == 2)
                global.battlemsg[0] = stringsetloc("* Assumedly another different Rudinn appeared!", "scr_encountersetup_slash_scr_encountersetup_gml_100_0");
            break;
        case 5:
            global.monsterinstancetype[0] = obj_diamondenemy;
            global.monstertype[0] = 5;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_diamondenemy;
            global.monstertype[1] = 5;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* A necklace of Rudinns blocks your path.", "scr_encountersetup_slash_scr_encountersetup_gml_116_0");
            break;
        case 6:
            global.monsterinstancetype[0] = obj_diamondenemy;
            global.monstertype[0] = 5;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_heartenemy;
            global.monstertype[1] = 6;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rudinn and Hathy blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_132_0");
            break;
        case 7:
            global.monsterinstancetype[0] = obj_smallcheckers_enemy;
            global.monstertype[0] = 9;
            global.monstermakex[0] = xx + 440;
            global.monstermakey[0] = yy + 150;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* C. Round attacked violently!&* (You recall Ralsei's advice to include Susie in an ACT.)", "scr_encountersetup_slash_scr_encountersetup_gml_144_0");
            break;
        case 8:
            global.monsterinstancetype[0] = obj_clubsenemy;
            global.monstertype[0] = 16;
            global.monstermakex[0] = xx + 400;
            global.monstermakey[0] = yy + 120;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Clover grew close!", "scr_encountersetup_slash_scr_encountersetup_gml_155_0");
            break;
        case 9:
            global.monsterinstancetype[0] = obj_heartenemy;
            global.monstertype[0] = 6;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_heartenemy;
            global.monstertype[1] = 6;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_heartenemy;
            global.monstertype[2] = 6;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Three Hathys blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_174_0");
            break;
        case 12:
            global.monsterinstancetype[0] = obj_checkers_enemy;
            global.monstertype[0] = 10;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 120;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Here it comes!", "scr_encountersetup_slash_scr_encountersetup_gml_188_0");
            break;
        case 13:
            global.monsterinstancetype[0] = obj_ponman_enemy;
            global.monstertype[0] = 11;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_ponman_enemy;
            global.monstertype[1] = 11;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.battlemsg[0] = stringsetloc("* Ponman drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_201_0");
            global.monstertype[2] = 0;
            break;
        case 14:
            global.monsterinstancetype[0] = obj_ponman_enemy;
            global.monstertype[0] = 11;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_ponman_enemy;
            global.monstertype[1] = 11;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_ponman_enemy;
            global.monstertype[2] = 11;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Ponman drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_222_0");
            break;
        case 15:
            global.monsterinstancetype[0] = obj_clubsenemy;
            global.monstertype[0] = 7;
            global.monstermakex[0] = xx + 400;
            global.monstermakey[0] = yy + 30;
            global.monsterinstancetype[1] = obj_heartenemy;
            global.monstertype[1] = 6;
            global.monstermakex[1] = xx + 420;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Clover and Hathy grew close!", "scr_encountersetup_slash_scr_encountersetup_gml_239_0");
            break;
        case 16:
            global.monsterinstancetype[0] = obj_rabbick_enemy;
            global.monstertype[0] = 13;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 140;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rabbick slithered in the way!", "scr_encountersetup_slash_scr_encountersetup_gml_250_0");
            break;
        case 17:
            global.monsterinstancetype[0] = obj_rabbick_enemy;
            global.monstertype[0] = 13;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 60;
            global.monsterinstancetype[1] = obj_rabbick_enemy;
            global.monstertype[1] = 13;
            global.monstermakex[1] = xx + 460;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rabbicks slithered in the way!", "scr_encountersetup_slash_scr_encountersetup_gml_266_0");
            break;
        case 18:
            global.monsterinstancetype[0] = obj_bloxer_enemy;
            global.monstertype[0] = 14;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 140;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Bloxer assembled!", "scr_encountersetup_slash_scr_encountersetup_gml_277_0");
            break;
        case 19:
            global.monsterinstancetype[0] = obj_bloxer_enemy;
            global.monstertype[0] = 14;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 60;
            global.monsterinstancetype[1] = obj_bloxer_enemy;
            global.monstertype[1] = 14;
            global.monstermakex[1] = xx + 460;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Bloxers assembled!", "scr_encountersetup_slash_scr_encountersetup_gml_293_0");
            break;
        case 20:
            global.monsterinstancetype[0] = obj_lancerboss2;
            global.monstertype[0] = 12;
            global.heromakex[0] = xx + 120;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 160;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Lancer blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_308_0");
            break;
        case 21:
            global.monsterinstancetype[0] = obj_jigsawryenemy;
            global.monstertype[0] = 15;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 140;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Jigsawry drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_319_0");
            if (global.flag[500] >= 1)
                global.battlemsg[0] = stringsetloc("* A different Jigsawry from last time drew near!", "scr_encountersetup_slash_scr_encountersetup_gml_320_0");
            if (global.flag[500] == 2)
                global.battlemsg[0] = stringsetloc("* Assumedly another different Jigsawry appeared!", "scr_encountersetup_slash_scr_encountersetup_gml_321_0");
            break;
        case 22:
            global.monsterinstancetype[0] = obj_jigsawryenemy;
            global.monstertype[0] = 15;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_jigsawryenemy;
            global.monstertype[1] = 15;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_jigsawryenemy;
            global.monstertype[2] = 15;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* A board of Jigsawrys blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_340_0");
            break;
        case 23:
            global.monsterinstancetype[0] = obj_jigsawryenemy;
            global.monstertype[0] = 15;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_diamondenemy;
            global.monstertype[1] = 5;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_heartenemy;
            global.monstertype[2] = 6;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Smorgasboard.", "scr_encountersetup_slash_scr_encountersetup_gml_359_0");
            break;
        case 24:
            global.monsterinstancetype[0] = obj_rabbick_enemy;
            global.monstertype[0] = 13;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 60;
            global.monsterinstancetype[1] = obj_diamondenemy;
            global.monstertype[1] = 5;
            global.monstermakex[1] = xx + 460;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rabbick slithered in the way!", "scr_encountersetup_slash_scr_encountersetup_gml_374_0");
            break;
        case 25:
            global.heromakex[0] = xx + 80;
            global.heromakey[0] = yy + 100;
            global.heromakex[1] = xx + 90;
            global.heromakey[1] = yy + 150;
            global.heromakex[2] = xx + 100;
            global.heromakey[2] = yy + 210;
            global.monsterinstancetype[0] = obj_joker;
            global.monstertype[0] = 20;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 160;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* LET THE GAMES BEGIN!", "scr_encountersetup_slash_scr_encountersetup_gml_400_0");
            break;
        case 27:
            global.monsterinstancetype[0] = obj_checkers_enemy;
            global.monstertype[0] = 21;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 120;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Here it comes^1. Again.", "scr_encountersetup_slash_scr_encountersetup_gml_413_0");
            global.heromakey[0] = yy + 65;
            break;
        case 28:
            global.monsterinstancetype[0] = obj_rudinnranger;
            global.monstertype[0] = 22;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_rudinnranger;
            global.monstertype[1] = 22;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Rudinn Rangers came sparkling into view!", "scr_encountersetup_slash_scr_encountersetup_gml_430_0");
            break;
        case 29:
            global.monsterinstancetype[0] = obj_headhathy;
            global.monstertype[0] = 23;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_headhathy;
            global.monstertype[1] = 23;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Head Hathy blocked the way quietly!", "scr_encountersetup_slash_scr_encountersetup_gml_446_0");
            break;
        case 30:
            global.monsterinstancetype[0] = obj_headhathy;
            global.monstertype[0] = 23;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_headhathy;
            global.monstertype[1] = 23;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_headhathy;
            global.monstertype[2] = 23;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Head Hathy blocked the way quietly! (x3)", "scr_encountersetup_slash_scr_encountersetup_gml_465_0");
            break;
        case 31:
            global.monsterinstancetype[0] = obj_susieenemy;
            global.monstertype[0] = 19;
            global.monstermakex[0] = xx + 520;
            global.monstermakey[0] = yy + 80;
            global.monsterinstancetype[1] = obj_lancerboss3;
            global.monstertype[1] = 18;
            global.monstermakex[1] = xx + 540;
            global.monstermakey[1] = yy + 240;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Two bad guys blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_479_0");
            break;
        case 32:
            global.monsterinstancetype[0] = obj_rabbick_enemy;
            global.monstertype[0] = 13;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_rabbick_enemy;
            global.monstertype[1] = 13;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_rabbick_enemy;
            global.monstertype[2] = 13;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Rabbicks slithered in the way!", "scr_encountersetup_slash_scr_encountersetup_gml_500_0");
            break;
        case 33:
            global.monsterinstancetype[0] = obj_diamondenemy;
            global.monstertype[0] = 5;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 20;
            global.monsterinstancetype[1] = obj_heartenemy;
            global.monstertype[1] = 6;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_diamondenemy;
            global.monstertype[2] = 5;
            global.monstermakex[2] = xx + 460;
            global.monstermakey[2] = yy + 220;
            global.battlemsg[0] = stringsetloc("* Various guys appeared!", "scr_encountersetup_slash_scr_encountersetup_gml_521_0");
            break;
        case 40:
            global.monsterinstancetype[0] = obj_king_boss;
            global.monstertype[0] = 25;
            global.monstermakex[0] = xx + 460;
            global.monstermakey[0] = yy + 70;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* King blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_533_0");
            break;
        case 71:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_clubsenemy;
            global.monstertype[0] = 47;
            global.monstermakex[0] = xx + 400;
            global.monstermakey[0] = yy + 80;
            global.battlemsg[0] = stringsetloc("* Clover joins the stage!", "scr_encountersetup_slash_scr_encountersetup_gml_892_0");
            break;
        case 72:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_dojograzeenemy;
            global.monstertype[0] = 42;
            global.monstermakex[0] = xx + 440;
            global.monstermakey[0] = yy + 100;
            global.battlemsg[0] = stringsetloc("* It's a grazing adventure.", "scr_encountersetup_slash_scr_encountersetup_gml_901_0");
            break;
        case 89:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_tasque_manager_enemy;
            global.monstertype[0] = 42;
            global.monstermakex[0] = xx + 487;
            global.monstermakey[0] = yy + 94;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Graze!", "scr_encountersetup_slash_scr_encountersetup_gml_1247_0");
            break;
        case 90:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_werewire_enemy;
            global.monstertype[0] = 33;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_werewire_enemy;
            global.monstertype[1] = 33;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Round One!", "scr_encountersetup_slash_scr_encountersetup_gml_1263_0");
            break;
        case 91:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_poppup_enemy;
            global.monstertype[0] = 31;
            global.monstermakex[0] = xx + 412;
            global.monstermakey[0] = yy + 40;
            global.monsterinstancetype[1] = obj_omawaroid_enemy;
            global.monstertype[1] = 30;
            global.monstermakex[1] = xx + 466;
            global.monstermakey[1] = yy + 106;
            global.monsterinstancetype[2] = obj_virovirokun_enemy;
            global.monstertype[2] = 35;
            global.monstermakex[2] = xx + 412;
            global.monstermakey[2] = yy + 184;
            global.battlemsg[0] = stringsetloc("* Round Two!", "scr_encountersetup_slash_scr_encountersetup_gml_1282_0");
            break;
        case 92:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_tasque_enemy;
            global.monstertype[0] = 32;
            global.monstermakex[0] = xx + 432;
            global.monstermakey[0] = yy + 52;
            global.monsterinstancetype[1] = obj_tasque_enemy;
            global.monstertype[1] = 32;
            global.monstermakex[1] = xx + 476;
            global.monstermakey[1] = yy + 140;
            global.monsterinstancetype[2] = obj_maus_enemy;
            global.monstertype[2] = 34;
            global.monstermakex[2] = xx + 512;
            global.monstermakey[2] = yy + 236;
            global.battlemsg[0] = stringsetloc("* Round Three!", "scr_encountersetup_slash_scr_encountersetup_gml_1301_0");
            break;
        case 93:
            global.flag[426] = choose(0, 1, 2, 3);
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_swatchling_enemy;
            global.monstertype[0] = 36;
            global.monstermakex[0] = xx + 394;
            global.monstermakey[0] = yy + 8;
            global.monsterinstancetype[1] = obj_swatchling_enemy;
            global.monstertype[1] = 36;
            global.monstermakex[1] = xx + 490;
            global.monstermakey[1] = yy + 74;
            global.monsterinstancetype[2] = obj_swatchling_enemy;
            global.monstertype[2] = 36;
            global.monstermakex[2] = xx + 394;
            global.monstermakey[2] = yy + 160;
            global.battlemsg[0] = stringsetloc("* Round Four!", "scr_encountersetup_slash_scr_encountersetup_gml_1323_0");
            break;
        case 94:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_werewerewire_enemy;
            global.monstertype[0] = 40;
            global.monstermakex[0] = xx + 464;
            global.monstermakey[0] = yy + 68;
            global.monsterinstancetype[1] = obj_werewerewire_enemy;
            global.monstertype[1] = 40;
            global.monstermakex[1] = xx + 494;
            global.monstermakey[1] = yy + 184;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Final Round!", "scr_encountersetup_slash_scr_encountersetup_gml_1339_0");
            break;
        case 100:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_dojo_spareenemy;
            global.monstertype[0] = 52;
            global.monstermakex[0] = xx + 440;
            global.monstermakey[0] = yy + 100;
            global.battlemsg[0] = stringsetloc("* Jigsaw Joe jigs in!", "scr_encountersetup_slash_scr_encountersetup_gml_1422_0");
            break;
        case 110:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shadowman_enemy;
            global.monstertype[0] = 54;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shadowman_enemy;
            global.monstertype[1] = 54;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.rank1time = 30;
            global.rank1turns = 3;
            global.rank1tp = 175;
            global.battlemsg[0] = stringsetloc("* Shadowguys play on in.", "scr_encountersetup_slash_scr_encountersetup_gml_779_0");
            break;
        case 111:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shutta_enemy;
            global.monstertype[0] = 55;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 110;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.rank1time = 110;
            global.rank1turns = 7;
            global.rank1tp = 200;
            global.rank1hurtcount = 2;
            if (room == room_board_1 || room == room_board_2 || room == room_board_3 || room == room_battletest)
                global.battlemsg[0] = stringsetloc("* I see you've met Shuttah, our camerathing! Now... Action!", "scr_encountersetup_slash_scr_encountersetup_gml_806_0");
            else
                global.battlemsg[0] = stringsetloc("* Shuttah struttah-ed into view!", "scr_encountersetup_slash_scr_encountersetup_gml_810_0");
            break;
        case 112:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 502;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_zapper_enemy;
            global.monstertype[1] = 56;
            global.monstermakex[1] = xx + 464;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.rank1time = 46;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("* Zappers blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_839_0");
            break;
        case 113:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_lanino_enemy;
            global.monstertype[0] = 61;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 46;
            global.monsterinstancetype[1] = obj_elnina_enemy;
            global.monstertype[1] = 60;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.rank1time = 124;
            global.rank1turns = 7;
            global.rank1tp = 200;
            global.rank1hurtcount = 2;
            scr_speaker("tenna");
            global.fc = 22;
            global.battlemsg[0] = stringsetloc("* Let's hear it!! \"I LOVE TV!!!\"!", "scr_encountersetup_slash_scr_encountersetup_gml_869_0");
            break;
        case 114:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_rouxls_ch3_enemy;
            global.monstertype[0] = 102;
            global.monstermakex[0] = xx + 512;
            global.monstermakey[0] = yy + 128;
            global.monsterinstancetype[1] = 0;
            global.monstermakex[1] = xx + 446;
            global.monstermakey[1] = yy + 38;
            global.monsterinstancetype[2] = 0;
            global.monstermakex[2] = xx + 446;
            global.monstermakey[2] = yy + 200;
            global.battlemsg[0] = stringsetloc("* (With the effect of the RULES CARD, you can only ACT!)", "scr_encountersetup_slash_scr_encountersetup_gml_897_0");
            break;
        case 115:
            global.heromakex[0] = xx + 126;
            global.heromakey[0] = yy + 104;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 142;
            global.heromakex[2] = xx + 58;
            global.heromakey[2] = yy + 190;
            global.monsterinstancetype[0] = obj_knight_enemy;
            global.monstertype[0] = 104;
            global.monstermakex[0] = xx + 425;
            global.monstermakey[0] = yy + 78;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* The Roaring Knight appeared.", "scr_encountersetup_slash_scr_encountersetup_gml_917_0");
            break;
        case 116:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 65;
            global.monsterinstancetype[1] = obj_shadowman_enemy;
            global.monstertype[1] = 54;
            global.monstermakex[1] = xx + 484;
            global.monstermakey[1] = yy + 178;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_940_0");
            break;
        case 117:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shadowman_enemy;
            global.monstertype[0] = 54;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shutta_enemy;
            global.monstertype[1] = 55;
            global.monstermakex[1] = xx + 464;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Shadowguy and Shuttah shimmy in!", "scr_encountersetup_slash_scr_encountersetup_gml_963_0");
            break;
        case 118:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 464;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shutta_enemy;
            global.monstertype[1] = 55;
            global.monstermakex[1] = xx + 474;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* It's an infrared photo shoot.", "scr_encountersetup_slash_scr_encountersetup_gml_996_0");
            break;
        case 119:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 446;
            global.monstermakey[0] = yy + 38;
            global.monsterinstancetype[1] = obj_shutta_enemy;
            global.monstertype[1] = 55;
            global.monstermakex[1] = xx + 512;
            global.monstermakey[1] = yy + 128;
            global.monsterinstancetype[2] = obj_shadowman_enemy;
            global.monstertype[2] = 54;
            global.monstermakex[2] = xx + 446;
            global.monstermakey[2] = yy + 200;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1014_0");
            break;
        case 120:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 446;
            global.monstermakey[0] = yy + 38;
            global.monsterinstancetype[1] = obj_shadowman_enemy;
            global.monstertype[1] = 54;
            global.monstermakex[1] = xx + 512;
            global.monstermakey[1] = yy + 128;
            global.monsterinstancetype[2] = obj_shadowman_enemy;
            global.monstertype[2] = 54;
            global.monstermakex[2] = xx + 446;
            global.monstermakey[2] = yy + 200;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1045_0");
            break;
        case 121:
            global.heromakex[0] = xx + 140;
            global.heromakey[0] = yy + 80;
            global.heromakex[1] = xx + 100;
            global.heromakey[1] = yy + 137;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 190;
            global.monsterinstancetype[0] = obj_tenna_enemy;
            global.monstertype[0] = 103;
            global.monstermakex[0] = xx + 420;
            global.monstermakey[0] = yy + 0;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* That's right folks! One last challenge!#1000 points or bust! Can you do it!?", "scr_encountersetup_slash_scr_encountersetup_gml_1065_0");
            break;
        case 122:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_pippins_enemy;
            global.monstertype[0] = 59;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_pippins_enemy;
            global.monstertype[1] = 59;
            global.monstermakex[1] = xx + 464;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Pippins rolls in your way!", "scr_encountersetup_slash_scr_encountersetup_gml_1088_0");
            break;
        case 123:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_pippins_enemy;
            global.monstertype[0] = 59;
            global.monstermakex[0] = xx + 516;
            global.monstermakey[0] = yy + 40;
            global.monsterinstancetype[1] = obj_pippins_enemy;
            global.monstertype[1] = 59;
            global.monstermakex[1] = xx + 460;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_pippins_enemy;
            global.monstertype[2] = 59;
            global.monstermakex[2] = xx + 510;
            global.monstermakey[2] = yy + 202;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            scr_speaker("ralsei");
            global.fc = 2;
            global.battlemsg[0] = stringsetloc("\\EWSusie, you can't use Kris's controller!", "scr_encountersetup_slash_scr_encountersetup_gml_1120_0");
            break;
        case 124:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shutta_enemy;
            global.monstertype[0] = 55;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shutta_enemy;
            global.monstertype[1] = 55;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Shuttah struttah-ed into view!", "scr_encountersetup_slash_scr_encountersetup_gml_1143_0");
            break;
        case 125:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 126;
            global.monsterinstancetype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Ribbick hopped into view!", "scr_encountersetup_slash_scr_encountersetup_gml_1173_0");
            break;
        case 126:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_ribbick_enemy;
            global.monstertype[1] = 57;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Ribbicks hopped into view!", "scr_encountersetup_slash_scr_encountersetup_gml_1196_0");
            break;
        case 127:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shadowman_enemy;
            global.monstertype[1] = 54;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1209_0");
            break;
        case 128:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_shutta_enemy;
            global.monstertype[1] = 55;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1232_0");
            break;
        case 129:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_zapper_enemy;
            global.monstertype[1] = 56;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1256_0");
            break;
        case 130:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_pippins_enemy;
            global.monstertype[1] = 59;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1279_0");
            break;
        case 131:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 516;
            global.monstermakey[0] = yy + 40;
            global.monsterinstancetype[1] = obj_ribbick_enemy;
            global.monstertype[1] = 57;
            global.monstermakex[1] = xx + 460;
            global.monstermakey[1] = yy + 120;
            global.monsterinstancetype[2] = obj_ribbick_enemy;
            global.monstertype[2] = 57;
            global.monstermakex[2] = xx + 510;
            global.monstermakey[2] = yy + 202;
            global.battlemsg[0] = stringsetloc("* Ribbicks hopped into view!", "scr_encountersetup_slash_scr_encountersetup_gml_1315_0");
            break;
        case 132:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shadowman_enemy;
            global.monstertype[0] = 54;
            global.monstermakex[0] = xx + 446;
            global.monstermakey[0] = yy + 38;
            global.monsterinstancetype[1] = obj_shadowman_enemy;
            global.monstertype[1] = 54;
            global.monstermakex[1] = xx + 512;
            global.monstermakey[1] = yy + 128;
            global.monsterinstancetype[2] = obj_shadowman_enemy;
            global.monstertype[2] = 54;
            global.monstermakex[2] = xx + 446;
            global.monstermakey[2] = yy + 200;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1335_0");
            break;
        case 133:
            global.heromakex[0] = xx + 140;
            global.heromakey[0] = yy + 80;
            global.heromakex[1] = xx + 100;
            global.heromakey[1] = yy + 137;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 190;
            global.monsterinstancetype[0] = obj_tenna_board4_enemy;
            global.monstertype[0] = 105;
            global.monstermakex[0] = xx + 420;
            global.monstermakey[0] = yy + 0;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = board4battleintrostring;
            break;
        case 134:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shadowman_enemy;
            global.monstertype[0] = 54;
            global.monstermakex[0] = (xx + 476) - 80;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_tenna_board4_enemy;
            global.monstertype[1] = 105;
            global.monstermakex[1] = xx + 454 + 80;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.rank1time = 30;
            global.rank1turns = 3;
            global.rank1tp = 175;
            global.battlemsg[0] = board4battleintrostring;
            break;
        case 135:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = (xx + 476) - 70 - 16;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_tenna_board4_enemy;
            global.monstertype[1] = 105;
            global.monstermakex[1] = (xx + 454) - 16;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.rank1time = 30;
            global.rank1turns = 3;
            global.battlemsg[0] = board4battleintrostring;
            break;
        case 136:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_shadowman_enemy;
            global.monstertype[0] = 54;
            global.monstermakex[0] = xx + 456;
            global.monstermakey[0] = yy + 108;
            global.monsterinstancetype[1] = obj_pippins_enemy;
            global.monstertype[1] = 59;
            global.monstermakex[1] = xx + 526;
            global.monstermakey[1] = yy + 54;
            global.monsterinstancetype[2] = obj_pippins_enemy;
            global.monstertype[2] = 59;
            global.monstermakex[2] = xx + 516;
            global.monstermakey[2] = yy + 208;
            global.battlemsg[0] = stringsetloc("* Shadowguy and Pippins dropped in!", "scr_encountersetup_slash_scr_encountersetup_gml_1435_0");
            break;
        case 137:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 446 + 20;
            global.monstermakey[0] = yy + 38 + 20;
            global.monsterinstancetype[1] = obj_pippins_enemy;
            global.monstertype[1] = 59;
            global.monstermakex[1] = xx + 464 + 30;
            global.monstermakey[1] = yy + 168 + 30;
            global.monstertype[2] = 0;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("", "scr_encountersetup_slash_scr_encountersetup_gml_1464_0");
            break;
        case 138:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("* Zapper blocked the way!", "scr_encountersetup_slash_scr_encountersetup_gml_1495_0");
            break;
        case 139:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_watercooler_enemy;
            global.monstertype[0] = 58;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("* A strong aura emanates from the Watercooler.", "scr_encountersetup_slash_scr_encountersetup_gml_1523_0");
            break;
        case 140:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_watercooler_enemy;
            global.monstertype[0] = 58;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.rank1time = 47;
            global.rank1turns = 4;
            global.rank1tp = 200;
            global.battlemsg[0] = stringsetloc("* A strong aura emanates from the Moonwarmer.", "scr_encountersetup_slash_scr_encountersetup_gml_1548_0");
            break;
        case 141:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_lanino_rematch_enemy;
            global.monstertype[0] = 107;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 46;
            global.monsterinstancetype[1] = obj_elnina_rematch_enemy;
            global.monstertype[1] = 106;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.rank1time = 124;
            global.rank1turns = 7;
            global.rank1tp = 200;
            global.rank1hurtcount = 2;
            global.battlemsg[0] = stringsetloc("* Its a rematch.", "scr_encountersetup_slash_scr_encountersetup_gml_1578_0");
            break;
        case 777:
            global.monsterinstancetype[0] = obj_bullettester_enemy;
            global.monsterinstancetype[1] = obj_bullettester_enemy;
            global.monsterinstancetype[2] = obj_bullettester_enemy;
            global.monstertype[0] = 1;
            global.monstertype[1] = 1;
            global.monstertype[2] = 1;
            global.battlemsg[0] = stringset(" ");
            break;
        default:
            global.monsterinstancetype[0] = obj_baseenemy;
            global.monstertype[0] = 1;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_baseenemy;
            global.monstertype[1] = 1;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            break;
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
