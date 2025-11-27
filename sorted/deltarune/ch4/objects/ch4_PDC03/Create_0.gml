con = -1;
customcon = 0;
if (global.plot >= 280)
{
    instance_destroy();
    exit;
}
everybody_stand = false;
everybody_sit = false;
song_start = false;
speech_start = false;
speech_stop = false;
npc_setup = false;
good_place = false;
debug_darkcandy = false;
shyren_move = true;
shyren_siner = 0;
susie_laugh = false;
mkid_turn = false;
mkid_turn_con = 0;
mkid_turn_timer = 0;
random_shake = false;
shake_timer = 0;
create_susie_npc = false;
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("church_lw.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
}
if (global.plot < 25)
{
    pews[0] = scr_marker(360, 284, spr_alphysu);
    pews[1] = scr_marker(450, 198, spr_rudy_back_arms_down);
    pews[2] = scr_marker(305, 207, spr_catty_back);
    pews[3] = scr_marker(352, 191, spr_catty_mom_back);
    pews[4] = scr_marker(500, 324, spr_snowy_ut);
    pews[5] = scr_marker(450, 324, spr_mkid_ut);
    pews[6] = scr_marker(328, 199, spr_jockington_ut);
    pews[7] = scr_marker(315, 320, spr_bratty_back);
    pews[8] = scr_marker(460, 239, spr_rgdragon_back);
    pews[9] = scr_marker(500, 239, spr_rgbun_back);
    pews[10] = scr_marker(315, 244, spr_nicecream_back);
    noelle_marker = scr_marker(448, 140, spr_noelle_church);
    toriel_marker = scr_marker(300, 140, spr_toriel_walk_down_church);
    snowydad_marker = scr_marker(387, 144, spr_snowy_dad_choir);
    cattydad_marker = scr_marker(350, 135, spr_catty_dad_church);
    shyren_marker = scr_marker(422, 155, spr_shyren_choir);
    shyren_marker.image_index = 1;
    alvin_marker = scr_marker(485, 114, spr_npc_alvin);
    catty_marker = scr_marker(483, 120, spr_npc_catty);
    catty_marker.visible = 0;
    with (obj_marker)
        scr_depth();
    bowl_marker = scr_marker(351, 473, spr_church_punch_bowl);
    bowl_marker.depth = 90000;
    bowl_marker.visible = 0;
    susie_marker = scr_marker(351, 444, spr_susie_church_punch_bowl);
    susie_marker.visible = 0;
    susie_marker.depth = bowl_marker.depth - 10;
}
if (global.plot >= 20 && global.plot < 25)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    with (obj_mainchara)
        visible = 0;
    with (obj_caterpillarchara)
        visible = 0;
    if (scr_debug() && debug_darkcandy)
        scr_itemget(1);
}
else
{
    instance_destroy();
}

answer_choice = function(arg0, arg1)
{
    switch (arg0)
    {
        case 1422:
            scr_flag_set(1533, arg1 + 1);
            if (arg1 == 0)
                con = 10;
            else if (arg1 == 1)
                con = 20;
            break;
        case 1247:
            scr_flag_set(1534, arg1 + 1);
            if (arg1 == 0)
                con = 30;
            else if (arg1 == 1)
                con = 40;
            break;
        case 1249:
            if (arg1 == 0)
                con = 50;
            else if (arg1 == 1)
                con = 60;
            break;
    }
};
