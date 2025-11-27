if (con == 10)
{
    mus_volume(global.currentsong[1], 0, 30);
    if (instance_exists(obj_mainchara))
    {
        obj_mainchara.visible = 0;
        kr_actor = instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_actor);
        kr_actor.sprite_index = obj_mainchara.sprite_index;
        kr_actor.__x = kris_x + 6;
        kr_actor.__y = kris_y + 20;
        kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_actor.__x, kr_actor.__y, 4);
        var walktime = kr_walktime;
        with (kr_actor)
        {
            scr_set_facing_sprites("kris");
            fun = 1;
            image_speed = 0.25;
            scr_move_to_point_over_time(__x, __y, walktime);
        }
    }
    contimer = 0;
    con = 11;
}
if (con == 11)
{
    contimer++;
    if (contimer >= (kr_walktime + 4))
    {
        con = 1;
        with (obj_actor)
        {
            if (name == "kris")
                visible = 0;
        }
        with (obj_dw_leave_ch4)
        {
            if (bottom == 1)
                draw_kris = 1;
        }
        with (obj_dw_leave_ch4)
        {
            if (bottom == 1)
                con = 15;
            else
                con = 1;
        }
    }
}
