scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 9)
        {
            scr_pathfind_to_point("susie", irandom_range(4, 9) + choose(0, 0, 0, 0, 1), choose(3, 4), 0);
            susie.sleepy = true;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 220)
        {
            timer = 0;
            con = 2;
        }
    }
    if (con == 2 && !instance_exists(obj_gameover_minigame))
    {
        timer++;
        if (timer == 1)
        {
            su_real.sprite_index = su_real.rsprite;
            var sutalk = stringsetloc("Man, it'd be cool to have, like, a weapon.", "obj_b1swordconnector_slash_Step_0_gml_70_0");
            scr_couchtalk(sutalk, "susie", 1, 120);
        }
        if (timer == 120)
        {
            var sutalk = stringsetloc("You could like... cut everything down.", "obj_b1swordconnector_slash_Step_0_gml_45_0");
            scr_couchtalk(sutalk, "susie", 1, 120);
        }
        if (timer == 200)
        {
            scr_resetgameshowcharacter("susie");
            con = 3;
        }
    }
}
else
{
    timer = 0;
    if (con > 1)
        con = 99;
    suwalk = 0;
    suwalktimer = 0;
}
