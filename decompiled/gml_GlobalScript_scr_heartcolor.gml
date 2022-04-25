scr_heartcolor = function(argument0) //gml_Script_scr_heartcolor
{
    __heartcolor = argument0
    if (__heartcolor == "red" || __heartcolor == 0)
    {
        with (obj_heart)
        {
            color = c_black
            sprite_index = spr_heart
        }
    }
    if (__heartcolor == "yellow" || __heartcolor == 1)
    {
        with (obj_heart)
        {
            color = 0x000001
            sprite_index = spr_yellowheart
        }
        obj_grazebox.sprite_index = spr_grazeappear_yellow
    }
    return;
}

