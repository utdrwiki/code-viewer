var letsrecord = true;
if (con == 0)
{
    timer = -5;
    sans = scr_marker_ext(293, 210, spr_sans, 1, 1, 0, undefined, undefined, 50);
    asgore = scr_marker_ext(240, 204, spr_asgore, 1, 1, 0, undefined, undefined, 5);
    undyne = scr_marker_ext(320, 216, spr_undyne, 1, 1, 0, undefined, undefined, 6);
    bush1 = scr_marker_ext(291, 191, spr_bush1, 1, 1, 0, undefined, undefined, 30);
    bush2 = scr_marker_ext(288, 199, spr_bush2, 1, 1, 0, undefined, undefined, 30);
    var targlayer = "DEBUG_ASSETS";
    layer_set_visible(targlayer, 0);
    var elements = layer_get_all_elements(targlayer);
    for (var i = 0; i < array_length(elements); i++)
    {
        if (layer_get_element_type(elements[i]) == 4)
        {
            var sprite = layer_sprite_get_sprite(elements[i]);
            var xloc = scr_even(layer_sprite_get_x(elements[i]));
            var yloc = scr_even(layer_sprite_get_y(elements[i]));
            var xscale = layer_sprite_get_xscale(elements[i]);
            var yscale = layer_sprite_get_yscale(elements[i]);
            var mark;
            if (sprite == spr_dustcloud5040)
                mark = scr_marker_ext(xloc, yloc, sprite, xscale, yscale, 0, 0, undefined, undefined, 0);
            array_push(cloud, mark);
        }
    }
    con = 1;
}
if (con == 1)
{
    timer++;
    if (timer == -3)
    {
        sans.visible = false;
        asgore.visible = false;
        undyne.visible = true;
        bush1.visible = false;
        bush2.visible = false;
        for (var i = 0; i < array_length(cloud); i++)
            cloud[i].visible = false;
    }
    if (timer == -4)
    {
        if (letsrecord)
        {
            with (obj_time)
                dorecord = 1;
        }
    }
    if (timer == 6)
    {
        var grav = 0.85;
        var vspd = -7;
        with (asgore)
        {
            image_index = 1;
            scr_limitval_upper(id, "y", y);
            gravity = grav;
            vspeed = vspd;
            scr_lerpvar("x", x, 280, 12);
        }
        with (undyne)
        {
            image_index = 1;
            scr_limitval_upper(id, "y", y);
            gravity = grav;
            vspeed = vspd;
            scr_lerpvar("x", x, x - 40, 12);
        }
    }
    if (timer == 19)
    {
    }
    if (timer == 49)
    {
        bush1.visible = false;
        bush2.visible = false;
        with (asgore)
        {
            image_index = 2;
            setxy(261, 204);
            scr_lerpvar("x", x, 229, 6, 2, "out");
            gravity = 0;
            vspeed = 0;
        }
        with (undyne)
        {
            image_index = 2;
            setxy(308, 216);
            scr_lerpvar("x", x, 340, 6, 2, "out");
            gravity = 0;
            vspeed = 0;
        }
        for (var i = 0; i < array_length(cloud); i++)
            cloud[i].visible = false;
    }
    if (timer == 56)
    {
        asgore.image_index = 3;
        undyne.image_index = 3;
    }
    if (timer == 56)
    {
        with (asgore)
            scr_shakeobj_x(12);
        with (undyne)
            scr_shakeobj_x(12);
    }
    if (timer == 61)
    {
        with (sans)
            scr_lerpvar("y", y, 176, 10, 2, "in");
    }
    if (timer == 71)
        sans.image_speed = 2;
    if (timer == 150)
    {
        if (letsrecord)
        {
            with (obj_time)
                dorecord = 2;
        }
        con = 2;
    }
}
siner++;
for (var i = 0; i < array_length(cloud); i++)
{
    var amt = 1.5;
    if ((i % 2) == 0)
        amt = 1;
    cloud[i].x = cloud[i].xstart + (sin((siner + (i * pi)) / amt) * 2);
    cloud[i].y = cloud[i].ystart + (cos((siner + (i * pi)) / amt) * 2);
}
