scr_caterpillar_facing_single = function(argument0, argument1) //gml_Script_scr_caterpillar_facing_single
{
    with (obj_caterpillarchara)
    {
        if (name == argument0)
        {
            for (i = 0; i < 25; i += 1)
                facing[i] = scr_facing_letter_to_number(argument1)
        }
    }
    return;
}

