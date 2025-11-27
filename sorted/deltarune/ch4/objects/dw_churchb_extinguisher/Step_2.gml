if (roomloop)
{
    var xoffset = abs(rightx - leftx);
    var yoffset = abs(righty - lefty);
    if (kris.x > rightx)
    {
        kris.x -= xoffset;
        kris.y += yoffset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
            {
                remx[i] -= xoffset;
                remy[i] += yoffset;
            }
        }
    }
}
if (roomloop2)
{
    var xoffset = abs(rightx2 - leftx2);
    var yoffset = abs(righty2 - lefty2);
    if (kris.x > rightx2)
    {
        kris.x -= xoffset;
        kris.y += yoffset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
            {
                remx[i] -= xoffset;
                remy[i] += yoffset;
            }
        }
    }
}
if (showglass)
{
    for (var i = 0; i < array_length(glass); i++)
    {
        with (glass[i])
        {
            var targalpha = 0.2;
            if (place_meeting(x, y, obj_mainchara) || place_meeting(x, y, obj_caterpillarchara) || place_meeting(x, y, obj_actor))
                targalpha = 0.8;
            image_alpha = lerp(image_alpha, targalpha, 0.125);
        }
    }
}
else
{
    for (var i = 0; i < array_length(glass); i++)
    {
        with (glass[i])
            image_alpha = 0;
    }
}
