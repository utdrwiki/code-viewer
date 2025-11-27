if (dodraw == false)
    exit;
for (var i = 0; i < image_xscale; i++)
{
    for (var ii = 0; ii < image_yscale; ii++)
    {
        var xoff = 0;
        var yoff = 0;
        if (con == 2)
        {
            var falamt = abs(y - ystart) / 10;
            if ((ii % 2) == 0)
                falamt = -falamt;
            xoff = (sin(siner + ((i + ii) * con * 80)) * 2) + falamt;
            yoff = sin(siner + ((i + ii) * con * 60)) * 2;
        }
        draw_sprite_ext(sprite_index, 0, x + xoff + (i * 40), y + yoff + (ii * 40), 2, 2, 0, c_white, image_alpha);
    }
}
if (con < 2)
    siner++;
