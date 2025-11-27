if (!checked)
{
    checked = true;
    if (sprite_index == spr_ghost_house_bullet)
    {
        if (type == 0)
            sprite_index = spr_ghost_house_pumpkin_horizontal;
        else
            sprite_index = spr_ghost_house_pumpkin_vertical;
        image_index = 2;
    }
}
