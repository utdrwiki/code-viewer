if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
buffer--;
if (myinteract == 3)
{
    if (con == 0)
    {
        con = 1;
        kris.controlled = false;
        snd_free_all();
        scr_pathfind_to_point("kris", 5.5, 4, 2);
    }
}
if (con == 1 && scr_board_checklocation("kris", 5.5, 4, 1))
{
    timer++;
    if (timer == 30)
    {
        timer = 0;
        kris.facing = 2;
        if (global.flag[1055] > 0)
            con = 10;
        else
            con = 20;
    }
}
if (con == 10)
{
    snd_play_x(snd_noise, 0.8, 0.5);
    snd_play_x(snd_noise, 0.8, 0.7);
    scr_speaker("no_name");
    msgsetloc(0, "UNLOCKED WITH THE\n\\cIICE KEY\\cW", "obj_board_b2s_icedoor_slash_Step_0_gml_37_0");
    d = bw_make();
    d.skippable = false;
    d.reachedend_draw_triangle = false;
    d.rate = 6;
    d.textsound = snd_silent;
    d.reachedend_sound_play = false;
    d.boardopensound = false;
    d.side = 1;
    global.interact = 1;
    con = 11;
    timer = 0;
}
if (con == 11)
{
    if (i_ex(d.writer))
    {
        if (d.writer.reachedend)
        {
            timer++;
            if (timer >= 30)
            {
                safe_delete(d);
                safe_delete(obj_writer);
                image_index = 1;
                snd_play_x(snd_impact, 0.8, 0.5);
                snd_play_x(snd_impact, 0.6, 0.8);
                timer = 0;
                con = 12;
            }
        }
    }
}
if (con == 12)
{
    timer++;
    if (timer == 1)
    {
        marker = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite, 0, 900000, 640);
        marker.image_blend = c_black;
        marker.image_alpha = 0;
    }
    var count = 5;
    for (var i = 1; i < (count + 1); i++)
    {
        if (timer == (30 + (10 * i)))
        {
            obj_gameshow_swordroute.screencolor = merge_color(#5AAFFF, c_black, i / count);
            marker.image_alpha = i / count;
        }
    }
    if (timer == (30 + (10 * (count + 1))))
    {
        global.swordscreencolor = c_black;
        global.interact = 0;
        room_goto(room_board_dungeon_2);
    }
}
if (con == 20)
{
    timer++;
    if (timer == 15)
    {
        global.flag[1103] = 1;
        depth = 100000;
        drawblue = true;
        obj_gameshow_swordroute.drawui = false;
        obj_gameshow_swordroute.screencolor = #3F48CC;
        snd_play(snd_nes_nocontroller);
        drawtext = 1;
    }
    if (timer == 210)
    {
        con = 21;
        timer = 89;
    }
}
if (con == 21)
{
    timer++;
    if (timer == 90)
    {
        drawtext = false;
        drawblue = false;
        drawblack = true;
        snd_play(snd_noise);
        obj_board_controller.drawcrt = false;
        obj_gameshow_swordroute.screencolor = c_black;
        global.swordscreencolor = c_black;
        global.flag[1007] = 1;
    }
    if (timer == 99)
        global.facing = 0;
    if (timer == 100)
    {
        global.interact = 0;
        global.facing = 0;
        global.entrance = 2;
        room_goto(room_board_sword_intro);
    }
}
