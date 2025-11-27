if (sprite_index == spr_gerson_idle)
{
    siner += (1/3);
    var hair_x = 0;
    var hair_y = 0;
    var _index = siner % 14;
    if (_index < 1)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 2)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 3)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 4)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 5)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 6)
    {
        hair_x = 18;
        hair_y = 6;
    }
    else if (_index < 7)
    {
        hair_x = 18;
        hair_y = 7;
    }
    else if (_index < 8)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 9)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 10)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 11)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 12)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 13)
    {
        hair_x = 18;
        hair_y = 6;
    }
    else if (_index < 14)
    {
        hair_x = 18;
        hair_y = 7;
    }
    else if (_index < 15)
    {
        hair_x = 18;
        hair_y = 5;
    }
    hairindex += 0.1;
    draw_sprite_ext(spr_gerson_hair, hairindex, x - ((0 + hair_x) * 2), y + ((0 + hair_y) * 2), -2, 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_gerson_idle, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
