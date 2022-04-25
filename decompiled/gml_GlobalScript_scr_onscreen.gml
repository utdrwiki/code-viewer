scr_onscreen = function(argument0) //gml_Script_scr_onscreen
{
    obj = argument0
    spacer = 0
    if (((obj.x + obj.sprite_width) + spacer) < camerax() || (obj.x - spacer) > (camerax() + 640) || ((obj.y + obj.sprite_height) + spacer) < cameray() || (obj.y - spacer) > (cameray() + 480))
        return 0;
    else
        return 1;
}

