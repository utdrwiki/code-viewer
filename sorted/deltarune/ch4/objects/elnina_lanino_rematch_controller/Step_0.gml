if (!i_ex(obj_battlecontroller))
    instance_destroy();
if (!i_ex(obj_elnina_rematch_enemy) || !i_ex(obj_lanino_rematch_enemy))
{
    instance_destroy();
    scr_wincombat();
    exit;
}
var lanino = obj_lanino_rematch_enemy;
var elnina = obj_elnina_rematch_enemy;
if (global.mercymod[lanino.myself] == 100 && global.myfight == 0 && global.mnfight == 0 && endcon == 0)
{
    endcon = 1;
    global.charturn = 3;
}
if (endcon == 1)
{
    endtimer++;
    if (endtimer == 1)
    {
        global.typer = 50;
        msgsetloc(0, "Wow. Again, perfect&chemistry with&that attack.&Just perfect./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_20_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_lanino_rematch_enemy)
            head = 5119;
        with (obj_elnina_rematch_enemy)
            head = 4562;
    }
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Oh, I felt it!&I felt sparks&flying!/%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_34_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        with (obj_lanino_rematch_enemy)
            head = 5119;
        with (obj_elnina_rematch_enemy)
            head = 1907;
        endcon = 2;
        endtimer = 0;
    }
}
if (endcon == 2)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Me too, haha./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_57_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        with (obj_lanino_rematch_enemy)
            head = 735;
        with (obj_elnina_rematch_enemy)
            head = 1066;
        endcon = 2.5;
        endtimer = 0;
    }
}
if (endcon == 2.5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        mus_volume(global.batmusic[1], 0, 60);
        msgsetloc(0, ".../%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_81_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            head = 4562;
        endcon = 3;
        endtimer = 0;
    }
}
if (endcon == 3)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Except for./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_103_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        with (obj_lanino_rematch_enemy)
            head = 2516;
        endcon = 3.5;
        endtimer = 0;
    }
}
if (endcon == 3.5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Except for&that lamp.../%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_125_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 4;
        endtimer = 0;
    }
}
if (endcon == 4)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Yes, that was&really weird.../%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_147_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 4.5;
        endtimer = 0;
    }
}
if (endcon == 4.5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Yeah, I didn't&like that.../%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_169_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 5;
        endtimer = 0;
    }
}
if (endcon == 5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "It did make the&attack stronger./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_191_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 5.5;
        endtimer = 0;
    }
}
if (endcon == 5.5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "It did./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_213_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 6;
        endtimer = 0;
    }
}
if (endcon == 6)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "But it was weird./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_235_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 6.5;
        endtimer = 0;
    }
}
if (endcon == 6.5)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "We didn't like it./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_257_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 7;
        endtimer = 0;
    }
}
if (endcon == 7)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "I think./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_279_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 8;
        endtimer = 0;
    }
}
if (endcon == 8)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "What?/%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_301_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 9;
        endtimer = 0;
    }
}
if (endcon == 9)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "It was bad./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_323_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 10;
        endtimer = 0;
    }
}
if (endcon == 10)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Yeah./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_345_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 11;
        endtimer = 0;
    }
}
if (endcon == 11)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "... probably./%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_367_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 12;
        endtimer = 0;
    }
}
if (endcon == 12)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "What?/%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_389_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 13;
        endtimer = 0;
    }
}
if (endcon == 13)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 50;
        msgsetloc(0, "Battle's over!/%", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_411_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = true;
        endcon = 14;
        endtimer = 0;
    }
}
if (endcon == 14)
{
    endtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = false;
        endcon = 15;
        endtimer = 0;
    }
}
if (endcon == 15)
{
    endtimer++;
    if (endtimer == 1)
    {
        scr_wincombat();
        with (obj_lanino_rematch_enemy)
            event_user(10);
    }
}
if (scr_isphase("menu"))
{
    if (!calculated_forecast)
    {
        forecast_turn = turns;
        var _temp_min = 50;
        var _temp_max = 60;
        var _sprite = spr_weather_hale;
        if (attack_prev == "rain")
            attack_chosen = choose("snow", "sun", "moon");
        if (attack_prev == "snow")
            attack_chosen = choose("rain", "sun", "moon");
        if (attack_prev == "sun")
            attack_chosen = choose("rain", "snow", "moon");
        if (attack_prev == "moon")
            attack_chosen = choose("rain", "snow", "sun");
        attack_prev = attack_chosen;
        if (attack_chosen == "snow" || attack_chosen == "moon")
        {
            _temp_min = 10;
            _temp_max = 30;
        }
        if (attack_chosen == "sun")
        {
            _temp_min = 90;
            _temp_max = 130;
        }
        if (attack_chosen == "rain")
            _sprite = spr_weather_rain;
        if (attack_chosen == "snow")
            _sprite = spr_weather_snow;
        if (attack_chosen == "sun")
            _sprite = spr_weather_sun;
        if (attack_chosen == "moon")
            _sprite = spr_weather_moon;
        if (attack_chosen == "rain")
            global.battlemsg[0] = stringsetloc("* The forecast whispers nothings like sweet droplets.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_476_0");
        if (attack_chosen == "snow")
            global.battlemsg[0] = stringsetloc("* The forecast sparkles with cold beauty.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_477_0");
        if (attack_chosen == "sun")
            global.battlemsg[0] = stringsetloc("* The forecast burns with hot passion.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_478_0");
        if (attack_chosen == "moon")
            global.battlemsg[0] = stringsetloc("* The forecast shines with a soft romantic glow.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_479_0");
        if (global.mercymod[obj_lanino_rematch_enemy.myself] >= 90)
            global.battlemsg[0] = stringsetloc("* Lanino and Elnina are hyping each other up! Just survive!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_481_0");
        forecasts[0] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        forecasts[1] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        forecasts[2] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        calculated_forecast = true;
    }
}
if (scr_isphase("enemytalk") && talked == 0 && endcon == 0)
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
    turns += 1;
    global.typer = 50;
    if (global.mercymod[obj_lanino_rematch_enemy.myself] == 90)
    {
        with (obj_lanino_rematch_enemy)
            head = 4749;
        with (obj_elnina_rematch_enemy)
            head = 2661;
        msgsetloc(0, "So you've caught on&to our forecasts!&Nice work, you&little sunshines!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_518_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "But, winning us over&won't be that easy!&Here comes the rain...!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_521_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = true;
        ballooncon = 0;
        balloonend = 1;
    }
    else if (global.mercymod[obj_lanino_rematch_enemy.myself] == 95)
    {
        with (obj_lanino_rematch_enemy)
            head = 5233;
        with (obj_elnina_rematch_enemy)
            head = 1066;
        msgsetloc(0, "Haha, nice try,&but the weather's &only warming up!&Elnina, tell them &what's next!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_535_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "Wait. Can I just&say... that we are&doing so amazing&right now?", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_538_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = true;
        ballooncon = 2;
        balloonend = 0;
    }
    else
    {
        with (obj_lanino_rematch_enemy)
            head = 5233;
        with (obj_elnina_rematch_enemy)
            head = 1066;
        msgsetloc(0, "Tonight's weather&is...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_552_0_b");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "Tonight's weather&is...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_555_0_b");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            talking = true;
        with (obj_elnina_rematch_enemy)
            talking = true;
        ballooncon = 1;
        balloonend = 0;
    }
    with (obj_lanino_rematch_enemy)
        pose = 1;
    with (obj_elnina_rematch_enemy)
        pose = 1;
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
    if ((button3_p() && talktimer > 15) || (button1_p() && i_ex(obj_writer) && obj_writer.reachedend == 1))
    {
        with (obj_writer)
            instance_destroy();
        alarm[6] = 1;
    }
}
if (talked == 0.6)
{
    talktimer++;
    if (((button3_p() && talktimer > 15) || button1_p()) && talktimer > 15)
    {
        with (obj_writer)
            instance_destroy();
        with (obj_lanino_rematch_enemy)
            talking = false;
        with (obj_elnina_rematch_enemy)
            talking = false;
        if (ballooncon == 1)
        {
            if (attack_chosen == "rain")
            {
                msgsetloc(0, "Drop.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_613_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Moisturous drop.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_616_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "snow")
            {
                msgsetloc(0, "Crystal.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_621_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Shinerous crystal.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_624_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "moon")
            {
                msgsetloc(0, "Moon.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_629_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Glorious moon.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_632_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "sun")
            {
                msgsetloc(0, "Sun.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_637_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Brilliant sun.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_640_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            with (obj_lanino_rematch_enemy)
            {
                talking = true;
                pose = 2;
            }
            with (obj_elnina_rematch_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 2)
        {
            msgsetloc(0, "Oh, Elnina...&You're amazing.&Amazingly cool,&that is.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_655_0");
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "And I love the&romantic music&they have&in this Dojo.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_658_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            with (obj_lanino_rematch_enemy)
                head = 735;
            with (obj_elnina_rematch_enemy)
                head = 555;
            ballooncon = 3;
        }
        else if (ballooncon == 3)
        {
            msgsetloc(0, "Oh, Elnina,&me too! Me too!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_671_0");
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "Anyway, here's&our last attack!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_674_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            with (obj_lanino_rematch_enemy)
                head = 5233;
            with (obj_elnina_rematch_enemy)
                head = 1066;
            ballooncon = 4;
        }
        else if (ballooncon == 4)
        {
            msgsetloc(0, "The Two Celestial&Bodies, The&Perfect Forever&Couple!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_687_0");
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "The Two Celestial&Bodies, The&Perfect Forever&Couple!", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_690_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            with (obj_lanino_rematch_enemy)
                head = 5233;
            with (obj_elnina_rematch_enemy)
                head = 1066;
            with (obj_lanino_rematch_enemy)
            {
                talking = true;
                pose = 2;
            }
            with (obj_elnina_rematch_enemy)
            {
                talking = true;
                pose = 2;
            }
            snd_play(snd_impact);
            ballooncon = 1.1;
        }
        else if (ballooncon == 1.1)
        {
            ballooncon = 0;
            balloonend = 1;
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
if (global.mnfight == 1 && !i_ex(obj_writer))
{
    if (!instance_exists(obj_growtangle))
        instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 180, obj_growtangle);
    if (!instance_exists(obj_moveheart))
        scr_moveheart();
    global.mnfight = 2;
    scr_turntimer(90);
    ballooncon = -1;
    with (obj_lanino_rematch_enemy)
    {
        talking = false;
        pose = 0;
        laughtimer = 0;
    }
    with (obj_elnina_rematch_enemy)
    {
        talking = false;
        pose = 0;
        laughtimer = 0;
    }
}
if (scr_isphase("bullets") && attacked == 0)
{
    rtimer += 1;
    if (rtimer == 12)
    {
        var _a = 1372;
        if (!i_ex(obj_lanino_rematch_enemy))
            _a = 717;
        global.typer = 6;
        global.fc = 0;
        if (global.mercymod[obj_lanino_rematch_enemy.myself] == 90)
        {
            if (!i_ex(obj_elnina_umbrella))
                blocker = instance_create(x, y, obj_elnina_umbrella);
            scr_turntimer(260);
            with (_a)
            {
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 131;
                dc.special = 0;
                dc.difficulty = 0;
            }
        }
        else if (global.mercymod[obj_elnina_rematch_enemy.myself] == 95)
        {
            if (!i_ex(obj_elnina_umbrella))
                blocker = instance_create(x, y, obj_elnina_umbrella);
            scr_turntimer(260);
            with (_a)
            {
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 131;
                dc.special = 0;
                dc.difficulty = 3;
            }
        }
        else if (global.mercymod[obj_elnina_rematch_enemy.myself] == 100)
        {
            scr_turntimer(60);
        }
        else
        {
            scr_turntimer(260);
            with (_a)
            {
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 130;
                dc.special = 0;
                dc.difficulty = 3;
                if (other.attack_chosen == "rain")
                    dc.difficulty = 1;
                if (other.attack_chosen == "snow")
                    dc.difficulty = 2;
                if (other.attack_chosen == "moon")
                    dc.difficulty = 3;
                if (other.attack_chosen == "sun")
                    dc.difficulty = 4;
            }
        }
        attacked = 1;
        talked = 0;
        balloonend = 0;
        ballooncon = -1;
    }
}
if (global.mnfight == 2 && global.turntimer <= 1)
{
    with (obj_bullet_blocker)
        instance_destroy();
    if (global.mercymod[obj_lanino_rematch_enemy.myself] == 100)
    {
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
