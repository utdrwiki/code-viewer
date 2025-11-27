scr_board_populatevars();
scr_gameshow_populatevars();
active = 0;
if (obj_b1cactusfield1.active || obj_b1cactusfield2.active)
    active = 1;
if (active == 1)
{
    if (!i_ex(obj_quizchaser))
    {
        if ((hitcount % 2) == 0)
        {
            if (kris.iframes > 0)
                hitcount++;
        }
        if ((hitcount % 2) != 0)
        {
            if (kris.iframes == 0)
                hitcount++;
        }
    }
    if (hittalk == 0)
    {
        if (hitcount == 1)
        {
            var tetalk = stringsetloc("Ouch! Don't touch the cactuses!", "obj_board_cactusmanager_slash_Step_0_gml_34_0");
            with (obj_actor_tenna)
                bounce = 1;
            scr_couchtalk(tetalk, "tenna", 2);
            hittalk = 1;
        }
    }
    if (hittalk == 1)
    {
        if (hitcount >= 7)
        {
            hittalk = 2;
            timer = 0;
        }
    }
    if (hittalk == 2)
    {
        timer++;
        if (timer == 1)
        {
            var tetalk = stringsetloc("Don't touch the cactuses!", "obj_board_cactusmanager_slash_Step_0_gml_53_0");
            with (obj_actor_tenna)
                bounce = 1;
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 81)
        {
            var tetalk = stringsetloc("They're very fragile and expensive!", "obj_board_cactusmanager_slash_Step_0_gml_59_0");
            with (obj_actor_tenna)
                bounce = 1;
            scr_couchtalk(tetalk, "tenna", 2, 120);
        }
    }
}
else
{
}
