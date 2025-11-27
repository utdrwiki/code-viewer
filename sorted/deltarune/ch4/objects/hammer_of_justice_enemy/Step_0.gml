if (global.inv > 19)
    global.inv = 19;
if (rudebusterdelay > 0)
    rudebusterdelay--;
global.mercymod[myself] = 0;
with (obj_battlecontroller)
    hidestar = 1;
if (i_ex(obj_heart))
{
    global.sp = 5;
    obj_heart.wspeed = 5;
}
for (i = 0; i < 3; i += 1)
    global.automiss[i] = 1;
if (init == 0)
{
    init = 1;
    global.canactsus[myself][0] = 0;
    global.actnamesus[myself][0] = "";
    global.actsimulsus[myself][0] = 0;
    global.actactorsus[myself][0] = 0;
    global.actcostsus[myself][0] = 0;
    global.battlespell[1][0] = 0;
    global.battlespell[1][0] = -1;
    global.battleactcount[1] = 0;
    global.battlespellname[1][0] = "";
    global.battlespelldesc[1][0] = "";
    scr_spellmenu_setup();
}
if (global.monster[myself] == 1)
{
    if (susiehitbyrudebustercon == 1 && endcon == 0)
    {
        susiehitbyrudebustercon = 1.1;
        with (obj_writer)
            instance_destroy();
        global.typer = 75;
        msgset(0, dialogue_string64);
        scr_heroblcon("susie");
        talktimer = 0;
    }
    else if (susiehitbyrudebustercon == 1.1)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            susiehitbyrudebustercon = 1.2;
            with (obj_writer)
                instance_destroy();
            global.typer = 86;
            msgset(0, dialogue_string65);
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
            talktimer = 0;
        }
    }
    else if (susiehitbyrudebustercon == 1.2)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            susiehitbyrudebustercon = 2;
            with (obj_writer)
                instance_destroy();
            global.typer = 75;
            msgset(0, dialogue_string66);
            scr_heroblcon("susie");
            talktimer = 0;
        }
    }
    if (susiehitbyrudebustercon == 2)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            susiehitbyrudebustercon = 0;
            talktimer = 0;
        }
    }
    if (scr_isphase("enemytalk") && endcon == 0 && talked == 0 && susiehitbyrudebustercon == 0 && rudebusterdelay == 0 && !i_ex(obj_gerson_item_steal_anim) && !i_ex(obj_rudebuster_bolt) && !i_ex(obj_gerson_rudebuster))
    {
        scr_randomtarget();
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        sprite_set_offset(spr_spearblocker, 32, 32);
        global.sp = 4;
        ballooncon = 0;
        balloonsubcon = 0;
        balloonend = 1;
        talkedcon = 0;
        rtimer = 0;
        postenemyturnevent = 0;
        swingdown_multitelegraph = 0;
        if (gothitlastturn > 0)
            beenhit = true;
        squishbox = false;
        global.typer = 86;
        rr = choose(0, 1, 2);
        attackcon = 0;
        if (progress >= 84)
        {
            phase = 4;
            trueturn = 20;
        }
        var noballoon = false;
        var drawabove = false;
        if (trueturn >= 20)
        {
            msgset(0, dialogue_string53);
            ballooncon = 45;
            balloonend = 0;
        }
        else if (turn == 0 && global.justice_attempts == 0)
        {
            msgset(0, dialogue_string1);
            ballooncon = 1;
            balloonend = 0;
            susietalks = 1;
        }
        else if (turn == 0 && (global.justice_attempts > 0 || firstconversationhappened == true))
        {
            ballooncon = 1;
            balloonend = 1;
            noballoon = true;
        }
        else if (turn == 1 && gothitlastturn > 0 && repeatonce == 0)
        {
            msgset(0, dialogue_string9);
            ballooncon = 2.8;
            balloonend = 0;
            turn = 0;
            trueturn = 0;
            attackpattern = 0;
            repeatonce = 1;
        }
        else if ((turn == 1 && gothitlastturn == 0) || (turn == 1 && repeatonce == 1))
        {
            msgset(0, dialogue_string12);
            ballooncon = 2.9;
            balloonend = 0;
        }
        else if (turn == 2)
        {
            msgset(0, dialogue_string13);
            ballooncon = 10;
            balloonend = 0;
        }
        else if (turn == 3)
        {
            msgset(0, dialogue_string15);
            ballooncon = 11;
            balloonend = 0;
        }
        else if (turn == 4)
        {
            msgset(0, dialogue_string18);
            ballooncon = 11.5;
            balloonend = 0;
        }
        else if (turn == 5)
        {
            msgset(0, dialogue_string19);
            ballooncon = 23;
            balloonend = 0;
        }
        else if (turn == 6)
        {
            msgset(0, dialogue_string21);
            ballooncon = 24;
            balloonend = 0;
        }
        else if (turn == 7)
        {
            msgset(0, dialogue_string23);
            ballooncon = 25;
            balloonend = 0;
        }
        else if (turn == 8)
        {
            msgset(0, dialogue_string25);
            ballooncon = 26;
            balloonend = 0;
        }
        else if (turn == 9)
        {
            msgset(0, dialogue_string29);
            ballooncon = 29;
            balloonend = 0;
        }
        else if (turn == 10)
        {
            msgset(0, dialogue_string35);
            ballooncon = 33;
            balloonend = 0;
        }
        else if (turn == 11)
        {
            msgset(0, dialogue_string38);
            ballooncon = 35;
            balloonend = 0;
        }
        else if (turn == 12)
        {
            msgset(0, dialogue_string40);
            ballooncon = 36;
            balloonend = 0;
        }
        else if (turn == 13)
        {
            msgset(0, dialogue_string43);
            ballooncon = 38;
            balloonend = 0;
            susietalks = 1;
        }
        else if (turn == 14)
        {
            msgset(0, dialogue_string47);
            ballooncon = 41;
            balloonend = 0;
        }
        else if (turn == 15)
        {
            msgset(0, dialogue_string50);
            ballooncon = 43;
            balloonend = 0;
        }
        else if (turn == 16)
        {
            msgset(0, dialogue_string70);
            ballooncon = 0;
            balloonend = 1;
        }
        else if (turn == 17)
        {
            msgset(0, dialogue_string71);
            ballooncon = 52;
            balloonend = 0;
        }
        else if (turn == 18)
        {
            msgset(0, dialogue_string73);
            ballooncon = 53;
            balloonend = 0;
        }
        else
        {
            if (rr == 0)
                msgset(0, dialogue_string76);
            if (rr == 1)
                msgset(0, dialogue_string77);
            if (rr == 2)
                msgset(0, dialogue_string78);
            ballooncon = 0;
            balloonend = 1;
        }
        if (noballoon == true)
        {
            talked = 1;
            talktimer = 0;
        }
        else
        {
            if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_heroblcon("susie");
            }
            else
            {
                scr_enemyblcon(x - 10, global.monstery[myself], 10);
            }
            susietalks = 0;
            gothitlastturn = 0;
            event_user(0);
            if (ballooncon == 0)
            {
                talked = 1;
                talktimer = 0;
            }
            else
            {
                talked = 0.6;
                talktimer = 0;
            }
        }
    }
    if (talked == 0.6)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 1)
            {
                msgset(0, dialogue_string2);
                ballooncon = 2;
                balloonend = 0;
                susietalks = 1;
            }
            else if (ballooncon == 2)
            {
                msgset(0, dialogue_string3);
                ballooncon = 2.5;
                balloonend = 0;
            }
            else if (ballooncon == 2.5)
            {
                msgset(0, dialogue_string3b);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2.8)
            {
                msgset(0, dialogue_string9b);
                ballooncon = 0;
                balloonend = 1;
                susietalks = 1;
            }
            else if (ballooncon == 2.9)
            {
                msgset(0, dialogue_string12b);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 10)
            {
                msgset(0, dialogue_string14);
                ballooncon = 10.1;
                balloonend = 0;
            }
            else if (ballooncon == 10.1)
            {
                msgset(0, dialogue_string14b);
                ballooncon = 10.2;
                balloonend = 0;
            }
            else if (ballooncon == 10.2)
            {
                msgset(0, dialogue_string14c);
                ballooncon = 0;
                balloonend = 1;
                susietalks = 1;
            }
            else if (ballooncon == 11)
            {
                msgset(0, dialogue_string16);
                ballooncon = 12;
                balloonend = 1;
            }
            else if (ballooncon == 11.5)
            {
                msgset(0, dialogue_string18b);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 23)
            {
                msgset(0, dialogue_string20);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 24)
            {
                msgset(0, dialogue_string22);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 25)
            {
                msgset(0, dialogue_string24);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 26)
            {
                msgset(0, dialogue_string26);
                ballooncon = 27;
                balloonend = 0;
            }
            else if (ballooncon == 27)
            {
                msgset(0, dialogue_string27);
                ballooncon = 28;
                balloonend = 0;
            }
            else if (ballooncon == 28)
            {
                msgset(0, dialogue_string28);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 29)
            {
                msgset(0, dialogue_string30);
                ballooncon = 30;
                balloonend = 0;
            }
            else if (ballooncon == 30)
            {
                msgset(0, dialogue_string31);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 31)
            {
                msgset(0, dialogue_string33);
                ballooncon = 32;
                balloonend = 0;
            }
            else if (ballooncon == 32)
            {
                msgset(0, dialogue_string34);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 33)
            {
                msgset(0, dialogue_string36);
                ballooncon = 34;
                balloonend = 0;
            }
            else if (ballooncon == 34)
            {
                msgset(0, dialogue_string37);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 35)
            {
                msgset(0, dialogue_string39);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 36)
            {
                msgset(0, dialogue_string41);
                ballooncon = 37;
                balloonend = 0;
            }
            else if (ballooncon == 37)
            {
                msgset(0, dialogue_string42);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 38)
            {
                msgset(0, dialogue_string44);
                ballooncon = 39;
                balloonend = 0;
                susietalks = 1;
            }
            else if (ballooncon == 39)
            {
                msgset(0, dialogue_string45);
                ballooncon = 40;
                balloonend = 0;
                susietalks = 1;
            }
            else if (ballooncon == 40)
            {
                msgset(0, dialogue_string46);
                ballooncon = 0;
                balloonend = 1;
                susietalks = 1;
            }
            else if (ballooncon == 41)
            {
                msgset(0, dialogue_string48);
                ballooncon = 42;
                balloonend = 0;
            }
            else if (ballooncon == 42)
            {
                msgset(0, dialogue_string49);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 43)
            {
                msgset(0, dialogue_string51);
                ballooncon = 44;
                balloonend = 0;
            }
            else if (ballooncon == 44)
            {
                msgset(0, dialogue_string52);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 45)
            {
                msgset(0, dialogue_string54);
                ballooncon = 46;
                balloonend = 0;
            }
            else if (ballooncon == 46)
            {
                msgset(0, dialogue_string55);
                ballooncon = 47;
                balloonend = 0;
            }
            else if (ballooncon == 47)
            {
                msgset(0, dialogue_string56);
                ballooncon = 48;
                balloonend = 0;
                susietalks = 1;
            }
            else if (ballooncon == 48)
            {
                msgset(0, dialogue_string57);
                ballooncon = 49;
                balloonend = 0;
                susietalks = 1;
            }
            else if (ballooncon == 49)
            {
                msgset(0, dialogue_string58);
                ballooncon = 50;
                balloonend = 0;
            }
            else if (ballooncon == 50)
            {
                msgset(0, dialogue_string59);
                ballooncon = 0;
                balloonend = 1;
                susietalks = 1;
            }
            else if (ballooncon == 51)
            {
                msgset(0, dialogue_string68);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 52)
            {
                msgset(0, dialogue_string72);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 53)
            {
                msgset(0, dialogue_string74);
                ballooncon = 54;
                balloonend = 0;
            }
            else if (ballooncon == 54)
            {
                msgset(0, dialogue_string75);
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            global.typer = 86;
            if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_heroblcon("susie");
            }
            else
            {
                scr_enemyblcon(x - 10, global.monstery[myself], 10);
            }
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk"))
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.mnfight = 1.5;
        }
    }
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
            instance_create(camerax() + (camerawidth() / 2), cameray() + (cameraheight() / 2), obj_growtangle);
        with (obj_growtangle)
        {
            if (other.boxoffset)
                y -= 50;
        }
        with (obj_battlecontroller)
            depth = obj_growtangle.depth + 2;
        with (obj_growtangle)
            depth = obj_growtangle.depth - 2;
        with (obj_darkener)
            depth = obj_heroparent.depth + 3;
        if (!instance_exists(obj_moveheart) && !instance_exists(obj_heart))
            scr_moveheart();
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            attackcon = 1;
            rudebusterhitcount = 0;
            scr_turntimer(999);
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1);
            var rand = irandom(100);
            if (rand < 33 && global.hp[0] > (global.maxhp[0] * 0.8))
                rr = 7;
            if (rand < 33 && global.hp[0] < (global.maxhp[0] * 0.4))
                rr = 8;
            if (rand < 23 && turn > 8)
                rr = 6;
            if (rand < 13)
                rr = 2;
            if (rand == 4 || rand == 5)
                rr = 3;
            if (rand == 2 || rand == 3)
                rr = 4;
            if (rand == 0 || rand == 1)
                rr = 5;
            if (haveattacked == false && turn == 2)
            {
                global.battlemsg[0] = dialogue_string79;
                ballooncon = 0;
                scr_speaker("susie");
            }
            else if (global.justice_attacked_twice == 2)
            {
                global.battlemsg[0] = stringsetloc("* The opponent seems impressed with Susie's guts!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_313_0");
                global.justice_attacked_twice++;
            }
            else if (justice_healed == 1)
            {
                global.battlemsg[0] = stringsetloc("* The opponent's seems very impressed with Susie's magic...!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_314_0");
                justice_healed++;
            }
            else if (justice_rudebuster == 1)
            {
                global.battlemsg[0] = stringsetloc("* The opponent is reeling from the Rude Buster!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_315_0");
                justice_rudebuster++;
            }
            else if (justice_item == 1)
            {
                global.battlemsg[0] = stringsetloc("* Your ITEMs were taken!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_316_0");
                justice_item++;
            }
            else if (progress >= 25 && global.justice_reached_25_first_time == 0)
            {
                global.battlemsg[0] = stringsetloc("* Things are finally starting to get serious!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_317_0");
                global.justice_reached_25_first_time++;
            }
            else if (progress >= 50 && global.justice_reached_50_first_time == 0)
            {
                global.battlemsg[0] = stringsetloc("* A bead of sweat forms on the old man's forehead...", "obj_hammer_of_justice_enemy_slash_Step_0_gml_318_0");
                global.justice_reached_50_first_time++;
            }
            else if (progress >= 75 && global.justice_reached_75_first_time == 0)
            {
                global.battlemsg[0] = stringsetloc("* The opponent is finally slowing down! ... or speeding up!?", "obj_hammer_of_justice_enemy_slash_Step_0_gml_319_0");
                global.justice_reached_75_first_time++;
            }
            else if (rr == 0)
            {
                global.battlemsg[0] = stringsetloc("* The air crackles green with freedom.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_320_0");
            }
            else if (rr == 1)
            {
                global.battlemsg[0] = stringsetloc("* The bells ring in justice...", "obj_hammer_of_justice_enemy_slash_Step_0_gml_321_0");
            }
            else if (rr == 2)
            {
                global.battlemsg[0] = stringsetloc("* The bell of justice is ringing... it's for you.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_322_0");
            }
            else if (rr == 3)
            {
                global.battlemsg[0] = stringsetloc("* The bell of justice tolls... for a frog. No, a turtle!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_323_0");
            }
            else if (rr == 4)
            {
                global.battlemsg[0] = stringsetloc("* The white wind howls!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_324_0");
            }
            else if (rr == 5)
            {
                global.battlemsg[0] = stringsetloc("* Smells like steel and leather.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_325_0");
            }
            else if (rr == 6)
            {
                global.battlemsg[0] = stringsetloc("* It's one shell of a battle!", "obj_hammer_of_justice_enemy_slash_Step_0_gml_326_0");
            }
            else if (rr == 7)
            {
                global.battlemsg[0] = stringsetloc("* Susie rolls her head confidently.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_327_0");
            }
            else if (rr == 8)
            {
                global.battlemsg[0] = stringsetloc("* Susie grits her teeth.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_328_0");
            }
            attacked = 1;
        }
    }
    if (introtalkcon == 1)
    {
        if (global.turntimer < 0)
        {
            with (obj_writer)
                instance_destroy();
            exit;
        }
        talktimer++;
        global.turntimer++;
        if (((button3_p() && talktimer > 15) || !i_ex(obj_writer)) || ballooncon == 0)
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 0 && (global.justice_attempts > 0 || firstconversationhappened == true))
            {
                msgset(0, dialogue_string8);
                ballooncon = 4;
            }
            else if (ballooncon == 0)
            {
                msgset(0, dialogue_string4);
                ballooncon = 1;
                susietalks = 1;
                var drawabove = true;
                with (obj_herosusie)
                    scr_shakeobj();
                with (obj_herosusie)
                {
                    state = 8;
                    hurt = 0;
                    attacktimer = 0;
                    sprite_index = spr_susie_hurt_lookright;
                    image_speed = 0;
                    image_index = 0;
                }
            }
            else if (ballooncon == 1)
            {
                msgset(0, dialogue_string5);
                ballooncon = 2;
                susietalks = 0;
            }
            else if (ballooncon == 2)
            {
                msgset(0, dialogue_string6);
                ballooncon = 3;
                susietalks = 0;
            }
            else if (ballooncon == 3)
            {
                msgset(0, dialogue_string7);
                ballooncon = 4;
                susietalks = 1;
            }
            else if (ballooncon == 4)
            {
                with (obj_herosusie)
                {
                    state = 0;
                    hurt = 0;
                    attacktimer = 0;
                    attacked = 0;
                }
                ballooncon = -1;
                introtalkcon = -1;
                exit;
            }
            global.typer = 50;
            if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                if (ballooncon == 1)
                {
                    balloon = scr_enemyblcon(obj_herosusie.x - 40, obj_herosusie.y - 78, 10);
                    balloon.side = 2;
                }
                if (ballooncon == 4)
                {
                    balloon = scr_enemyblcon(obj_herosusie.x - 25, obj_herosusie.y - 55, 10);
                    balloon.side = 2;
                }
            }
            else
            {
                global.typer = 86;
                if (ballooncon == 2)
                {
                    balloon = scr_enemyblcon(camerax() + 430, obj_herosusie.y - 96, 10);
                    balloon.side = 2;
                }
                if (ballooncon == 3)
                {
                    balloon = scr_enemyblcon(camerax() + 418, obj_herosusie.y - 116, 10);
                    balloon.side = 2;
                }
                if (ballooncon == 4)
                {
                    balloon = scr_enemyblcon(camerax() + 430, obj_herosusie.y - 106, 10);
                    balloon.side = 2;
                }
            }
            with (obj_battleblcon)
            {
                if (i_ex(obj_spearblocker))
                    depth = obj_spearblocker.depth - 10;
            }
            susietalks = 0;
            firstconversationhappened = true;
            talktimer = 0;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1 && postenemyturnevent == 0 && end_cutscene_version == 0 && reachedendphase == 0)
    {
        if (have_used_final_attack)
        {
            talked = -1;
            endcon = 1;
            end_cutscene_version = 1;
            global.charturn = 2;
            mus_volume(global.batmusic[1], 0, 90);
            exit;
        }
        postturntimer = 0;
        postenemyturnevent = 1;
        if (trueturn == 16 && endcon == 0)
        {
            postenemyturnevent = 2;
            progress += 30;
            snd_play(snd_mercyadd);
        }
        if (trueturn == 17 && endcon == 0)
        {
            postenemyturnevent = 3;
            progress += 24;
            snd_play(snd_mercyadd);
        }
        if (trueturn == 18 && endcon == 0)
        {
            postenemyturnevent = 4;
            progress += 24;
            snd_play(snd_mercyadd);
        }
        if (trueturn == 19 && endcon == 0)
        {
            postenemyturnevent = 5;
            progress += 20;
            snd_play(snd_mercyadd);
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 0 && postenemyturnevent == 0 && reachedendphase == 1)
    {
        if (have_used_final_attack)
        {
            talked = -1;
            endcon = 1;
            end_cutscene_version = 1;
            global.charturn = 3;
            global.myfight = -1;
            global.mnfight = -1;
            global.turntimer = -1;
            mus_volume(global.batmusic[1], 0, 90);
            exit;
        }
        postenemyturnevent = 1;
    }
    if (postenemyturnevent == 2 && endcon == 0)
    {
        postturntimer++;
        instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
        if (postturntimer >= 30)
        {
            postturntimer = 0;
            postenemyturnevent = 6;
        }
    }
    if (postenemyturnevent == 3 && endcon == 0)
    {
        postturntimer++;
        instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
        if (postturntimer >= 24)
        {
            postturntimer = 0;
            postenemyturnevent = 6;
        }
    }
    if (postenemyturnevent == 4 && endcon == 0)
    {
        postturntimer++;
        instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
        if (postturntimer >= 24)
        {
            postturntimer = 0;
            postenemyturnevent = 6;
        }
    }
    if (postenemyturnevent == 5 && endcon == 0)
    {
        postturntimer++;
        instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
        if (postturntimer >= 20)
        {
            postturntimer = 0;
            postenemyturnevent = 6;
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}
if (state == 3)
    scr_enemy_hurt();
if (attackcon == 1 && !i_ex(obj_writer))
{
    if (attackcount < attackcountmax)
    {
        scr_spearshot(list_attackdirection[attackcount], list_attackspeed[attackcount], list_attackframes[attackcount], list_attackspecial[attackcount], list_attackspecial2[attackcount]);
        attackcon = 2;
    }
    else
    {
        attackcon = 3;
        rudebusterhitcount = 0;
        swingdown_ex = 0;
    }
    attackcount++;
}
if (attackcon == 2 && !i_ex(obj_gerson_growtangle))
{
    attacktimer++;
    if (attacktimer >= list_attackwait[attackcount - 1] && !i_ex(obj_writer))
    {
        attacktimer = 0;
        attackcon = 1;
        if (reachedendphase == 1)
            have_used_final_attack = true;
    }
}
if (attackcon == 3 && global.turntimer > 10 && !i_ex(obj_spearshot))
{
    global.turntimer = 10;
    attackcon = 0;
}
if (scr_debug && scr_debug_keycheck(ord("V")) && scr_isphase("bullets"))
    event_user(14);
if (attackcon == 0)
    obj_battlecontroller.depth = savebattlecontrollerdepth;
if (hitbox_con == 1)
{
    hitbox_con = 0;
    with (obj_growtangle)
    {
        obj_growtangle.hspeed = 16;
        obj_growtangle.friction = 0.8;
        with (obj_heart)
        {
            hspeed = 16;
            friction = 0.8;
        }
    }
}
if (hitbox_con == 2)
{
    hitbox_con = 0;
    with (obj_growtangle)
    {
        obj_growtangle.hspeed = -16;
        obj_growtangle.friction = 0.8;
        with (obj_heart)
        {
            hspeed = -16;
            friction = 0.8;
        }
    }
}
if (mercylaughcon == 1)
{
    mercylaughtimer++;
    state = 12;
    sprite_set_offset(spr_gerson_laugh, 14, 22);
    sprite_index = spr_gerson_laugh;
    if (mercylaughtimer == 1)
        snd_play(snd_mercyadd);
    if ((mercylaughtimer % 2) == 0)
        star = instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
    if (mercylaughtimer == (((mercylaughcount + 1) * 2) - 1))
    {
        state = 0;
        sprite_index = spr_gerson_idle;
        mercylaughcon = 0;
        mercylaughtimer = 0;
    }
}
with (obj_growtangle)
{
    if (hspeed != 0)
    {
        scr_afterimage();
        if (i_ex(afterimage))
            afterimage.fadeSpeed = 0.2;
    }
}
if (end_cutscene_version == 0)
{
    if (endcon == 1)
    {
        endtimer++;
        if (endtimer == 1)
        {
            scr_fadeout(30);
            with (obj_fadeout)
            {
                image_blend = c_white;
                depth = 2;
            }
        }
        if (endtimer == 3)
        {
            with (obj_writer)
                instance_destroy();
            with (obj_face)
                instance_destroy();
        }
        if (endtimer == 60)
        {
            global.myfight = -1;
            global.mnfight = -1;
            global.fighting = 0;
            with (obj_battlecontroller)
            {
                victory = 1;
                skipvictory = 1;
            }
            global.flag[36] = 1;
            global.flag[39] = 1;
            endcon = 2;
        }
    }
}
else
{
    if (endcon == 1)
    {
        endtimer++;
        global.charturn = 2;
        if (endtimer == 1)
            mus_fade(global.batmusic[1], 90);
        if (endtimer == 1)
        {
            with (obj_battlecontroller)
                scr_mnendturn();
        }
        if (endtimer == 90)
        {
            msgsetloc(0, "... Alright,&I figured it out./%", "obj_hammer_of_justice_enemy_slash_Step_0_gml_630_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        if ((button3_p() && endtimer > 105) || (!i_ex(obj_writer) && endtimer > 90))
        {
            with (obj_writer)
                instance_destroy();
            endcon = 2;
            endtimer = 0;
        }
    }
    if (endcon == 2)
    {
        endtimer++;
        if (endtimer == 1)
        {
            obj_herosusie.x -= 35;
            obj_herosusie.y -= 28;
            scr_battle_sprite_set("susie", spr_susie_heal_charge2, 0.5, false);
        }
        if (endtimer == 6)
            scr_battle_sprite_set("susie", spr_susie_heal_charge2_loop, 0.5, true);
        if (endtimer == 30)
        {
            msgsetloc(0, "You wanna see what&I got, then.../%", "obj_hammer_of_justice_enemy_slash_Step_0_gml_662_0");
            global.typer = 75;
            var heroballoon = scr_enemyblcon(obj_herosusie.x + 100 + 35, obj_herosusie.y + 40 + 28, 10);
            heroballoon.side = -1;
        }
        if ((button3_p() && endtimer > 45) || (!i_ex(obj_writer) && endtimer > 30))
        {
            with (obj_writer)
                instance_destroy();
            endcon = 3;
            endtimer = 0;
            scr_battle_sprite_set("susie", spr_susie_heal_charge_loop, 0.5, true);
            var snd = snd_loop(snd_chargeshot_charge);
            snd_volume(snd, 0, 0);
            snd_volume(snd, 0.2, 30);
        }
    }
    if (endcon == 3)
    {
        endtimer++;
        if ((button3_p() && endtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            endcon = 4;
            endtimer = 0;
        }
    }
    if (endcon == 4)
    {
        endtimer++;
        if (endtimer == 30)
        {
            msgsetloc(0, "Take THIS!!!/%", "obj_hammer_of_justice_enemy_slash_Step_0_gml_704_0");
            global.typer = 75;
            var heroballoon = scr_enemyblcon(obj_herosusie.x + 100 + 35, obj_herosusie.y + 40 + 28, 10);
            heroballoon.side = -1;
        }
        if ((button3_p() && endtimer > 45) || (!i_ex(obj_writer) && endtimer > 30))
        {
            with (obj_writer)
                instance_destroy();
            endcon = 5;
            endtimer = 0;
            siner -= 14;
        }
    }
    if (endcon == 5)
    {
        endtimer++;
        if (endtimer == 1)
        {
            scr_battle_sprite_set("susie", spr_susie_heal_end, 0.5, false);
            var snd = snd_loop(snd_chargeshot_charge);
            snd_volume(snd, 0, 0);
            snd_volume(snd, 0.2, 30);
        }
        if (endtimer == 6)
        {
            inst = instance_create(obj_herosusie.x + 86, obj_herosusie.y + 60, obj_susie_heal_projectile);
            inst.gravity = 1;
            inst.gravity_direction = 8;
            inst.image_xscale = 3;
            inst.image_yscale = 3;
            inst.image_speed = 1;
            inst.image_angle = 8;
            snd_stop(snd_chargeshot_charge);
            snd_play_x(snd_heartshot_dr_b, 0.4, 0.4);
        }
        if (endtimer == 28)
        {
            obj_herosusie.x = obj_herosusie.xstart;
            obj_herosusie.y = obj_herosusie.ystart;
        }
        if (endtimer == 25)
        {
            msgsetloc(0, "Ha, ya missed.", "obj_hammer_of_justice_enemy_slash_Step_0_gml_757_0");
            global.typer = 86;
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        if (endtimer == 46)
        {
            with (obj_writer)
                instance_destroy();
        }
        if (endtimer == 45)
        {
            scr_battle_sprite_set("susie", spr_susieb_attack, 0.5, false);
            attack = instance_create(global.monsterx[myself] - 40, global.monstery[myself] - 4, obj_basicattack);
            attack.sprite_index = spr_attack_cut1_purple;
            attack.image_speed = 0.25;
            attack.image_xscale = 0.75;
            attack.image_yscale = 0.75;
            attack.image_angle = 45;
            attack.maxindex = 4;
            ls = snd_play(snd_laz_c);
            snd_pitch(ls, 0.7);
            nohairsprite = true;
            snd_play(snd_old_man_grunt);
        }
        if (endtimer == 45)
        {
            scr_fadeout(60);
            with (obj_fadeout)
            {
                image_blend = c_white;
                if (i_ex(obj_tensionbar))
                    depth = obj_tensionbar.depth - 1;
            }
            hair = instance_create(x + 25, y + 32, obj_gerson_hair2);
            hair.image_speed = 0;
            hair.image_index = 0;
            hair.image_angle = 20;
            hair.hspeed -= 0.5;
            if (i_ex(obj_fadeout))
                hair.depth = obj_fadeout.depth - 1;
            hair = instance_create(x + 25, y + 32, obj_gerson_hair2);
            hair.image_speed = 0;
            hair.image_index = 0;
            hair.image_angle = -20;
            hair.hspeed = 0.5;
            if (i_ex(obj_fadeout))
                hair.depth = obj_fadeout.depth - 1;
        }
        if (endtimer == 55)
            scr_battle_sprite_set("susie", spr_susie_attack_end, 0.5, true);
        if (endtimer == 105)
        {
            with (obj_battlecontroller)
                skipvictory = 1;
            global.mag[2] += 4;
            global.flag[1569] = 1;
            scr_wincombat();
        }
    }
    with (obj_battlecontroller)
        damagenoise = 0;
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
