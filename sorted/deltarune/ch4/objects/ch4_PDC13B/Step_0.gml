if (global.plot == 75 && con == 0 && obj_mainchara.y >= 490)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    with (obj_doorAny)
        instance_destroy();
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 2;
    c_wait(30);
    c_pannable(1);
    c_pan(500, cameray(), 60);
    c_sel(kr);
    c_walkdirect_wait(650, 485, 60);
    c_pan(500, 220, 80);
    c_walkdirect_wait(650, 330, 80);
    c_walkdirect_wait(630, 330, 30);
    c_walkdirect(630, 320, 20);
    c_wait(10);
    c_waitcustom();
}
if (con == 2 && customcon == 1)
{
    con = 3;
    alarm[0] = 30;
    c_waitcustom_end();
    instance_create(0, 0, obj_fadeout);
    if (snd_is_playing(global.currentsong[1]))
        mus_volume(global.currentsong[1], 0, 14);
    c_wait(30);
    c_pannable(0);
    c_terminatekillactors();
}
if (con == 4 && !i_ex(obj_cutscene_master))
{
    global.interact = 3;
    global.entrance = (ord(string_upper("L")) - 76) + 1;
    global.plot = 80;
    con = 99;
    snd_free_all();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_lw_noellehouse_bathroom);
}
