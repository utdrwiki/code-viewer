var active = 0;
if (place_meeting(x, y, obj_caterpillarchara))
    active = 1;
else if (place_meeting(x, y, obj_mainchara))
    active = true;
if (room == room_dw_church_darkmaze)
{
    if (i_ex(obj_dw_church_darkmaze.germark))
    {
        if (place_meeting(x, y, obj_dw_church_darkmaze.germark))
            active = true;
    }
}
var alftime = 0.125;
if (instance_exists(obj_dw_church_ripplepuzzle_postgers))
    alftime = 0.5;
if (active)
    image_alpha = lerp(image_alpha, 1, alftime);
else
    image_alpha = lerp(image_alpha, -0.125, 0.05);
