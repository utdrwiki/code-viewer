scr_board_populatevars();
scr_gameshow_populatevars();
if (init == 0)
{
    if (global.flag[1055] == 1)
    {
        type = 1;
        layer_set_visible(layer_get_id("BOARD_Tiles_alt"), false);
    }
    else
    {
        type = 2;
        layer_set_visible(layer_get_id("BOARD_Tiles_alt"), true);
        tree1 = instance_create(x + 144, y + 0, obj_board_cactus);
        tree2 = instance_create(x + 64, y + 128, obj_board_tree);
        tree3 = instance_create(x + 224, y + 128, obj_board_tree);
        tree2.sprite_index = spr_board_tree_anim2;
        tree3.sprite_index = spr_board_tree_anim2;
    }
    init = 1;
}
if (active)
{
    if (sndpause == 0 && obj_board_camera.con == 0)
    {
        sndpause = 1;
        snd_pause(global.currentsong[1]);
    }
    if (sndpause == 1 && obj_board_camera.con != 0)
    {
        sndpause = 0;
        snd_free(north);
        snd_resume(global.currentsong[1]);
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visitinit == 0)
            visitinit = 1;
    }
}
else
{
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
}
