hp--;
hittimer = 5;
if (hp <= 0)
{
    scr_afterimage_grow();
    instance_destroy();
    if (obj_tenna_enemy.minigamecount >= 6)
    {
        if (obj_tenna_minigame_ui.myscore < 30)
            scr_tenna_add_score(2);
        else
            scr_tenna_add_score(1);
    }
    else if (obj_tenna_minigame_ui.myscore < 70)
    {
        scr_tenna_add_score(2);
    }
    else
    {
        scr_tenna_add_score(1);
    }
}
