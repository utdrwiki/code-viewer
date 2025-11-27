obj_mike_battle.phase = mike;
with (obj_mike_battle)
{
    switch (phase)
    {
        default:
            sprite_index = spr_mike_small;
            break;
        case 1:
            sprite_index = spr_mike_med;
            break;
        case 2:
            sprite_index = spr_mike_big;
            break;
    }
}
