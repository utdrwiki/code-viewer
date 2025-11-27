x = window.x;
y = window.y;
timer++;
if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.con > 1) || obj_shootout_controller.invtimer > 0)
{
    if (timer == duration)
        instance_destroy();
}
else if (timer == duration)
{
    with (obj_shootout_big_tenna)
        firefx = 2;
    with (obj_shootout_big_tenna)
        scr_shakeobj();
    with (window)
        shaketimer = 10;
    snd_play(snd_bomb);
    if (window.krspopout == true)
    {
        snd_play(snd_hurt1);
        scr_shakescreen();
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
        if (obj_tenna_enemy.minigamefailcount == 3 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -1;
            }
        }
        with (obj_shootout_controller)
            invtimer = 20;
        var _inst = instance_place(x, y, obj_shootout_hazard);
        with (_inst)
            instance_destroy();
    }
    else
    {
        obj_shootout_controller.shootoutpointvar++;
        if (obj_shootout_controller.shootoutpointvar == 1)
            scr_tenna_add_score(2);
        if (obj_shootout_controller.shootoutpointvar == 2)
            scr_tenna_add_score(1);
        if (obj_shootout_controller.shootoutpointvar == 3)
            scr_tenna_add_score(1);
        if (obj_shootout_controller.shootoutpointvar == 3)
            obj_shootout_controller.shootoutpointvar = 0;
    }
    instance_destroy();
}
draw_sprite(spr_shootout_reticle2, image_index, x, y);
