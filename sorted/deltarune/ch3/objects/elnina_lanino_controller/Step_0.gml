if (i_ex(obj_board_event_ninfight) && obj_board_event_ninfight.retry == 1)
{
    if (intro == 0)
    {
        introtimer++;
        if (introtimer == 10)
        {
            tenna.preset = 2;
            tenna.reversal = 0;
            tenna.vspeed = -31;
            tenna.image_xscale = -2;
            tenna.x = camerax() + 420;
            tenna.y = cameray() + 620;
            tenna.depth = depth - 10;
        }
        if (introtimer == 21)
        {
            introtimer = 0;
            intro = 0.1;
            talked = 0.1;
            global.charturn = 3;
            tenna.vspeed = 0;
            snd_play(snd_impact);
            instance_create(x, y, obj_shake);
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Okay, look,&you get it./%", "obj_elnina_lanino_controller_slash_Step_0_gml_44_0");
            with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
        }
    }
    if (intro == 0.1 && !i_ex(obj_writer))
    {
        global.fc = 22;
        global.typer = 81;
        msgsetloc(0, "Say I LOVE&TV 99 times&and you win./%", "obj_elnina_lanino_controller_slash_Step_0_gml_54_0");
        with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
        {
        }
        intro = 0.11;
    }
    if (intro == 0.11 && !i_ex(obj_writer))
    {
        global.fc = 22;
        global.typer = 81;
        msgsetloc(0, "By the way&YOU TWO, PLEASE&try to stay&professional./%", "obj_elnina_lanino_controller_slash_Step_0_gml_63_0");
        with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
        {
        }
        intro = 0.12;
    }
    if (intro == 0.12 && !i_ex(obj_writer))
    {
        msgsetloc(0, "It'd be a REAL&SHAME to see&an almost literal&word-for-word&repeat of last&time!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_69_0");
        with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
        {
        }
        intro = 0.13;
    }
    if (intro == 0.13 && !i_ex(obj_writer))
    {
        tenna.vspeed = 50;
        intro = 1;
    }
}
else
{
    if (intro == 0)
    {
        introtimer++;
        if (introtimer == 10)
        {
            tenna.preset = 2;
            tenna.reversal = 0;
            tenna.vspeed = -31;
            tenna.image_xscale = -2;
            tenna.x = camerax() + 420;
            tenna.y = cameray() + 620;
            tenna.depth = depth - 10;
        }
        if (introtimer == 21)
        {
            introtimer = 0;
            intro = 0.1;
            talked = 0.1;
            global.charturn = 3;
            tenna.vspeed = 0;
            snd_play(snd_impact);
            instance_create(x, y, obj_shake);
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "This battle has&a SPECIAL win&condition for&our contestants!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_35_0");
            with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
        }
    }
    if (intro == 0.1 && !i_ex(obj_writer))
    {
        global.fc = 22;
        global.typer = 81;
        msgsetloc(0, "All you have to&do is say \"I love&to watch TV\" 99&times and you will&win!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_45_0");
        with (scr_enemyblcon(tenna.x - 56, tenna.y - 140, 10))
        {
        }
        intro = 0.2;
    }
    if (intro >= 0.2 && ralseishocked == false)
    {
        extimer++;
        if (extimer == 24 || introtimer == 5)
        {
            scr_battle_sprite_set("ralsei", spr_ralsei_shocked_right, 0, 0);
            if (i_ex(obj_heroralsei))
                obj_heroralsei.x += 30;
            ralseishocked = true;
        }
    }
    if (intro == 0.2 && !i_ex(obj_writer))
        intro = 0.3;
    if (intro == 0.3)
    {
        introtimer++;
        if (introtimer == 6)
        {
            msgsetloc(0, "Ninety... Ni-", "obj_elnina_lanino_controller_slash_Step_0_gml_62_0");
            global.typer = 74;
            var heroballoon = scr_enemyblcon(obj_heroralsei.x + 50, obj_heroralsei.y + 40, 10);
            heroballoon.side = -1;
            tenna.vspeed = 50;
        }
        if (introtimer == 24)
            intro = 1;
    }
}
if (intro == 1)
{
    global.batmusic[0] = snd_init("rudebuster_boss.ogg");
    global.batmusic[1] = mus_loop_ext(global.batmusic[0], 0.7, 1);
    with (obj_writer)
        instance_destroy();
    global.charturn = 0;
    talked = 0;
    intro = 4;
    scr_speaker("tenna");
    global.typer = 80;
    global.fc = 22;
    scr_battle_sprite_reset("ralsei");
    if (i_ex(obj_heroralsei))
        obj_heroralsei.x -= 30;
}
if (ilovetv_increase > 0 && digit_flash_timer == 0)
{
    if (ilovetv < 99)
    {
        ilovetv_increased = true;
        if (ilovetv < 98)
            snd_play_pitch(snd_scissorbell, ilovetv_pitch);
        else
            snd_play(snd_sparkle_glock);
        if (ilovetv_increase == 99)
        {
            ilovetv += 1;
            ilovetv = min(ilovetv, 99);
            ilovetv_pitch = 1 + (ilovetv / 100);
        }
        else
        {
            ilovetv++;
            if (ilovetvlimit == true && ilovetv == 40)
                ilovetv = 30;
            ilovetv_increase--;
            ilovetv_pitch += 0.1;
        }
        digit_flash_timer = digit_flash_duration;
    }
    if (ilovetv_increase == 0)
        ilovetv_pitch = 1;
}
if (scr_isphase("menu"))
{
    if (!calculated_forecast)
    {
        turn2_turns++;
        if (ilovetv > 0)
        {
            if (turn2_turns > 2 && turns < 2)
                turns = 2;
        }
        else if (turns > 1 && ilovetv == 0 && turn2_turns < 7)
        {
            turns = 0;
        }
        ilovetv_increased = false;
        forecast_turn = turns;
        var _sun = 783;
        var _moon = 1474;
        var _rain = 4255;
        var _snow = 1650;
        var _hale = 14;
        var _temp_min = 50;
        var _temp_max = 60;
        switch (forecast_turn)
        {
            case 0:
                forecasts[0] = [irandom_range(_temp_min, _temp_max), _moon, _snow];
                forecasts[1] = [irandom_range(_temp_min, _temp_max), _moon, _snow];
                forecasts[2] = [irandom_range(_temp_min, _temp_max), _moon, _snow];
                break;
            case 1:
                forecasts[0] = [irandom_range(_temp_min, _temp_max), _sun, _rain];
                forecasts[1] = [irandom_range(_temp_min, _temp_max), _sun, _rain];
                forecasts[2] = [irandom_range(_temp_min, _temp_max), _sun, _rain];
                break;
            case 2:
                forecasts[0] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                forecasts[1] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                forecasts[2] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                break;
            default:
                if (lastchosen == "lanino")
                {
                    _temp_min = 80 + ((forecast_turn - 3) * 100);
                    _temp_max = 89 + ((forecast_turn - 3) * 100);
                }
                else
                {
                    _temp_min = 40 - ((forecast_turn - 3) * 30);
                    _temp_max = 50 - ((forecast_turn - 3) * 30);
                }
                if (choose(0, 1) == 1)
                {
                    forecasts[0] = [irandom_range(_temp_min, _temp_max), _sun, _snow];
                    forecasts[1] = [irandom_range(_temp_min, _temp_max), _sun, _snow];
                    forecasts[2] = [irandom_range(_temp_min, _temp_max), _sun, _snow];
                }
                else
                {
                    forecasts[0] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                    forecasts[1] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                    forecasts[2] = [irandom_range(_temp_min, _temp_max), _moon, _rain];
                }
                break;
        }
        calculated_forecast = true;
    }
}
var lanino = obj_lanino_enemy;
var elnina = obj_elnina_enemy;
var _lanino_favored = (lastchosen == "" && sunboost > 0) || lastchosen == "lanino";
var _sun_atk = 68;
var _moon_atk = 69;
var _snow_atk = 70;
var _rain_atk = 71;
if (scr_isphase("enemytalk") && talked == 0 && !i_ex(obj_rouxls_ch3_enemy))
{
    scr_randomtarget();
    if (!instance_exists(obj_darkener))
        instance_create(0, 0, obj_darkener);
    talked = 1;
    attacked = 0;
    ballooncon = 0;
    balloonsubcon = 0;
    balloonend = 1;
    talkedcon = 0;
    ralseitalks = 0;
    susietalks = 0;
    attackdone = 0;
    spadepower = 0;
    yarnendturn = 0;
    elnina_attack = 0;
    lanino_attack = 0;
    calculated_forecast = false;
    battlemsg_set = false;
    turns += 1;
    if (ilovetv > 0 && turn2_turns > 2 && turns < 3)
        turns = 3;
    global.typer = 50;
    if (turns < 4)
    {
        msgsetloc(0, "Tonight's weather&is.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_347_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "Tonight's weather&is.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_350_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_enemy)
        {
            talking = true;
            pose = 1;
        }
        with (obj_elnina_enemy)
        {
            talking = true;
            pose = 1;
        }
        ballooncon = turns;
        if (turns == 3)
        {
            if (sunboost != 0)
            {
                if (_lanino_favored)
                {
                    ballooncon = 3;
                    with (obj_lanino_enemy)
                        pose = 0;
                }
                else
                {
                    ballooncon = 8;
                    with (obj_elnina_enemy)
                        pose = 0;
                }
            }
            else
            {
                ballooncon = 2;
            }
        }
        balloonend = 0;
    }
    if (turns == 4)
    {
        msgsetloc(0, "Today's weather is,&haha...", "obj_elnina_lanino_controller_slash_Step_0_gml_371_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
                pose = 1;
            lanino.head = 1271;
        }
        else
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
                pose = 1;
            elnina.head = 4845;
        }
        msgsetloc(0, "Today's weather is,&(ugh).../%", "obj_elnina_lanino_controller_slash_Step_0_gml_375_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            elnina.head = 4435;
        }
        else
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            lanino.head = 3264;
        }
        with (obj_lanino_enemy)
            talking = true;
        with (obj_elnina_enemy)
            talking = true;
        if (_lanino_favored)
            ballooncon = 13;
        else
            ballooncon = 14;
        balloonend = 0;
    }
    if (turns == 5)
    {
        msgsetloc(0, "Today's weather is,&ohoho.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_388_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 1;
            }
            lanino.head = 1271;
        }
        else
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 1;
            }
            elnina.head = 4845;
        }
        msgsetloc(0, "(Grumble)...", "obj_elnina_lanino_controller_slash_Step_0_gml_392_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            elnina.head = 871;
        }
        else
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            lanino.head = 4530;
        }
        if (_lanino_favored)
            ballooncon = 15;
        else
            ballooncon = 16;
        balloonend = 0;
    }
    if (turns == 6)
    {
        if (_lanino_favored)
            msgsetloc(0, "It's nice I&finally get to&shine on my&own, you know?&Instead of just&being... behind&the clouds!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_403_0");
        else
            msgsetloc(0, "FINALLY! REAL&weather fans!&SUN isn't even&a weather! It&just... sits there&and looks hot!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_404_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 1;
            }
            lanino.head = 679;
        }
        else
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 1;
            }
            elnina.head = 1196;
        }
        msgsetloc(0, "...", "obj_elnina_lanino_controller_slash_Step_0_gml_408_0");
        if (_lanino_favored)
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            elnina.head = 4435;
        }
        else
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            lanino.head = 3264;
        }
        ballooncon = 17;
        balloonend = 0;
    }
    if (turns == 7)
    {
        if (_lanino_favored)
        {
            msgsetloc(0, "HA! No one damping&my vibes now!! Time&for the SUN to be&a STAR!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_419_0");
            lanino_attack = _sun_atk;
            elnina_attack = 0;
        }
        else
        {
            msgsetloc(0, "HA!! They're just&jealous!! Who needs&their attack!!!&WATCH!!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_425_0");
            lanino_attack = _snow_atk;
            elnina_attack = 0;
        }
        if (_lanino_favored)
        {
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 2;
            }
            lanino.head = 679;
        }
        else
        {
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 2;
            }
            elnina.head = 1196;
        }
        balloonend = 0;
        ballooncon = 1.1;
    }
    if (turns == 3 || turns > 4)
        obj_battlecontroller.noreturn = 1;
    if (ralseitalks == 1 && instance_exists(obj_heroralsei))
    {
        global.typer = 74;
        scr_enemyblcon(obj_heroralsei.x + 75, obj_heroralsei.y + 15, 7);
        scr_guardpeek(obj_heroralsei);
    }
    else if (susietalks == 1 && instance_exists(obj_herosusie))
    {
        global.typer = 75;
        scr_enemyblcon(obj_herosusie.x + 75, obj_herosusie.y + 15, 7);
        scr_guardpeek(obj_herosusie);
    }
    ralseitalks = 0;
    susietalks = 0;
    if (balloonend == 1)
    {
        talked = 0.5;
        talktimer = 0;
        alarm[6] = 1;
    }
    else
    {
        talked = 0.6;
        talktimer = 0;
    }
    rtimer = 0;
}
if (talked == 0.5)
{
    talktimer++;
    if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        alarm[6] = 1;
    }
}
if (talked == 0.6)
{
    var _forecast = forecasts[0];
    var _laninobulletsprite = _forecast[1];
    var _elninabullesprite = _forecast[2];
    talktimer++;
    if ((button3_p() && talktimer > 15) || (!i_ex(obj_writer) && ballooncon != 3.5 && ballooncon != 8.5) || (instance_number(obj_writer) == 1 && (ballooncon == 1.2 || ballooncon == 17 || ballooncon == 16 || ballooncon == 15 || ballooncon == 14 || ballooncon == 13)) || (ballooncon == 3.5 && talktimer > 60) || (ballooncon == 8.5 && talktimer > 60))
    {
        with (obj_writer)
            instance_destroy();
        with (obj_lanino_enemy)
            talking = false;
        with (obj_elnina_enemy)
            talking = false;
        if (ballooncon == 1)
        {
            lanino_attack = _moon_atk;
            elnina_attack = _snow_atk;
            msgsetloc(0, "... Moon.", "obj_elnina_lanino_controller_slash_Step_0_gml_499_0");
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "... Crystals./%", "obj_elnina_lanino_controller_slash_Step_0_gml_502_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 2;
            }
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.2;
        }
        else if (ballooncon == 1.1)
        {
            ballooncon = 0;
            balloonend = 1;
        }
        else if (ballooncon == 1.2)
        {
            ballooncon = 0;
            balloonend = 1;
        }
        else if (ballooncon == 2)
        {
            lanino_attack = _sun_atk;
            elnina_attack = _rain_atk;
            if (turns == 3)
            {
                lanino_attack = _moon_atk;
                msgsetloc(0, "... Moon.", "obj_elnina_lanino_controller_slash_Step_0_gml_532_0");
            }
            else
            {
                msgsetloc(0, "... Sun.", "obj_elnina_lanino_controller_slash_Step_0_gml_534_0");
            }
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "... Drop./%", "obj_elnina_lanino_controller_slash_Step_0_gml_537_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 2;
            }
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.2;
        }
        else if (ballooncon == 3)
        {
            lanino_attack = _moon_atk;
            elnina_attack = _rain_atk;
            with (obj_elnina_enemy)
                pose = 2;
            snd_play(snd_impact);
            ballooncon = 3.5;
            balloonend = 0;
        }
        else if (ballooncon == 3.5)
        {
            msgsetloc(0, "... Lanino? Your pose.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_561_0");
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
                talking = true;
            ballooncon = 4;
            balloonend = 0;
        }
        else if (ballooncon == 4)
        {
            msgsetloc(0, "Ah, right! Just, er.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_572_0");
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 3;
                head = 2741;
                chest = 1010;
                scr_lerpvar("chestindex", 0, 3, 20);
                scr_delay_var("chest", 3079, 30);
                scr_delay_var("pose", 0, 30);
            }
            ballooncon = 5;
            balloonend = 0;
        }
        else if (ballooncon == 5)
        {
            msgsetloc(0, "They kept choosing ME for the ACT. Any... cool reason why?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_589_0");
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
                talking = true;
            ballooncon = 6;
            balloonend = 0;
        }
        else if (ballooncon == 6)
        {
            msgsetloc(0, "Not to rain on your parade, amore, but it's probably just because you're first in the order./%", "obj_elnina_lanino_controller_slash_Step_0_gml_599_0");
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
                talking = true;
            ballooncon = 7;
            balloonend = 0;
        }
        else if (ballooncon == 7)
        {
            msgsetloc(0, "R-right! You're right as rain, sweet cloud o' mine./%", "obj_elnina_lanino_controller_slash_Step_0_gml_609_0");
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
                talking = true;
            ballooncon = 1.1;
        }
        else if (ballooncon == 8)
        {
            lanino_attack = _moon_atk;
            elnina_attack = _rain_atk;
            with (obj_lanino_enemy)
                pose = 2;
            snd_play(snd_impact);
            ballooncon = 8.5;
            balloonend = 0;
        }
        else if (ballooncon == 8.5)
        {
            msgsetloc(0, "... Elnina? Your pose.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_633_0");
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
                talking = true;
            ballooncon = 9;
            balloonend = 0;
        }
        else if (ballooncon == 9)
        {
            msgsetloc(0, "Oh, um...&sorry, just.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_644_0");
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 3;
                head = 4212;
                rightarm = 1888;
                scr_lerpvar("rightarmindex", 0, 3, 20);
                scr_delay_var("rightarm", 1641, 30);
                scr_delay_var("pose", 0, 30);
            }
            ballooncon = 10;
            balloonend = 0;
        }
        else if (ballooncon == 10)
        {
            msgsetloc(0, "Couldn't help but&notice they keep&ACTing on me...&any cool reason?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_661_0");
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
                talking = true;
            ballooncon = 11;
            balloonend = 0;
        }
        else if (ballooncon == 11)
        {
            msgsetloc(0, "Oh, dewdrop.&It's just brownian&motion. Their&choices... are&random./%", "obj_elnina_lanino_controller_slash_Step_0_gml_671_0");
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            with (obj_lanino_enemy)
                talking = true;
            ballooncon = 12;
            balloonend = 0;
        }
        else if (ballooncon == 12)
        {
            msgsetloc(0, "R-right! Not&enough info to&predict anything!&Haha!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_681_0");
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            with (obj_elnina_enemy)
                talking = true;
            ballooncon = 1.1;
        }
        else if (ballooncon == 13)
        {
            if (_laninobulletsprite == 1474)
            {
                lanino_attack = _moon_atk;
                msgsetloc(0, "EXTRA DEXTRA Moon!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_687_0");
            }
            if (_laninobulletsprite == 783)
            {
                lanino_attack = _sun_atk;
                msgsetloc(0, "EXTRA DEXTRA Sun!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_688_0");
            }
            if (_elninabullesprite == 4255)
                elnina_attack = _rain_atk;
            if (_elninabullesprite == 1650)
                elnina_attack = _snow_atk;
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            lanino.head = 679;
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 14)
        {
            if (_laninobulletsprite == 1474)
                lanino_attack = _moon_atk;
            if (_laninobulletsprite == 783)
                lanino_attack = _sun_atk;
            if (_elninabullesprite == 4255)
            {
                elnina_attack = _rain_atk;
                msgsetloc(0, "TRUEST Drop!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_707_0");
            }
            if (_elninabullesprite == 1650)
            {
                elnina_attack = _snow_atk;
                msgsetloc(0, "TRUEST Crystal!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_708_0");
            }
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            elnina.head = 1196;
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 15)
        {
            if (_laninobulletsprite == 1474)
            {
                lanino_attack = _moon_atk;
                msgsetloc(0, "EXTRA DEXTRA Moon!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_721_0");
            }
            if (_laninobulletsprite == 783)
            {
                lanino_attack = _sun_atk;
                msgsetloc(0, "EXTRA DEXTRA Sun!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_722_0");
            }
            if (_elninabullesprite == 4255)
                elnina_attack = _rain_atk;
            if (_elninabullesprite == 1650)
                elnina_attack = _snow_atk;
            scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
            lanino.head = 679;
            with (obj_lanino_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 16)
        {
            if (_laninobulletsprite == 1474)
                lanino_attack = _moon_atk;
            if (_laninobulletsprite == 783)
                lanino_attack = _sun_atk;
            if (_elninabullesprite == 4255)
            {
                elnina_attack = _rain_atk;
                msgsetloc(0, "TRUEST Drop!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_741_0");
            }
            if (_elninabullesprite == 1650)
            {
                elnina_attack = _snow_atk;
                msgsetloc(0, "TRUEST Crystal!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_742_0");
            }
            scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
            elnina.head = 1196;
            with (obj_elnina_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 17)
        {
            if (_lanino_favored)
            {
                lanino_attack = _sun_atk;
                elnina_attack = 0;
                msgsetloc(0, "ANY Darkner can&do a rain attack...&but a MOON&attack...? Eclipses&your HEART!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_763_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                {
                    talking = true;
                    pose = 2;
                }
            }
            else
            {
                lanino_attack = 0;
                elnina_attack = _rain_atk;
                msgsetloc(0, "And the MOON?&Puts me to&SLEEP! WEATHER&girls are the&WAVE, got it?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_771_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                {
                    talking = true;
                    pose = 2;
                }
            }
            ballooncon = 1.1;
        }
        talked = 0.7;
        global.typer = 50;
        if (ralseitalks == 1 && instance_exists(obj_heroralsei))
        {
            global.typer = 74;
            scr_heroblcon("ralsei");
            scr_guardpeek(obj_heroralsei);
        }
        else if (susietalks == 1 && instance_exists(obj_herosusie))
        {
            global.typer = 75;
            scr_heroblcon("susie");
            scr_guardpeek(obj_herosusie);
        }
        ralseitalks = 0;
        susietalks = 0;
        alarm[6] = 1;
    }
}
if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    global.mnfight = 1.5;
if (global.mnfight == 1.5 && !i_ex(obj_rouxls_ch3_enemy))
{
    if (!instance_exists(obj_growtangle))
    {
        if (turns < 7)
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        if (turns == 7)
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 190, obj_growtangle);
    }
    if (!instance_exists(obj_moveheart))
        scr_moveheart();
    global.mnfight = 2;
    scr_turntimer(90);
    ballooncon = -1;
    with (obj_lanino_enemy)
    {
        talking = false;
        pose = 0;
    }
    with (obj_elnina_enemy)
    {
        talking = false;
        pose = 0;
    }
}
if (scr_isphase("bullets") && attacked == 0 && !i_ex(obj_rouxls_ch3_enemy))
{
    rtimer += 1;
    if (rtimer == 12)
    {
        var sunboost_save = sunboost;
        sunboost = 0;
        if (global.choice == 0)
        {
            if (other.turns == 4)
                sunboost = -1;
            if (other.turns == 5)
                sunboost = -2;
            if (other.turns == 6)
                sunboost = -3;
            if (other.turns == 7)
                sunboost = -4;
        }
        if (global.choice == 1)
        {
            if (other.turns == 4)
                sunboost = 1;
            if (other.turns == 5)
                sunboost = 2;
            if (other.turns == 6)
                sunboost = 3;
            if (other.turns == 7)
                sunboost = 4;
        }
        var _a = 379;
        if (!i_ex(obj_lanino_enemy))
            _a = 946;
        with (_a)
        {
            dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
            dc.type = 130;
            if (other.turns == 0)
                dc.special = 0;
            if (other.turns == 1)
                dc.special = 0;
            if (other.turns == 2)
                dc.special = 0;
            if (other.turns == 3)
                dc.special = 1;
            if (other.turns == 4)
                dc.special = 2;
            if (other.turns == 5)
                dc.special = 3;
            if (other.turns == 6)
                dc.special = 3;
            if (other.turns == 7)
                dc.special = 4;
            if (_lanino_favored)
                dc.side = 0;
            else
                dc.side = 1;
        }
        sunboost = sunboost_save;
        if (turns < 5)
            scr_turntimer(260);
        if (turns == 5)
            scr_turntimer(275);
        if (turns == 6)
            scr_turntimer(275);
        if (turns == 7)
            scr_turntimer(850);
        global.typer = 6;
        global.fc = 0;
        attacked = 1;
        talked = 0;
        balloonend = 0;
        ballooncon = -1;
    }
}
if (scr_isphase("bullets") && global.turntimer < 1 && battlemsg_set == false)
{
    battlemsg_set = true;
    if (turns == 1)
    {
        scr_speaker("tenna");
        global.fc = 22;
        global.battlemsg[0] = stringsetloc("* These two are a professional power couple!!! Nothing can stop the weather!!", "obj_elnina_lanino_controller_slash_Step_0_gml_807_0");
    }
    if (turns == 2)
    {
        scr_speaker("tenna");
        global.fc = 22;
        global.battlemsg[0] = stringsetsubloc("* Keep it up guys! That's ~1 I love TV's! But this couple won't let you win so easily!", ilovetv, "obj_elnina_lanino_controller_slash_Step_0_gml_813_0");
    }
    if (turns == 3)
    {
    }
    if (turns == 4)
    {
        scr_speaker("tenna");
        global.fc = 22;
        global.battlemsg[0] = stringsetloc("* It's normal for couples to fight sometimes! C'mon Kris, tell 'em!", "obj_elnina_lanino_controller_slash_Step_0_gml_823_0");
    }
    if (turns == 5)
    {
        scr_speaker("rouxls");
        global.battlemsg[0] = stringsetloc("* Sorrye, I just wanderedeth in here. Are those two... Single?", "obj_elnina_lanino_controller_slash_Step_0_gml_828_0");
    }
    if (turns == 6)
    {
        scr_speaker("tenna");
        global.fc = 22;
        global.battlemsg[0] = stringsetloc("* One weather's better than two!! Haha!! Less confusing for the kids!!!", "obj_elnina_lanino_controller_slash_Step_0_gml_834_0");
    }
}
if (turns == 4 && global.turntimer > 0)
    extratimer++;
if (extratimer == 39)
{
    if (!_lanino_favored)
    {
        with (obj_lanino_enemy)
            scr_move_to_point_over_time(xstart + 70, y, 10);
    }
}
if (extratimer == 50)
{
    global.typer = 50;
    if (_lanino_favored)
    {
        msgsetloc(0, "Wh-what&the!?", "obj_elnina_lanino_controller_slash_Step_0_gml_914_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] + 25, 10);
        with (obj_elnina_enemy)
            talking = true;
        elnina.head = 871;
    }
    else
    {
        msgsetloc(0, "Wh-what&the!?", "obj_elnina_lanino_controller_slash_Step_0_gml_919_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 35, 10);
        with (obj_lanino_enemy)
            talking = true;
        lanino.head = 4530;
    }
}
if (extratimer == 100)
{
    global.typer = 50;
    with (obj_writer)
        instance_destroy();
    if (_lanino_favored)
    {
        msgsetloc(0, "It's&ruining&MY attack!", "obj_elnina_lanino_controller_slash_Step_0_gml_929_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] + 25, 10);
        with (obj_elnina_enemy)
            talking = true;
        elnina.head = 871;
    }
    else
    {
        msgsetloc(0, "It's&ruining&MY attack!", "obj_elnina_lanino_controller_slash_Step_0_gml_934_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 35, 10);
        with (obj_lanino_enemy)
            talking = true;
        lanino.head = 4530;
    }
}
if (extratimer == 140)
{
    with (obj_lanino_enemy)
        talking = false;
    with (obj_elnina_enemy)
        talking = false;
    with (obj_writer)
        instance_destroy();
    if (!_lanino_favored)
    {
        with (obj_lanino_enemy)
            scr_move_to_point_over_time(xstart, y, 6);
    }
}
if (i_ex(obj_battlecontroller))
    tenna.depth = obj_battlecontroller.depth + 1;
if (intro < 4)
    tenna.depth = depth - 10;
if (i_ex(obj_battlecontroller))
{
    if (global.mnfight == 2 && global.turntimer <= 1 && obj_battlecontroller.noreturn == 1 && afterbulletcon == 0 && !i_ex(obj_choicer_neo))
    {
        talktimer++;
        global.typer = 50;
        if ((button3_p() && talktimer > 15) || (!i_ex(obj_writer) && ballooncon != -1 && ballooncon != 4 && ballooncon != 8 && ballooncon != 10 && ballooncon != 15 && ballooncon != 17 && ballooncon != 17.5 && ballooncon != 17.6 && ballooncon != 22.1 && ballooncon != 24.5 && ballooncon != 25 && ballooncon != 26 && ballooncon != 27 && ballooncon != 28) || (ballooncon == -1 && talktimer > 15) || (ballooncon == 4 && talktimer > 30) || (ballooncon == 8 && talktimer > 30) || (ballooncon == 10 && talktimer > 5) || (ballooncon == 15 && talktimer > 10) || (ballooncon == 17 && talktimer > 60) || (ballooncon == 17.5 && talktimer > 15) || (ballooncon == 17.6 && talktimer > 15) || (ballooncon == 22.1 && talktimer > 60) || (ballooncon == 24.5 && talktimer > 90) || (ballooncon == 25 && (tenna.y + tenna.speed) > (cameray() + 280)) || ballooncon == 26 || (ballooncon == 27 && talktimer > 20) || (ballooncon == 28 && talktimer > 60))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == -1 && turns == 3 && _lanino_favored)
            {
                msgsetloc(0, "So... um.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_965_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                    talking = true;
                lanino.head = 2741;
                ballooncon = 0.5;
                balloonend = 0;
            }
            else if (ballooncon == 0.5)
            {
                msgsetloc(0, "Whose attack&did you like&better just now?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_975_0_b");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                    talking = true;
                lanino.head = 2741;
                ballooncon = 1;
                balloonend = 0;
            }
            else if (ballooncon == 1)
            {
                with (obj_lanino_enemy)
                    talking = false;
                msgsetloc(0, "Wh... what the!&Don't ask that!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_987_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                {
                    talking = true;
                    pose = 3;
                    head = 871;
                    rightarm = 1888;
                    scr_lerpvar("rightarmindex", 0, 3, 20);
                    scr_delay_var("rightarm", 1641, 30);
                    scr_delay_var("pose", 0, 30);
                }
                ballooncon = 2;
                balloonend = 0;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "S-sorry!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1004_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                    talking = true;
                with (obj_elnina_enemy)
                    talking = false;
                lanino.head = 4544;
                ballooncon = 3;
                balloonend = 0;
            }
            else if (ballooncon == 3)
            {
                with (obj_lanino_enemy)
                    talking = false;
                with (obj_elnina_enemy)
                    talking = false;
                ballooncon = 4;
                balloonend = 0;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "... obviously it&was mine anyway,&right?! Pick!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1022_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                    talking = true;
                with (obj_lanino_enemy)
                    talking = false;
                elnina.head = 4212;
                ballooncon = 9;
                balloonend = 0;
            }
            else if (ballooncon == -1 && turns == 3 && !_lanino_favored)
            {
                msgsetloc(0, "So... Um.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1033_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                    talking = true;
                elnina.head = 4212;
                with (obj_elnina_enemy)
                {
                    talking = true;
                    pose = 3;
                    rightarm = 1888;
                    scr_lerpvar("rightarmindex", 0, 3, 20);
                    scr_delay_var("rightarm", 1641, 30);
                    scr_delay_var("pose", 0, 30);
                }
                ballooncon = 5;
                balloonend = 0;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "Whose attack&did you like&better just now?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1052_0_b");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                    talking = true;
                elnina.head = 4212;
                ballooncon = 5.5;
                balloonend = 0;
            }
            else if (ballooncon == 5.5)
            {
                with (obj_elnina_enemy)
                    talking = false;
                msgsetloc(0, "Wh... what the!&Don't ask that!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1064_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                {
                    talking = true;
                    pose = 3;
                    head = 4530;
                    chest = 1010;
                    scr_lerpvar("chestindex", 0, 3, 20);
                    scr_delay_var("chest", 3079, 30);
                    scr_delay_var("pose", 0, 30);
                }
                ballooncon = 6;
                balloonend = 0;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "S-sorry!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1081_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_elnina_enemy)
                    talking = true;
                with (obj_lanino_enemy)
                    talking = false;
                elnina.head = 3799;
                ballooncon = 7;
                balloonend = 0;
            }
            else if (ballooncon == 7)
            {
                with (obj_lanino_enemy)
                    talking = false;
                with (obj_elnina_enemy)
                    talking = false;
                ballooncon = 8;
                balloonend = 0;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "... obviously it&was mine anyway,&right?! Pick!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1099_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                with (obj_lanino_enemy)
                    talking = true;
                lanino.head = 2741;
                ballooncon = 9;
                balloonend = 0;
            }
            else if (ballooncon == 9)
            {
                scr_speaker("no_name");
                global.choice = -1;
                global.msc = -99;
                global.choicemsg[0] = stringsetloc("#Rain", "obj_elnina_lanino_controller_slash_Step_0_gml_1052_0");
                global.choicemsg[1] = stringsetloc("#Shine", "obj_elnina_lanino_controller_slash_Step_0_gml_1053_0");
                global.choicemsg[2] = stringset("");
                global.choicemsg[3] = stringset("");
                msgsetloc(0, " \\C2", "obj_elnina_lanino_controller_slash_Step_0_gml_1114_0");
                scr_battletext_default();
                elnina.head = 4212;
                lanino.head = 2741;
                with (obj_lanino_enemy)
                    talking = false;
                with (obj_elnina_enemy)
                    talking = false;
                ballooncon = 10;
                balloonend = 0;
            }
            else if (ballooncon == 10)
            {
                if (global.choice != -1)
                {
                    if (global.choice == 0)
                    {
                        sunboost = -3;
                        lastchosen = "elnina";
                        msgsetloc(0, "... Haha, just&like I thought!&Who wants more&Sun on a desert&level!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1131_0");
                        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                        snd_play(snd_boost);
                        with (obj_elnina_enemy)
                        {
                            talking = true;
                            becomeflash = 15;
                            flashcolor = c_yellow;
                        }
                        with (obj_lanino_enemy)
                            talking = false;
                        elnina.head = 1196;
                        lanino.head = 3264;
                    }
                    if (global.choice == 1)
                    {
                        sunboost = 3;
                        lastchosen = "lanino";
                        msgsetloc(0, "... Rain, rain,&go away...&isn't that how&it goes!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1143_0");
                        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                        snd_play(snd_boost);
                        with (obj_lanino_enemy)
                        {
                            talking = true;
                            becomeflash = 15;
                            flashcolor = c_yellow;
                        }
                        with (obj_elnina_enemy)
                            talking = false;
                        lanino.head = 679;
                        elnina.head = 4435;
                    }
                    global.flag[1017] = global.choice;
                    debug_print("global.flag[1017]=" + string(global.flag[1017]));
                    if (global.flag[1017] == 0)
                        debug_print("Elnina has been favored");
                    else
                        debug_print("Lanino has been favored");
                    ballooncon = 11;
                    balloonend = 0;
                }
            }
            else if (ballooncon == 11)
            {
                with (obj_elnina_enemy)
                    flashcolor = c_white;
                with (obj_lanino_enemy)
                    flashcolor = c_white;
                ballooncon = 0;
                balloonend = 1;
                excon = 1;
            }
            else if (ballooncon == -1 && turns == 5)
            {
                with (obj_elnina_enemy)
                    talking = false;
                with (obj_lanino_enemy)
                    talking = false;
                if (_lanino_favored)
                {
                    msgsetloc(0, "You KNOW this&is extreme, right!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1196_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 871;
                    lanino.head = 3264;
                }
                else
                {
                    msgsetloc(0, "You KNOW this&is extreme, right!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1201_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 4530;
                    elnina.head = 4435;
                }
                ballooncon = 12;
                balloonend = 0;
            }
            else if (ballooncon == 12)
            {
                with (obj_elnina_enemy)
                    talking = false;
                with (obj_lanino_enemy)
                    talking = false;
                if (_lanino_favored)
                {
                    msgsetloc(0, "They said they liked&your attack ONCE!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1215_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                }
                else
                {
                    msgsetloc(0, "They said they liked&your attack ONCE!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1220_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                }
                ballooncon = 13;
                balloonend = 0;
            }
            else if (ballooncon == 13)
            {
                with (obj_elnina_enemy)
                    talking = false;
                with (obj_lanino_enemy)
                    talking = false;
                if (_lanino_favored)
                {
                    msgsetloc(0, "Aren't we partners?&You should be happy&for me, sweetheart!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1234_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 2138;
                }
                else
                {
                    msgsetloc(0, "Aren't we partners?&You should be happy&for me, sweetheart!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1239_0_b");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 1214;
                }
                ballooncon = 14;
                balloonend = 0;
            }
            else if (ballooncon == 14)
            {
                with (obj_elnina_enemy)
                    talking = false;
                with (obj_lanino_enemy)
                    talking = false;
                msgsetloc(0, ".../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1209_0");
                if (_lanino_favored)
                {
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    elnina.head = 4435;
                }
                else
                {
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    lanino.head = 3264;
                }
                ballooncon = 14.5;
                balloonend = 0;
            }
            else if (ballooncon == 14.5)
            {
                tenna.preset = 2;
                tenna.reversal = 1;
                tenna.vspeed = -31;
                tenna.x = camerax() + 230;
                tenna.y = cameray() + 620;
                ballooncon = 15;
                balloonend = 0;
            }
            else if (ballooncon == 15)
            {
                tenna.vspeed = 0;
                snd_play(snd_impact);
                instance_create(x, y, obj_shake);
                msgsetloc(0, "Listen you two!!!&The weather,&always sticks together!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1233_0");
                with (scr_enemyblcon(tenna.x + 56, tenna.y - 170, 10))
                    side = -1;
                ballooncon = 16;
                balloonend = 0;
            }
            else if (ballooncon == 16)
            {
                msgsetloc(0, "Shut up!!!", "obj_elnina_lanino_controller_slash_Step_0_gml_1239_0");
                scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Shut up!!!", "obj_elnina_lanino_controller_slash_Step_0_gml_1241_0");
                scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                with (obj_lanino_enemy)
                    talking = true;
                with (obj_elnina_enemy)
                    talking = true;
                lanino.head = 4530;
                elnina.head = 871;
                ballooncon = 17;
                balloonend = 0;
                tenna.hspeed = -26;
                tenna.vspeed = -18;
                tenna.gravity = 3;
            }
            else if (ballooncon == 17)
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_lanino_enemy)
                    talking = false;
                with (obj_elnina_enemy)
                    talking = false;
                tenna.preset = 7;
                ballooncon = 17.5;
                balloonend = 0;
            }
            else if (ballooncon == 17.5)
            {
                tenna.vspeed = 15;
                ballooncon = 17.6;
                balloonend = 0;
            }
            else if (ballooncon == 17.6)
            {
                if (_lanino_favored)
                {
                    elnina.head = 4435;
                    lanino.head = 1271;
                }
                else
                {
                    elnina.head = 4845;
                    lanino.head = 3264;
                }
                tenna.hspeed = 0;
                tenna.vspeed = 0;
                tenna.gravity = 0;
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == -1 && turns == 6)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "... Y-you really&think ANYONE can&do a RAIN attack.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1289_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    elnina.head = 1214;
                    with (obj_elnina_enemy)
                        talking = true;
                }
                else
                {
                    msgsetloc(0, "Do you... really&think that about&the moon?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1296_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    lanino.head = 2138;
                    with (obj_lanino_enemy)
                        talking = true;
                }
                ballooncon = 18;
                balloonend = 0;
            }
            else if (ballooncon == 18)
            {
                msgsetloc(0, "H-huh? Uh.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1307_0");
                if (_lanino_favored)
                {
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    with (obj_elnina_enemy)
                        talking = false;
                    lanino.head = 4544;
                }
                else
                {
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    with (obj_lanino_enemy)
                        talking = false;
                    elnina.head = 3799;
                }
                ballooncon = 19;
                balloonend = 0;
            }
            else if (ballooncon == 19)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "Fine... I get&it... I'm just&raining on your&parade.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1330_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = false;
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 871;
                }
                else
                {
                    msgsetloc(0, "Well, hope&you like CRYSTALS,&because you made&yourself CLEAR!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1338_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = false;
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 4530;
                }
                ballooncon = 20;
                balloonend = 0;
            }
            else if (ballooncon == 20)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "Goodbye.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1352_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                }
                else
                {
                    msgsetloc(0, "WE'RE THROUGH!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1358_0_b");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                }
                ballooncon = 21;
                balloonend = 0;
            }
            else if (ballooncon == 21)
            {
                with (obj_lanino_enemy)
                    talking = false;
                with (obj_elnina_enemy)
                    talking = false;
                msgsetloc(0, ".../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1370_0");
                if (_lanino_favored)
                {
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    elnina.head = 1214;
                    elnina.hspeed = 8;
                }
                else
                {
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    lanino.head = 2138;
                    lanino.hspeed = 8;
                }
                ballooncon = 22;
                balloonend = 0;
            }
            else if (ballooncon == 22)
            {
                if (_lanino_favored)
                {
                    with (elnina)
                    {
                        scr_monsterdefeat();
                        instance_destroy();
                    }
                }
                else
                {
                    with (lanino)
                    {
                        scr_monsterdefeat();
                        instance_destroy();
                    }
                }
                ballooncon = 22.1;
                balloonend = 0;
            }
            else if (ballooncon == 22.1)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "Who needs a&wet blanket&like her anyway!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1412_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    lanino.head = 679;
                    with (obj_lanino_enemy)
                        talking = true;
                }
                else
                {
                    msgsetloc(0, "Who needs a&dry biscuit&like him anyway!?/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1419_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    elnina.head = 1196;
                    with (obj_elnina_enemy)
                        talking = true;
                }
                ballooncon = 22.2;
                balloonend = 0;
            }
            else if (ballooncon == 22.2)
            {
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == -1 && turns == 7)
            {
                mus_volume(global.batmusic[1], 0, 60);
                msgsetloc(0, "Oh no.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1436_0");
                if (_lanino_favored)
                {
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 3264;
                }
                else
                {
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 4435;
                }
                ballooncon = 23;
                balloonend = 0;
            }
            else if (ballooncon == 23)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "What have I done...&I'm nothing without&her beside me.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1457_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 3264;
                }
                else
                {
                    msgsetloc(0, "What have I done...&it's so dark without&his shine.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1464_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 4435;
                }
                ballooncon = 23.1;
                balloonend = 0;
            }
            else if (ballooncon == 23.1)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "Our oasis&of love.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1475_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                }
                else
                {
                    msgsetloc(0, "Our oasis&of love.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1527_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                }
                ballooncon = 24;
                balloonend = 0;
            }
            else if (ballooncon == 24)
            {
                if (_lanino_favored)
                {
                    msgsetloc(0, "I made it&into a desert.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1494_0");
                    scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
                    with (obj_lanino_enemy)
                        talking = true;
                    lanino.head = 2138;
                }
                else
                {
                    msgsetloc(0, "I froze&it over.../%", "obj_elnina_lanino_controller_slash_Step_0_gml_1501_0");
                    scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
                    with (obj_elnina_enemy)
                        talking = true;
                    elnina.head = 1214;
                }
                ballooncon = 24.5;
                balloonend = 0;
            }
            else if (ballooncon == 24.5)
            {
                with (obj_elnina_enemy)
                    talking = false;
                with (obj_lanino_enemy)
                    talking = false;
                tenna.x = camerax() + 330;
                tenna.y = cameray() - 40;
                tenna.hspeed = 0;
                tenna.gravity = 1;
                tenna.preset = 2;
                ballooncon = 25;
            }
            else if (ballooncon == 25)
            {
                tenna.y = cameray() + 280;
                tenna.vspeed = 0;
                tenna.gravity = 0;
                snd_play(snd_impact);
                instance_create(x, y, obj_shake);
                ilovetvlimit = false;
                msgsetloc(0, "WOW looks like&we are out&of time!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1531_0");
                with (scr_enemyblcon(tenna.x + 56, tenna.y - 140, 10))
                    side = -1;
                ballooncon = 25.5;
                balloonend = 0;
            }
            else if (ballooncon == 25.5 && !i_ex(obj_writer))
            {
                ilovetv_pitch = 1;
                ilovetv_increase = 99;
                digit_flash_duration = 2;
                ballooncon = 26;
                balloonend = 0;
                instance_destroy(obj_ilovetv);
            }
            else if (ballooncon == 26)
            {
                balloonend = 0;
                if (ilovetv == 99)
                {
                    ballooncon = 27;
                }
                else
                {
                    var _cx = camerax() + 320;
                    var _cy = cameray() + 160;
                    var _delay = 3;
                    if ((talktimer % _delay) == 0)
                    {
                        var _right = (talktimer % (_delay * 2)) == 0;
                        var _bx = _cx + (_right ? 150 : -150);
                        var _by = _cy + (sin(talktimer div _delay) * 50);
                        var _balloon = instance_create_depth(_bx, _by, depth, obj_ilovetv);
                        if (_right)
                            _balloon.image_xscale *= -1;
                    }
                    exit;
                }
            }
            else if (ballooncon == 27)
            {
                msgsetloc(0, "Ok battle's over folks&See you later!!!/%", "obj_elnina_lanino_controller_slash_Step_0_gml_1578_0");
                with (scr_enemyblcon(tenna.x + 56, tenna.y - 140, 10))
                    side = -1;
                ilovetv_increase = 0;
                balloonend = 0;
                ballooncon = 28;
            }
            else if (ballooncon == 28)
            {
                battleresult = 1;
                global.flag[9] = 1;
                if (i_ex(lanino))
                    lanino.hspeed = 20;
                if (i_ex(elnina))
                    elnina.hspeed = 20;
                tenna.hspeed = 20;
                ballooncon = 0;
                balloonend = 1;
                scr_wincombat();
            }
            afterbulletcon = 1;
            global.typer = 50;
            if (ralseitalks == 1 && instance_exists(obj_heroralsei))
            {
                global.typer = 74;
                scr_heroblcon("ralsei");
                scr_guardpeek(obj_heroralsei);
            }
            else if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_heroblcon("susie");
                scr_guardpeek(obj_herosusie);
            }
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
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
