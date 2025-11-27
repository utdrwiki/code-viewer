function scr_encountersetup(arg0)
{
    xx = camerax();
    yy = cameray();
    var partyconfig = 0;
    if (global.char[0] != 0 && global.char[1] == 0 && global.char[2] == 0)
        partyconfig = 1;
    if (global.char[0] != 0 && global.char[1] != 0 && global.char[2] == 0)
        partyconfig = 2;
    for (var i = 0; i < 3; i++)
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
            global.battlemsg[0] = stringsetloc("* Test enemies showed up.", "scr_encountersetup_slash_scr_encountersetup_gml_60_0");
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
        case 150:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_guei_enemy;
            global.monstertype[0] = 62;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_guei_enemy;
            global.monstertype[1] = 62;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Guei wisps in your way!", "scr_encountersetup_slash_scr_encountersetup_gml_841_0");
            break;
        case 151:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_balthizard_enemy;
            global.monstertype[0] = 63;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_balthizard_enemy;
            global.monstertype[1] = 63;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Balthizard swings in!", "scr_encountersetup_slash_scr_encountersetup_gml_864_0");
            break;
        case 152:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_bibliox_enemy;
            global.monstertype[0] = 64;
            global.monstermakex[0] = xx + 460;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_bibliox_enemy;
            global.monstertype[1] = 64;
            global.monstermakex[1] = xx + 480;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Bibliox opens up!", "scr_encountersetup_slash_scr_encountersetup_gml_887_0");
            break;
        case 153:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_mizzle_enemy;
            global.monstertype[1] = 65;
            global.monstermakex[1] = xx + 474;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Mizzle was woken up!", "scr_encountersetup_slash_scr_encountersetup_gml_910_0");
            break;
        case 154:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 475;
            global.monstermakey[0] = yy + 56;
            global.monsterinstancetype[1] = obj_bell_enemy;
            global.monstertype[1] = 66;
            global.monstermakex[1] = xx + 488;
            global.monstermakey[1] = yy + 188;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Wicabel clangs in your way!", "scr_encountersetup_slash_scr_encountersetup_gml_948_0");
            break;
        case 155:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_halo_enemy;
            global.monstertype[0] = 67;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_halo_enemy;
            global.monstertype[1] = 67;
            global.monstermakex[1] = xx + 520;
            global.monstermakey[1] = yy + 230;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Winglade cuts in!", "scr_encountersetup_slash_scr_encountersetup_gml_971_0");
            break;
        case 156:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_organ_enemy;
            global.monstertype[0] = 68;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 47;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 476;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Organikk accosts you!", "scr_encountersetup_slash_scr_encountersetup_gml_995_0");
            break;
        case 157:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 476;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* It's a cacophony.", "scr_encountersetup_slash_scr_encountersetup_gml_1035_0");
            break;
        case 158:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_guei_enemy;
            global.monstertype[0] = 62;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_balthizard_enemy;
            global.monstertype[1] = 63;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 198;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Smells like scented candles.", "scr_encountersetup_slash_scr_encountersetup_gml_1058_0");
            break;
        case 159:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_bibliox_enemy;
            global.monstertype[1] = 64;
            global.monstermakex[1] = xx + 480;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 160:
            global.monsterinstancetype[0] = obj_hammer_of_justice_enemy;
            global.monstertype[0] = 105;
            global.monstermakex[0] = xx + 418 + 42;
            global.monstermakey[0] = yy + 69 + 92;
            global.heromakex[0] = 108;
            global.heromakey[0] = 149;
            global.heromakex[1] = 108;
            global.heromakey[1] = 149;
            if (room == room_dw_church_arena)
            {
                global.heromakex[0] = 629;
                global.heromakey[0] = 149;
            }
            global.battlemsg[0] = stringsetloc("* (The bell of justice rings...)&(ATTACK to show what you've got!)", "scr_encountersetup_slash_scr_encountersetup_gml_1120_0");
            break;
        case 161:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_bibliox_enemy;
            global.monstertype[0] = 64;
            global.monstermakex[0] = xx + 459;
            global.monstermakey[0] = yy + 56;
            global.monsterinstancetype[1] = obj_halo_enemy;
            global.monstertype[1] = 67;
            global.monstermakex[1] = xx + 520;
            global.monstermakey[1] = yy + 227;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* The flapping of wings and pages fills the room.", "scr_encountersetup_slash_scr_encountersetup_gml_1143_0_b");
            break;
        case 162:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_halo_enemy;
            global.monstertype[0] = 67;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_balthizard_enemy;
            global.monstertype[1] = 63;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 163:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_guei_enemy;
            global.monstertype[0] = 62;
            global.monstermakex[0] = xx + 470;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 485;
            global.monstermakey[1] = yy + 170;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 164:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_guei_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 470;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_bibliox_enemy;
            global.monstertype[1] = 64;
            global.monstermakex[1] = xx + 280;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 165:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_guei_enemy;
            global.monstertype[1] = 62;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 166:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_balthizard_enemy;
            global.monstertype[1] = 63;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 167:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 520;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 168:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_balthizard_enemy;
            global.monstertype[0] = 63;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 190;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 169:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 190;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 170:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_bibliox_enemy;
            global.monstertype[0] = 64;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_bell_enemy;
            global.monstertype[1] = 66;
            global.monstermakex[1] = xx + 480;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 171:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = yy + 70;
            global.monsterinstancetype[1] = obj_mizzle_enemy;
            global.monstertype[1] = 65;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 190;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 172:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 486;
            global.monstermakey[0] = yy + 60;
            global.monsterinstancetype[1] = obj_halo_enemy;
            global.monstertype[1] = 67;
            global.monstermakex[1] = xx + 524;
            global.monstermakey[1] = yy + 229;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 173:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_halo_enemy;
            global.monstertype[0] = 67;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_guei_enemy;
            global.monstertype[1] = 62;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringset("");
            break;
        case 174:
            global.monsterinstancetype[0] = obj_jackenstein_enemy;
            global.monstertype[0] = 107;
            global.monstermakex[0] = xx + 442;
            global.monstermakey[0] = yy + 60;
            global.battlemsg[0] = stringsetloc("* Darkness constricts you...&* \\cYTP\\c0 Gain reduced outside of \\cYTREASURE!\\c0", "scr_encountersetup_slash_scr_encountersetup_gml_1441_0");
            break;
        case 175:
            global.monsterinstancetype[0] = obj_titan_enemy;
            global.monstertype[0] = 108;
            global.monstermakex[0] = xx + 390;
            global.monstermakey[0] = yy + 120;
            global.battlemsg[0] = stringsetloc("* Darkness constricts you...&* \\cYTP\\c0 Gain reduced outside of \\cG???\\c0", "scr_encountersetup_slash_scr_encountersetup_gml_1450_0");
            for (var i = 0; i < 3; i += 1)
            {
                global.heromakex[i] = (xx + 130) - (32 * i);
                if (i == 0)
                    global.heromakex[i] += 12;
                global.heromakey[i] = yy + 140 + (30 * i);
            }
            break;
        case 176:
            global.monsterinstancetype[0] = obj_sound_of_justice_enemy;
            global.monstertype[0] = 106;
            global.monstermakex[0] = xx + 465;
            global.monstermakey[0] = yy + 115;
            global.heromakex[2] = -100;
            global.heromakey[2] = -100;
            global.heromakex[0] = 108;
            global.heromakey[0] = 149;
            global.battlemsg[0] = stringsetloc("* Darkness constricts you...&* \\cYTP\\c0 Gain reduced!", "scr_encountersetup_slash_scr_encountersetup_gml_1474_0");
            break;
        case 177:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_titan_spawn_enemy;
            global.monstertype[0] = 109;
            global.monstermakex[0] = (xx + 500) - 40;
            global.monstermakey[0] = (yy + 84) - 46;
            global.monsterinstancetype[1] = obj_titan_spawn_enemy;
            global.monstertype[1] = 109;
            global.monstermakex[1] = (xx + 500) - 40;
            global.monstermakey[1] = (yy + 244) - 46;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* Darkness constricts you...&* \\cYTP\\c0 Gain reduced outside of \\cG???\\c0", "scr_encountersetup_slash_scr_encountersetup_gml_1497_0");
            break;
        case 178:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_lanino_rematch_enemy;
            global.monstertype[0] = 111;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 46;
            global.monsterinstancetype[1] = obj_elnina_rematch_enemy;
            global.monstertype[1] = 110;
            global.monstermakex[1] = xx + 510;
            global.monstermakey[1] = yy + 180;
            global.monstertype[2] = 0;
            global.battlemsg[0] = stringsetloc("* This time, the weather sticks together!", "scr_encountersetup_slash_scr_encountersetup_gml_1519_0");
            break;
        case 179:
            global.monsterinstancetype[0] = obj_pippins_enemy;
            global.monstertype[0] = 59;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_rudinnranger;
            global.monstertype[1] = 5;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.battlemsg[0] = stringset("");
            break;
        case 180:
            global.monsterinstancetype[0] = obj_zapper_enemy;
            global.monstertype[0] = 56;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_swatchling_enemy;
            global.monstertype[1] = 36;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.battlemsg[0] = stringset("");
            break;
        case 181:
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_ribbick_enemy;
            global.monstertype[1] = 57;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.battlemsg[0] = stringset("");
            break;
        case 182:
            global.monsterinstancetype[0] = obj_ribbick_enemy;
            global.monstertype[0] = 57;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_ribbick_enemy;
            global.monstertype[1] = 57;
            global.monstermakex[1] = xx + 454;
            global.monstermakey[1] = yy + 168;
            global.battlemsg[0] = stringset("");
            break;
        case 183:
            global.monsterinstancetype[0] = obj_holywatercooler_enemy;
            global.monstertype[0] = 69;
            global.monstermakex[0] = xx + 484;
            global.monstermakey[0] = yy + 138;
            global.battlemsg[0] = stringsetloc("* This is not your typical watercooler!", "scr_encountersetup_slash_scr_encountersetup_gml_1597_0");
            break;
        case 184:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 50;
            global.monsterinstancetype[1] = obj_mizzle_enemy;
            global.monstertype[1] = 65;
            global.monstermakex[1] = xx + 474;
            global.monstermakey[1] = yy + 130;
            global.monsterinstancetype[2] = obj_mizzle_enemy;
            global.monstertype[2] = 65;
            global.monstermakex[2] = xx + 494;
            global.monstermakey[2] = yy + 210;
            global.battlemsg[0] = stringset("");
            break;
        case 185:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_mizzle_enemy;
            global.monstertype[0] = 65;
            global.monstermakex[0] = xx + 496;
            global.monstermakey[0] = yy + 70;
            global.battlemsg[0] = stringset("");
            break;
        case 186:
            global.monsterinstancetype[0] = obj_sound_of_justice_enemy;
            global.monstertype[0] = 106;
            global.monstermakex[0] = xx + 465;
            global.monstermakey[0] = yy + 115;
            if (room == room_dw_churchb_nongerson)
            {
                global.heromakex[0] = camerax() + 86;
                global.heromakey[0] = cameray() + 52;
            }
            global.heromakey[1] += 20;
            global.heromakex[2] = -100;
            global.heromakey[2] = -100;
            yy = __view_get(e__VW.YView, 0);
            global.battlemsg[0] = stringsetloc("* Darkness constricts you...&* \\cYTP\\c0 Gain reduced!", "scr_encountersetup_slash_scr_encountersetup_gml_1663_0");
            break;
        case 187:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_organ_enemy;
            global.monstertype[0] = 68;
            global.monstermakex[0] = xx + 470;
            global.monstermakey[0] = yy + 22;
            global.monsterinstancetype[1] = obj_bell_enemy;
            global.monstertype[1] = 66;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 176;
            global.monstertype[2] = 0;
            break;
        case 188:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_organ_enemy;
            global.monstertype[0] = 68;
            global.monstermakex[0] = xx + 470;
            global.monstermakey[0] = yy + 5;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 106;
            global.monsterinstancetype[2] = obj_bell_enemy;
            global.monstertype[2] = 66;
            global.monstermakex[2] = xx + 470;
            global.monstermakey[2] = yy + 210;
            global.battlemsg[0] = stringsetloc("* It's a cacophony!", "scr_encountersetup_slash_scr_encountersetup_gml_1745_0");
            break;
        case 189:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_balthizard_enemy;
            global.monstertype[0] = 63;
            global.monstermakex[0] = xx + 476;
            global.monstermakey[0] = (yy + 70) - 20 - 4;
            global.monsterinstancetype[1] = obj_mizzle_enemy;
            global.monstertype[1] = 65;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 106 + 8 + 10;
            global.monsterinstancetype[2] = obj_guei_enemy;
            global.monstertype[2] = 62;
            global.monstermakex[2] = xx + 470;
            global.monstermakey[2] = ((yy + 210) - 20) + 6;
            global.battlemsg[0] = stringsetloc("* Water, fire, air.", "scr_encountersetup_slash_scr_encountersetup_gml_1787_0");
            break;
        case 190:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.heromakex[0] = xx + krloc[0];
            global.heromakey[0] = yy + krloc[1];
            global.heromakex[1] = xx + suloc[0];
            global.heromakey[1] = yy + suloc[1];
            global.heromakex[2] = xx + raloc[0];
            global.heromakey[2] = yy + raloc[1];
            global.monsterinstancetype[0] = obj_bell_enemy;
            global.monstertype[0] = 66;
            global.monstermakex[0] = xx + 476 + 24;
            global.monstermakey[0] = yy + 46 + 62;
            global.battlemsg[0] = stringsetloc("* Wicabel clangs in your way!", "scr_encountersetup_slash_scr_encountersetup_gml_1819_0");
            break;
        case 191:
            var krloc = [94, 50];
            var suloc = [80, 122];
            var raloc = [72, 200];
            if (partyconfig == 1)
                krloc = [80, 122];
            if (partyconfig == 2)
            {
                krloc = [94, 86];
                suloc = [80, 166];
            }
            global.monsterinstancetype[0] = obj_halo_enemy;
            global.monstertype[0] = 67;
            global.monstermakex[0] = xx + 500;
            global.monstermakey[0] = yy + 84;
            global.monsterinstancetype[1] = obj_organ_enemy;
            global.monstertype[1] = 68;
            global.monstermakex[1] = xx + 470;
            global.monstermakey[1] = yy + 160;
            global.battlemsg[0] = stringsetloc("* Steel clangs in a song.", "scr_encountersetup_slash_scr_encountersetup_gml_1848_0");
            break;
        case 500:
            global.monsterinstancetype[0] = obj_multiboss_enemy1;
            global.monstertype[0] = 500;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 80;
            global.monsterinstancetype[1] = obj_multiboss_enemy2;
            global.monstertype[1] = 500;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 160;
            global.monsterinstancetype[2] = obj_multiboss_enemy3;
            global.monstertype[2] = 500;
            global.monstermakex[2] = xx + 520;
            global.monstermakey[2] = yy + 240;
            global.battlemsg[0] = stringsetloc("* A multiboss example showed up.", "scr_encountersetup_slash_scr_encountersetup_gml_60_0");
            break;
        case 501:
            global.monsterinstancetype[0] = obj_multiboss_controller_enemy1;
            global.monstertype[0] = 501;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 80;
            global.monsterinstancetype[1] = obj_multiboss_controller_enemy2;
            global.monstertype[1] = 501;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 160;
            global.monsterinstancetype[2] = obj_multiboss_controller_enemy3;
            global.monstertype[2] = 501;
            global.monstermakex[2] = xx + 520;
            global.monstermakey[2] = yy + 240;
            global.battlemsg[0] = stringsetloc("* A multiboss example with controller showed up.", "scr_encountersetup_slash_scr_encountersetup_gml_60_0");
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
