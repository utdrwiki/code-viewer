event_inherited();
timer++;
if ((timer % 4) == 0)
    grazed = false;
tilt += 0.2;
image_angle = sin(tilt) * 18;
if (timer == 201)
{
    with (obj_regularbullet)
    {
        if (sprite_index == spr_lanino_moon)
            active = false;
    }
}
