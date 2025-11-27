if (scr_debug() && keyboard_check_pressed(ord("R")))
    room_restart();
if (scr_debug() && keyboard_check_pressed(ord("T")))
{
    with (obj_susiezilla_statue)
        hp = maxhp;
}
timer++;
if (started && (timer % 30) == 0)
    global.susie_cleartime_sec++;
if (mode == 5 && timer > 60)
{
    var housecount = 0;
    for (var i = 0; i < instance_number(obj_susiezilla_house_single); i++)
    {
        house[i] = instance_find(obj_susiezilla_house_single, i);
        if (house[i].myhealth > 0)
            housecount++;
    }
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == false)
    {
        if (obj_tenna_zoom.con != 2 && housecount == 0)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -30;
            }
        }
    }
    else
    {
        mode = 6;
        snd_play(snd_error);
    }
}
shake *= 0.85;
if (shake < 0.1)
    shake = 0;
if (perfect_timer > 0)
    perfect_timer--;
if (living_enemies() >= enemy_limit)
{
    if (check_imminent_enemy())
    {
        with (obj_script_delayed)
        {
            if (target == other.id && script == instance_create)
                alarm[0]++;
        }
    }
}
if (!gameover && mode)
{
    with (obj_minigame_quit_ui)
        instance_destroy();
    time_counter++;
    if (time_counter >= 30)
    {
        if (time_counter && mode)
        {
            time_timer = scr_approach(time_timer, 0, 1);
            if (time_timer == 0 && !finished)
            {
                mode = -1;
                with (obj_susiezilla_singlescreen_shadowguy_parent)
                {
                    if (object_index != obj_susiezilla_singlescreen_kickboxin_tenna)
                        instant_defeat();
                }
                with (obj_susiezilla_singlescreen_kickboxin_tenna)
                    give_up();
                with (obj_susiezilla_singlescreen_hazard)
                    bounce_off();
                with (obj_susiezilla_gamecontroller)
                {
                    with (obj_script_delayed)
                    {
                        if (target == other.id)
                            instance_destroy();
                    }
                }
                if (i_ex(obj_tenna_zoom))
                {
                    if (obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
                    {
                        with (obj_tenna_zoom)
                        {
                            con = 2;
                            timer = -30;
                        }
                        if (i_ex(obj_susiezilla_house_timer))
                        {
                            global.inv = -1;
                            obj_susiezilla_house_timer.con = 1;
                        }
                    }
                }
            }
            with (obj_susiezilla_singlescreen_hud_time_counter)
                tick_down(1);
        }
        time_counter = 0;
    }
}
if (gameover && fadeout2 == 1)
{
    with (obj_minigame_quit_ui)
        instance_destroy();
    resolution_counter = scr_approach(resolution_counter, 1, 0.05);
    if (resolution_counter == 1)
        susiezilla_destroy();
}
wave_offset = scr_approach(wave_offset, 0, 1);
if (wave_do == true && mode == 0 && wave_offset == 0)
{
    wave++;
    switch (wave)
    {
        case 1:
            var timeo = 1;
            var makeshoot = 0;
            if (replayversion && !i_ex(obj_tenna_enemy))
                instance_create_depth(x, y, -9999, obj_minigame_quit_ui);
            var tetalk1 = stringsetloc("* Here come the baddies, folks!! Take 'em down!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_167_0");
            scr_tennashouter(tetalk1, 150);
            for (var i = 0; i < 18; i++)
            {
                makeshoot++;
                spawn(choose(-460, 380) + random(80), -50 + random(110), melee, timeo);
                if (makeshoot > 8)
                {
                    makeshoot = 0;
                    spawn(choose(-540, 540) + random(10), -40 + random(130), gun, timeo);
                }
                timeo += clamp(45 - i, 30, 99);
            }
            break;
        case 2:
            var tetalk3 = stringsetloc("* More TV haters!!! Show' em what this house stands for!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_186_0");
            scr_script_delayed(scr_tennashouter, 40, tetalk3, 150);
            spawn(360, 80, gun, 46);
            spawn(400, 0, gun, 54);
            spawn(360, -80, gun, 62);
            spawn(-360, 80, gun, 70);
            spawn(-400, 0, gun, 78);
            spawn(-360, -80, gun, 86);
            break;
        case 3:
            alarm[1] = 85;
            with (obj_susiezilla_statue)
            {
                if ((hp / maxhp) >= 0.95)
                {
                    other.perfect_popularity = true;
                    other.wave_offset = -160;
                    var tetalk5 = stringsetloc("* Bonus round...", "obj_susiezilla_gamecontroller_slash_Step_0_gml_204_0");
                    var tetalk6 = stringsetloc("* Not!!! You dont need it!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_205_0");
                    other.alarm[0] = 105;
                    scr_script_delayed(scr_tennashouter, 55, tetalk5, 45);
                    scr_script_delayed(scr_tennashouter, 99, tetalk6, 125);
                }
                else
                {
                    var tetalk5 = stringsetloc("* Bonus time!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_212_0");
                    var tetalk6 = stringsetloc("* These homes gave me bad ratings! Destroy them to restore my popularity!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_213_0");
                    other.alarm[0] = 295;
                    scr_script_delayed(scr_tennashouter, 40, tetalk5, 45);
                    scr_script_delayed(scr_tennashouter, 84, tetalk6, 120);
                }
            }
            break;
        case 4:
            var tetalk7 = stringsetloc("* Uh oh! A dozer! The front's tough! Smack it from behind!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_221_0");
            scr_script_delayed(scr_tennashouter, 75, tetalk7, 150);
            if (obj_susiezilla_player.x > 640)
            {
                alarm[8] = 20;
                spawn(-480, 0, dozer, 60);
            }
            else
            {
                alarm[9] = 20;
                spawn(480, 0, dozer, 60);
            }
            break;
        case 5:
            var timeo = 1;
            var makeshoot = 0;
            var makered = 0;
            var makedozer = 0;
            var leftsidex = -460;
            var rightsidex = 380;
            var myx = -460;
            spawn(choose(-460, 380) + random(80), -50 + random(110), melee, 4);
            spawn(choose(-460, 380) + random(80), -50 + random(110), melee, 4);
            spawn(choose(-460, 380) + random(80), -50 + random(110), melee, 4);
            for (var i = 0; i < 16; i++)
            {
                makeshoot++;
                makered++;
                makedozer++;
                if (makedozer < 8)
                    myx = -460;
                else
                    myx = 380;
                if (makeshoot < 5 && makered < 7 && makedozer < 14)
                {
                    if (makedozer != 8)
                        spawn(myx + random(80), -50 + random(110), melee, timeo);
                }
                if (makeshoot >= 5)
                {
                    makeshoot = 0;
                    spawn(choose(540) + random(10), -40 + random(130), gun, timeo);
                }
                if (makedozer == 8)
                    spawn(-540, -50, dozer, timeo);
                if (makedozer == 15)
                    spawn(540, 50, dozer, timeo);
                if (makered >= 7)
                    makered = 0;
                timeo += clamp(30 - i, 20, 99);
            }
            break;
        case 6:
            var tetalk9 = stringsetloc("* Oh no! So many Tennas balls! Who is responsible for this madness!?", "obj_susiezilla_gamecontroller_slash_Step_0_gml_290_0");
            scr_script_delayed(scr_tennashouter, 50, tetalk9, 150);
            spawn(360, 80, gun, 46);
            spawn(400, 0, gun, 54);
            spawn(360, -80, gun, 62);
            spawn(-360, 80, gun, 70);
            spawn(-400, 0, gun, 78);
            spawn(-360, -80, gun, 86);
            spawn(460, 80, gun, 196);
            spawn(500, 0, gun, 204);
            spawn(460, -80, gun, 212);
            spawn(-460, 80, gun, 220);
            spawn(-500, 0, gun, 228);
            spawn(-460, -80, gun, 236);
            break;
        case 7:
            alarm[2] = 30;
            with (obj_susiezilla_statue)
            {
                if ((hp / maxhp) >= 0.95)
                {
                    other.perfect_popularity = true;
                    var tetalk10 = stringsetloc("* Mike! Delete those houses!! These guys are too good!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_325_0");
                    other.alarm[0] = 50;
                    scr_script_delayed(scr_tennashouter, 30, tetalk10, 125);
                    other.wave_offset = -120;
                }
                else
                {
                    var tetalk10 = stringsetloc("* Heal up! I think i hear the boss coming...", "obj_susiezilla_gamecontroller_slash_Step_0_gml_332_0");
                    other.alarm[0] = 240;
                    scr_script_delayed(scr_tennashouter, 15, tetalk10, 125);
                }
            }
            break;
        case 8:
            var tetalk11 = stringsetloc("* Oh no!!! In paper mache!!! It's my worst hater!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_339_0");
            scr_tennashouter(tetalk11, 140);
            var tetalk12 = stringsetloc("* He's charging a big shot!!! Hit him to reset the charge!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_342_0");
            scr_script_delayed(scr_tennashouter, 140, tetalk12, 141);
            var tetalk13 = stringsetloc("* Look how small and disgusting his nose is!!! Yuck!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_345_0");
            scr_script_delayed(scr_tennashouter, 280, tetalk13, 141);
            var tetalk14 = stringsetloc("* Kill him!!! Kill him now!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_348_0");
            scr_script_delayed(scr_tennashouter, 420, tetalk14, 141);
            var tetalk15 = stringsetloc("* Show dominance!!! Show dominance now!!! Show it!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_351_0");
            scr_script_delayed(scr_tennashouter, 560, tetalk15, 141);
            var boff = 30;
            alarm[8] = 20;
            spawn(-520, 20, laser, 60 + boff);
            spawn(520, -50, dozer, 150 + boff);
            spawn(520, 50, dozer, 450 + boff);
            spawn(520, -50, dozer, 750 + boff);
            spawn(520, 50, dozer, 950 + boff);
            spawn(520, 0, dozer, 1150 + boff);
            spawn(520, 0, dozer, 1350 + boff);
            spawn(520, 0, dozer, 1550 + boff);
            spawn(520, 35, dozer, 1750 + boff);
            spawn(520, -35, dozer, 1950 + boff);
            spawn(520, 35, dozer, 2150 + boff);
            spawn(520, 35, dozer, 2350 + boff);
            spawn(520, 0, dozer, 2550 + boff);
            var timeo = 110 + boff;
            for (var i = 0; i < 100; i++)
            {
                spawn(-300 + random(90), -50 + random(110), melee, timeo);
                timeo += clamp(25 - i, 40, 99);
            }
            break;
        case 9:
            enemy_limit = 99;
            var tetalk16 = stringsetloc("* Hey, guys? Guys, they won! They won, I said!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_402_0");
            scr_script_delayed(scr_tennashouter, 150, tetalk16, 180);
            var tetalk17 = stringsetloc("* You can stop trying to beat me up now!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_404_0");
            scr_script_delayed(scr_tennashouter, 329, tetalk17, 180);
            var tetalk18 = stringsetloc("* Hey!!! I'm not paying you guys for this!!!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_406_0");
            scr_script_delayed(scr_tennashouter, 508, tetalk18, 180);
            var tetalk19 = stringsetloc("* Paycuts!!! You guys are actually gonna get paycuts!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_408_0");
            scr_script_delayed(scr_tennashouter, 687, tetalk19, 180);
            var tetalk20 = stringsetloc("* Is anybody gonna listen to me?!?!", "obj_susiezilla_gamecontroller_slash_Step_0_gml_410_0");
            scr_script_delayed(scr_tennashouter, 866, tetalk20, 180);
            scr_script_delayed(mus_play_ext, 150, "minigame_kart.ogg", true, 1, 1.2);
            var timeo = 100;
            for (var i = 0; i < (800 - obj_susiezilla_singlescreen_hud_score.my_score); i++)
            {
                timeo += clamp(25 - i, 10, 30);
                spawn(choose(-480, 400) + random(80), -50 + random(110), melee, timeo);
            }
            break;
    }
    wave_do = false;
}
if (wave == 9)
{
    if (rush_modifier == -1)
        rush_modifier = -0.25;
    rush_modifier = scr_approach(rush_modifier, 1, 0.0016666666666666668);
}
var _minigameinsanity = false;
if (i_ex(obj_tenna_zoom))
    _minigameinsanity = obj_tenna_zoom.minigameinsanity;
if (mode == 2 && timer >= 20 && !_minigameinsanity)
{
    var modtimer = 4;
    var spawnamount = 4;
    if (ral_difficulty == 1)
    {
        modtimer = 24;
        spawnamount = 3;
    }
    if (ral_difficulty == 2)
    {
        modtimer = 20;
        spawnamount = 5;
    }
    if (ral_difficulty == 3)
    {
        modtimer = 12;
        spawnamount = 10;
        with (obj_susiezilla_singlescreen_shadowguy)
            nerf = 1;
    }
    if ((timer % modtimer) == 0)
    {
        if (enemy_count < spawnamount)
        {
            spawn((180 + irandom(60)) * choose(-1, 1), irandom_range(-60, 60), ralsei_attacker[ral_count % 18], 16);
            ral_count++;
        }
    }
}
if (mode == 4)
{
    var modtimer = 32;
    var spawnamount = 1;
    if (ral_difficulty == 3)
    {
        mod_timer = 40;
        spawnamount = 2;
    }
    if (timer >= 20)
    {
        if (ral_difficulty >= 2)
        {
            if ((timer % modtimer) == 0)
            {
                if (enemy_count < spawnamount && !i_ex(obj_susiezilla_singlescreen_kickboxin_tenna))
                    spawn((180 + irandom(60)) * choose(-1, 1), irandom_range(-60, 60), 1552, 8);
            }
        }
    }
}
