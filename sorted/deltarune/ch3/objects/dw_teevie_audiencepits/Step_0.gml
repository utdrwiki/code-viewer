if (init == 0)
{
    crowdcheer = snd_loop(snd_crowd_laughter_loop);
    snd_volume(crowdcheer, 0, 0);
    init = 1;
}
var triggered = 0;
with (obj_dw_teevie_cameras_cheer)
{
    if (active)
        triggered = 1;
}
if (con == 0)
{
    var trig = 0;
    with (obj_dw_teevie_cameras)
    {
        if (triggered)
            trig = 1;
    }
    if (trig)
    {
        gray = lerp(gray, 1, 0.125);
        fade = lerp(fade, 0.75, 0.125);
    }
    else
    {
        gray = lerp(gray, 0, 0.125);
        fade = lerp(fade, 0, 0.125);
    }
    var _caught = false;
    with (obj_dw_teevie_stealth_chaselamp)
    {
        if (caught == true)
            _caught = true;
    }
    if (_caught)
    {
        scr_lerpvar("fade", fade, 0, 4);
        scr_lerpvar("gray", gray, 0, 4);
        timer = 0;
        con = 1;
        with (obj_dw_teevie_cameras)
            disable = true;
    }
}
if (con == 1)
{
    var xloc = obj_mainchara.x + 46;
    var sizex = 2;
    if (global.facing == 3)
    {
        xloc = obj_mainchara.x - 8;
        sizex = -2;
    }
    var yloc = obj_mainchara.bbox_bottom - 137;
    timer++;
    if (timer == 15)
    {
        zapper = scr_marker_ext(xloc, cameray() - 120, spr_zapper_jump_noshadow, sizex, 2, 0, 5, undefined, obj_mainchara.depth);
        zapper.gravity = 3;
        scr_limitval_upper(zapper, "y", yloc, 30);
    }
    if (timer >= 15 && zapper.y >= yloc)
    {
        zapper.gravity = 0;
        zapper.vspeed = 0;
        zapper.speed = 0;
        with (zapper)
            scr_lerpvar("image_index", 5, 8, 6, 3, "out");
        snd_play_delay(snd_noise, 2, 0.8, 0.9);
        con = 2;
        timer = 0;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 3)
    {
        scr_speaker("zapper");
        msgsetloc(0, "* Time for youse to skee-daddle!/%", "obj_dw_teevie_audiencepits_slash_Step_0_gml_88_0");
        d_make();
        timer = 0;
        con = 3;
    }
}
if (con == 3 && !d_ex())
{
    if (global.flag[1149] == 0)
    {
        con = 4;
    }
    else
    {
        change = instance_create(x, y, obj_tvturnoff_manager);
        change.kind = 1;
        change.roomtarg = 161;
        con = 999;
    }
}
if (con == 4)
{
    zapper.sprite_index = spr_zapper_jump;
    if (zapper.image_xscale == -2)
    {
        zapper.image_xscale = 2;
        zapper.x -= 134;
    }
    zapper.image_index = 0;
    zapper.depth = -999;
    scr_battle(112, 0, zapper);
    con = 5;
}
with (obj_caterpillarchara)
{
    image_alpha = 1 - other.fade;
    image_blend = merge_color(c_white, c_black, other.gray / 2);
}
if (triggered)
{
    crowdvolume = lerp(crowdvolume, 1, 0.25);
    activechase = true;
}
else
{
    crowdvolume = lerp(crowdvolume, 0, 0.25);
    activechase = false;
}
var forcevol = -1;
if (global.interact != 0)
    forcevol = 0;
snd_volume(crowdcheer, crowdvolume, 0);
if (forcevol != -1)
    snd_volume(crowdcheer, forcevol, 0);
