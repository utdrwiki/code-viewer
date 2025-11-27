if (view_current == 0)
{
    if (open == 1)
    {
        opentimer++;
        if (opentimer == 1)
        {
            snd_play_x(snd_tvturnoff, 1, 0.5);
            snd_play_x(snd_tvturnoff, 1, 0.25);
            snd_play_x(snd_tvturnoff, 1, 0.2);
            scr_lerpvar("unlockindex", 0, 10, 20);
        }
        if (opentimer == 25)
            scr_lerpvar("fade", 1, 0, 8);
        if (opentimer == 32)
        {
            for (var i = 0; i < 3; i++)
                snd_play_delay(snd_board_blockpush, i, 1, 0.5 + (i / 3));
        }
        if (opentimer == 33)
        {
            snd_play_x(snd_dooropen, 1, 0.5);
            snd_play_x(snd_dooropen, 0.8, 0.4);
            snd_play_x(snd_dooropen, 0.7, 0.3);
            scr_lerpvar("openindex", 0, 5, 10);
        }
        if (opentimer == 43)
        {
            global.interact = 0;
            instance_destroy();
        }
    }
    draw_sprite_ext(spr_dw_puzzlecloset_door_open, openindex, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_puzzlecloset_door_unlock, unlockindex, x, y, 2, 2, 0, c_white, fade);
}
