if (!i_ex(obj_battlecontroller))
    instance_destroy();
if (!i_ex(obj_elnina_rematch_enemy) && !i_ex(obj_lanino_rematch_enemy))
{
    endtimer++;
    if (endtimer == 30)
        scr_wincombat();
    exit;
}
if (scr_isphase("menu"))
{
    if (!calculated_forecast)
    {
        forecast_turn = turns;
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
        var _temp_min = 50;
        var _temp_max = 60;
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
        forecasts[0] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        forecasts[1] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        forecasts[2] = [irandom_range(_temp_min, _temp_max), _sprite, _sprite];
        calculated_forecast = true;
        debug_message("did forecast");
    }
}
var lanino = obj_lanino_rematch_enemy;
var elnina = obj_elnina_rematch_enemy;
if (scr_isphase("enemytalk") && talked == 0 && !i_ex(obj_rouxls_ch3_enemy))
{
    if (phase < 3)
    {
        with (obj_lanino_rematch_enemy)
            head = 1271;
        with (obj_elnina_rematch_enemy)
            head = 4845;
    }
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
    if (phase == 3)
    {
        msgsetloc(0, "...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_96_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_99_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
            pose = 1;
        with (obj_elnina_rematch_enemy)
            pose = 1;
        ballooncon = 1;
        balloonend = 0;
    }
    else
    {
        msgsetloc(0, "Tonight's weather&is...", "obj_elnina_lanino_controller_slash_Step_0_gml_245_0");
        scr_enemyblcon(lanino.x - 10, global.monstery[lanino.myself] - 10, 10);
        msgsetloc(0, "Tonight's weather&is...", "obj_elnina_lanino_controller_slash_Step_0_gml_248_0");
        scr_enemyblcon(elnina.x - 10, global.monstery[elnina.myself] - 10, 10);
        with (obj_lanino_rematch_enemy)
        {
            talking = true;
            pose = 1;
        }
        with (obj_elnina_rematch_enemy)
        {
            talking = true;
            pose = 1;
        }
        ballooncon = 1;
        balloonend = 0;
    }
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
        talked = 0.7;
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
    if (((button3_p() && talktimer > 15) || button1_p()) && talktimer > 15)
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
        if (phase == 3 && ballooncon == 1)
        {
            msgsetloc(0, "...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_166_0");
            scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
            msgsetloc(0, "...", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_169_0");
            scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
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
        else if (ballooncon == 1)
        {
            if (attack_chosen == "rain")
            {
                msgsetloc(0, "Drop.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_182_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Moisturous drop.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_185_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "snow")
            {
                msgsetloc(0, "Crystal.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_190_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Shinerous crystal.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_193_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "moon")
            {
                msgsetloc(0, "Moon.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_198_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Glorious moon.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_201_0");
                scr_enemyblcon(elnina.x - 40, global.monstery[elnina.myself] - 10, 10);
            }
            if (attack_chosen == "sun")
            {
                msgsetloc(0, "Sun.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_206_0");
                scr_enemyblcon(lanino.x - 40, global.monstery[lanino.myself] - 10, 10);
                msgsetloc(0, "Brilliant sun.", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_209_0");
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
        var _a = 993;
        if (!i_ex(obj_lanino_rematch_enemy))
            _a = 1591;
        if (global.mercymod[obj_lanino_rematch_enemy.myself] == 90 && i_ex(obj_elnina_umbrella))
        {
            scr_turntimer(260);
            with (_a)
            {
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 141;
                dc.special = 0;
                dc.difficulty = 0;
            }
        }
        else if (global.mercymod[obj_elnina_rematch_enemy.myself] == 95 && i_ex(obj_elnina_umbrella))
        {
            scr_turntimer(260);
            with (_a)
            {
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 141;
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
        global.typer = 6;
        global.fc = 0;
        global.battlemsg[0] = stringsetloc("* lol", "obj_elnina_lanino_rematch_controller_slash_Step_0_gml_319_0");
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
        obj_elnina_rematch_enemy.head = 4435;
        obj_lanino_rematch_enemy.head = 3264;
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
