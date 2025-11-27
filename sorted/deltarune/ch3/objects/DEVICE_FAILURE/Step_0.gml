if (EVENT == 1)
{
    snd_free_all();
    if (global.chapter == 1)
    {
        global.currentsong[0] = snd_init("AUDIO_DRONE.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        global.typer = 667;
        global.fc = 0;
        global.msg[0] = stringsetloc("\\M0 IT APPEARS YOU& HAVE REACHED^6& &    AN END./%", "DEVICE_FAILURE_slash_Step_0_gml_10_0");
        EVENT = 2;
        W = instance_create(70, 80, obj_writer);
        if (global.tempflag[3] >= 1)
        {
            with (obj_writer)
                instance_destroy();
        }
    }
    else if (text_timer > 0)
    {
        text_timer--;
    }
    else
    {
        EVENT = 3;
        alarm[4] = 30;
        global.currentsong[0] = snd_init("AUDIO_DEFEAT.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        var voice = choose(0, 1);
        if (!scr_havechar(2))
            voice = 1;
        else if (!scr_havechar(3))
            voice = 0;
        if (scr_havechar(2) || scr_havechar(3))
        {
            if (voice == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "  Come on^1,&  that all you got!?/", "DEVICE_FAILURE_slash_Step_0_gml_39_0");
                msgnextloc("  Kris^1,&  get up...!/%", "DEVICE_FAILURE_slash_Step_0_gml_40_0");
                global.typer = 61;
                global.fc = 0;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "  This is not&  your fate...!/", "DEVICE_FAILURE_slash_Step_0_gml_47_0");
                msgnextloc("  Please^1,&  don't give up!/%", "DEVICE_FAILURE_slash_Step_0_gml_48_0");
                global.typer = 60;
                global.fc = 0;
            }
            var xx = 50;
            if (global.lang == "ja")
                xx = 44;
            W = instance_create(50, 150, obj_writer);
        }
    }
}
if (EVENT == 0)
    EVENT = 1;
if (EVENT == 2 && !instance_exists(obj_writer))
{
    EVENT = 3;
    alarm[4] = 30;
    global.msg[0] = stringsetloc("\\M0 WILL YOU TRY AGAIN?", "DEVICE_FAILURE_slash_Step_0_gml_28_0");
    if (global.tempflag[3] >= 1)
        global.msg[0] = stringsetloc("\\M0 WILL YOU PERSIST?", "DEVICE_FAILURE_slash_Step_0_gml_32_0");
    if (global.tempflag[3] >= 1)
        alarm[4] = 15;
    W = instance_create(langopt(40, 84), 80, obj_writer);
}
if (EVENT == 4 && !instance_exists(obj_writer))
{
    if (global.chapter == 1)
    {
        choice = instance_create(100, 120, DEVICE_CHOICE);
        EVENT = 5;
    }
    else if (!instance_exists(obj_writer))
    {
        choice = instance_create(100, 120, DEVICE_CHOICE);
        if (global.chapter > 1)
        {
            with (choice)
            {
                NAME[0][0] = stringsetloc("CONTINUE", "DEVICE_FAILURE_slash_Step_0_gml_103_0_b");
                NAME[1][0] = stringsetloc("GIVE UP", "DEVICE_FAILURE_slash_Step_0_gml_104_0");
                NAMEX[0][0] = 80;
                NAMEX[1][0] = 190;
                NAMEY[0][0] = 180;
                NAMEY[1][0] = 180;
                XMAX = 1;
                CURX = -1;
                IDEALX = 190;
                IDEALY = 180;
            }
        }
        EVENT = 5;
    }
}
if (EVENT == 5)
{
    if (global.choice == 0)
    {
        with (obj_writer)
            instance_destroy();
        EVENT = 6;
    }
    if (global.choice == 1)
    {
        with (obj_writer)
            instance_destroy();
        EVENT = 26;
    }
}
if (EVENT == 6)
{
    snd_free_all();
    EVENT = 7;
    alarm[4] = 30;
    if (global.chapter == 1)
    {
        global.flag[6] = 1;
        global.msg[0] = stringsetloc(" THEN, THE FUTURE& IS IN YOUR HANDS.", "DEVICE_FAILURE_slash_Step_0_gml_68_0");
        W = instance_create(50, 80, obj_writer);
        if (global.tempflag[3] >= 1)
        {
            with (obj_writer)
                instance_destroy();
            alarm[4] = 1;
        }
    }
}
if (EVENT == 8)
{
    WHITEFADE = 1;
    FADEUP = 0.01;
    EVENT = 9;
    alarm[4] = 120;
    if (global.tempflag[3] >= 1)
    {
        FADEUP = 0.03;
        alarm[4] = 45;
    }
    else
    {
        snd_play(snd_dtrans_lw);
    }
    global.tempflag[3] += 1;
}
if (EVENT == 10)
{
    scr_windowcaption(stringsetloc("THE DARK", "DEVICE_FAILURE_slash_Step_0_gml_172_0"));
    scr_tempload();
    EVENT = 11;
}
if (EVENT == 26)
{
    snd_free_all();
    if (global.chapter > 1)
    {
        if (i_ex(obj_gameoverbg))
            instance_destroy(obj_gameoverbg);
    }
    global.typer = 667;
    global.msg[0] = stringsetloc("\\M0 THEN THE WORLD^5 & WAS COVERED^5 & IN DARKNESS./%", "DEVICE_FAILURE_slash_Step_0_gml_103_0");
    EVENT = 27;
    W = instance_create(60, 80, obj_writer);
}
if (EVENT == 27 && !instance_exists(obj_writer))
{
    global.currentsong[0] = snd_init("AUDIO_DARKNESS.ogg");
    global.currentsong[1] = mus_play(global.currentsong[0]);
    EVENT = 28;
    DARK_WAIT = 0;
    with (obj_border_controller)
        hide_border();
}
if (EVENT == 28)
{
    DARK_WAIT += 1;
    if (DARK_WAIT >= 2040)
        ossafe_game_end();
    if (!snd_is_playing(global.currentsong[1]))
        ossafe_game_end();
    if (global.is_console)
    {
        if (DARK_WAIT >= 90 && !restart)
        {
            for (var i = 0; i < array_length_1d(gamepad_controls); i++)
            {
                if (gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gamepad_controls[i]))
                {
                    if (gamepad_controls[i] == global.button0 || gamepad_controls[i] == global.button1 || gamepad_controls[i] == global.button2 || gamepad_controls[i] == gp_shoulderlb)
                    {
                        mus_volume(global.currentsong[1], 0, 80);
                        restart = true;
                        break;
                    }
                }
            }
        }
        if (restart)
        {
            restart_timer++;
            if (restart_timer >= 100)
                ossafe_game_end();
        }
    }
}
if (EVENT >= 0 && EVENT <= 4)
{
    if (button2_h())
    {
        with (obj_writer)
        {
            if (pos < (length - 3))
                pos += 2;
            if (specfade <= 0.9)
                specfade -= 0.1;
            if (rate <= 1)
                rate = 1;
        }
    }
}
if (knight_mode)
{
    if (knight_mode_con == 0)
    {
        knight_mode_con = 1;
        global.msg[0] = stringsetloc("\\M0     VERY^6& &  INTERESTING./%", "DEVICE_FAILURE_slash_Step_0_gml_290_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 1 && !i_ex(obj_writer))
    {
        knight_mode_con = 2;
        scr_delay_var("knight_mode_con", 3, 30);
        global.msg[0] = stringsetloc("\\M0 YOUR LOSS HERE^6& &     IS ALL^6& & BUT GUARANTEED./%", "DEVICE_FAILURE_slash_Step_0_gml_300_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 3 && !i_ex(obj_writer))
    {
        knight_mode_con = 4;
        scr_delay_var("knight_mode_con", 5, 30);
        global.msg[0] = stringsetloc("\\M0    AND YET^6& & YOU PERSIST.../%", "DEVICE_FAILURE_slash_Step_0_gml_310_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 5 && !i_ex(obj_writer))
    {
        knight_mode_con = 6;
        scr_delay_var("knight_mode_con", 7, 30);
        global.msg[0] = stringsetloc("\\M0IF YOU ARE SO&DETERMINED&TO TRY ONCE MORE/%", "DEVICE_FAILURE_slash_Step_0_gml_320_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 7 && !i_ex(obj_writer))
    {
        knight_mode_con = 8;
        scr_delay_var("knight_mode_con", 50, 30);
        global.msg[0] = stringsetloc("\\M0      THEN^6& &SHALL WE HASTEN?/%", "DEVICE_FAILURE_slash_Step_0_gml_330_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 20)
    {
        knight_mode_con = 21;
        global.msg[0] = stringsetloc("\\M0  AND SO, YOU&  MEET WITH THE &  SAME FATE./%", "DEVICE_FAILURE_slash_Step_0_gml_341_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 21 && !i_ex(obj_writer))
    {
        knight_mode_con = 50;
        global.msg[0] = stringsetloc("\\M0  SHALL YOU TRY&  ONCE MORE?/%", "DEVICE_FAILURE_slash_Step_0_gml_350_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 30 && !i_ex(obj_writer))
    {
        knight_mode_con = 32;
        global.msg[0] = stringsetloc("\\M0   INCREDIBLE./%", "DEVICE_FAILURE_slash_Step_0_gml_362_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 32 && !i_ex(obj_writer))
    {
        knight_mode_con = 33;
        global.msg[0] = stringsetloc("\\M0 I FELT IT THERE^6& &    SHINING./%", "DEVICE_FAILURE_slash_Step_0_gml_371_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 33 && !i_ex(obj_writer))
    {
        knight_mode_con = 34;
        global.msg[0] = stringsetloc("\\M0   YOUR POWER./%", "DEVICE_FAILURE_slash_Step_0_gml_380_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 34 && !i_ex(obj_writer))
    {
        knight_mode_con = 50;
        global.msg[0] = stringsetloc("\\M0A LITTLE FURTHER./%", "DEVICE_FAILURE_slash_Step_0_gml_389_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 40 && !i_ex(obj_writer))
    {
        knight_mode_con = 41;
        global.msg[0] = stringsetloc("\\M0     VERY^6& &  INTERESTING./%", "DEVICE_FAILURE_slash_Step_0_gml_400_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 41 && !i_ex(obj_writer))
    {
        knight_mode_con = 42;
        global.msg[0] = stringsetloc("\\M0  YOU ARE MISSING&  SOMETHING&  IMPORTANT./%", "DEVICE_FAILURE_slash_Step_0_gml_409_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 42 && !i_ex(obj_writer))
    {
        knight_mode_con = 43;
        global.msg[0] = stringsetloc("\\M0  YOU WON'T WIN&  LIKE THIS./%", "DEVICE_FAILURE_slash_Step_0_gml_418_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 43 && !i_ex(obj_writer))
    {
        knight_mode_con = 50;
        global.msg[0] = stringsetloc("\\M0  STILL...&  WILL YOU&  PERSIST?/%", "DEVICE_FAILURE_slash_Step_0_gml_427_0");
        var _writer = instance_create(70, 80, obj_writer);
    }
    if (knight_mode_con == 50 && !i_ex(obj_writer))
    {
        knight_mode_con = 51;
        scr_delay_var("knight_mode_con", 52, 30);
        scr_lerp_var_instance(heart_marker, "image_alpha", 1, 0, 15);
        var _choice = instance_create(100, 120, DEVICE_CHOICE);
        with (_choice)
        {
            NAME[0][0] = string_hash_to_newline(stringsetloc("GO BACK#(FIGHT AGAIN)", "DEVICE_FAILURE_slash_Step_0_gml_406_0"));
            NAME[1][0] = string_hash_to_newline(stringsetloc("GO FORWARD#(MOVE ON)", "DEVICE_FAILURE_slash_Step_0_gml_407_0"));
            NAMEX[0][0] = 70;
            NAMEX[1][0] = 190;
            NAMEY[0][0] = 180;
            NAMEY[1][0] = 180;
            XMAX = 1;
            CURX = -1;
            IDEALX = 190;
            IDEALY = 180;
            fadebuffer = 20;
            scr_lerpvar("choice_y_offset", 20, 0, 20);
        }
    }
    if (knight_mode_con == 52 && !i_ex(obj_writer))
    {
        global.flag[6] = 0;
        if (global.choice == 0)
        {
            knight_mode_con = 53;
            with (obj_writer)
                instance_destroy();
        }
        if (global.choice == 1)
        {
            knight_mode_con = 55;
            with (obj_writer)
                instance_destroy();
        }
    }
    if (knight_mode_con == 53 && !i_ex(obj_writer))
    {
        knight_mode_con = 54;
        scr_delay_var("knight_mode_con", 60, 30);
        snd_free_all();
        var fade_out = scr_fadeout(30);
        with (fade_out)
            image_blend = c_white;
        global.darkzone = 1;
        global.plot = 320;
        global.interact = 0;
        global.tempflag[90] = 4;
        if (!scr_havechar(2))
            scr_getchar(2);
        if (!scr_havechar(3))
            scr_getchar(3);
        for (var i = 0; i < 4; i++)
            global.hp[i] = global.maxhp[i];
        if (variable_global_exists("knight_battle_items"))
        {
            for (var i = 0; i < array_length(global.knight_battle_items); i++)
                global.item[i] = global.knight_battle_items[i];
            global.knight_battle_items = [];
        }
    }
    if (knight_mode_con == 55 && !i_ex(obj_writer))
    {
        knight_mode_con = 56;
        scr_delay_var("knight_mode_con", 60, 30);
        scr_fadeout(30);
        global.darkzone = 1;
        global.plot = 320;
        global.interact = 0;
        global.tempflag[90] = 1;
        snd_free_all();
        scr_flag_set(1047, 2);
        if (!scr_havechar(2))
            scr_getchar(2);
        if (!scr_havechar(3))
            scr_getchar(3);
        global.hp[0] = 1;
        global.hp[1] = 1;
        global.hp[2] = 1;
        global.hp[3] = 1;
    }
    if (knight_mode_con == 60)
        room_goto(room_dw_snow_zone);
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}
