if (sprite_index == spr_chefs_plus2 && i_ex(obj_chefs_scoretxt))
{
    with (obj_chefs_scoretxt)
    {
        if (red)
        {
            with (other)
                instance_destroy();
        }
    }
}
