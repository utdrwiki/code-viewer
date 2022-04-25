scr_unmarkify_caterpillar_ch1 = function() //gml_Script_scr_unmarkify_caterpillar_ch1
{
    for (i = 0; i < 2; i += 1)
    {
        if instance_exists(global.cinstance[i])
        {
            if (global.char[(i + 1)] == 2)
            {
                if (global.cinstance[i].x != s.x || global.cinstance[i].y != s.x)
                {
                    global.cinstance[i].x = s.x
                    global.cinstance[i].y = (s.y + 10)
                    with (global.cinstance[i])
                        scr_caterpillar_interpolate_ch1()
                    global.cinstance[i].y -= 10
                }
                with (global.cinstance[i])
                {
                    if (global.facing == 0)
                        sprite_index = dsprite
                    if (global.facing == 1)
                        sprite_index = rsprite
                    if (global.facing == 2)
                        sprite_index = usprite
                    if (global.facing == 3)
                        sprite_index = lsprite
                    visible = true
                }
                with (s)
                    instance_destroy()
            }
            if (global.char[(i + 1)] == 3)
            {
                if (global.cinstance[i].x != r.x || global.cinstance[i].y != r.x)
                {
                    global.cinstance[i].x = r.x
                    global.cinstance[i].y = (r.y + 10)
                    with (global.cinstance[i])
                        scr_caterpillar_interpolate_ch1()
                    global.cinstance[i].y -= 10
                }
                with (global.cinstance[i])
                {
                    if (global.facing == 0)
                        sprite_index = dsprite
                    if (global.facing == 1)
                        sprite_index = rsprite
                    if (global.facing == 2)
                        sprite_index = usprite
                    if (global.facing == 3)
                        sprite_index = lsprite
                    visible = true
                }
                with (r)
                    instance_destroy()
            }
        }
    }
    return;
}

