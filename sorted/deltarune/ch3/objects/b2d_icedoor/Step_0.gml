if (active)
{
    if (actinit == 0)
    {
        snd_pause(global.currentsong[1]);
        actinit = 1;
        kris.cantleave = true;
    }
}
if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (deer == 0)
{
    with (obj_board_enemy_deer)
        other.deer = id;
}
buffer--;
if (myinteract == 3)
{
    if (con == 0)
    {
        con = 1;
        kris.controlled = false;
        snd_free_all();
        scr_pathfind_to_point("kris", 5.5, 3, 2);
        deer.follow = 0;
        with (deer)
        {
            sprite_index = spr_board_deer_upsprite;
            var deerx = board_tilex(5.5);
            var deery = board_tiley(4);
            var movetime = max(1, round(point_distance(x, y, deerx, deery) / 4));
            scr_lerpvar("x", x, deerx, movetime);
            scr_lerpvar("y", y, deery, movetime);
        }
    }
}
if (con == 1 && scr_board_checklocation("kris", 5.5, 3, 1))
{
    timer++;
    if (timer == 15)
    {
        scr_speaker("no_name");
        msgsetloc(0, "THE DOOR IS LOCKED", "obj_b2d_icedoor_slash_Step_0_gml_46_0");
        d = bw_make();
        d.skippable = false;
        d.reachedend_draw_triangle = false;
        d.rate = 3;
        d.reachedend_sound_play = false;
        d.boardopensound = false;
        d.side = 1;
        global.interact = 1;
        con = 2;
        timer = 0;
    }
}
if (con == 2)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.reachedend)
            timer++;
    }
    if (timer >= 60)
    {
        safe_delete(obj_writer);
        scr_speaker("no_name");
        msgsetloc(0, "THE \\cIICE KEY\\cW WAS USED UP", "obj_b2d_icedoor_slash_Step_0_gml_71_0");
        d = bw_make();
        d.skip = true;
        d.skippable = false;
        d.reachedend_draw_triangle = false;
        d.rate = 3;
        d.reachedend_sound_play = false;
        d.boardopensound = false;
        d.side = 1;
        global.interact = 1;
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.reachedend)
            timer++;
    }
    if (timer == 15)
    {
        global.flag[1055] = 2;
        snd_play_x(snd_board_kill_ominous, 0.5, 0.5);
        snd_play_x(snd_board_torch, 0.8, 1.2);
    }
    if (timer >= 60)
    {
        safe_delete(obj_writer);
        scr_speaker("no_name");
        msgsetloc(0, "SHE WAS USED UP", "obj_b2d_icedoor_slash_Step_0_gml_105_0");
        d = bw_make();
        d.skip = true;
        d.skippable = false;
        d.reachedend_draw_triangle = false;
        d.rate = 3;
        d.reachedend_sound_play = false;
        d.boardopensound = false;
        d.side = 1;
        global.interact = 1;
        con = 4;
        timer = 0;
    }
}
if (con == 4)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.reachedend)
            timer++;
    }
    if (timer == 15)
    {
        snd_play_x(snd_board_kill_ominous, 0.5, 0.5);
        snd_play_x(snd_board_torch, 0.8, 1.2);
        with (obj_board_enemy_deer)
            instance_destroy();
    }
    if (timer >= 60)
    {
        safe_delete(obj_board_writer);
        safe_delete(obj_writer);
        image_index = 1;
        snd_play_x(snd_board_torch_low, 1, 0.7);
        snd_play_x(snd_board_door_close, 0.8, 0.7);
        snd_play_x(snd_board_door_close, 0.5, 0.4);
        timer = 0;
        con = 5;
        kris.controlled = true;
        global.interact = 0;
        safe_delete(mysolid);
    }
}
