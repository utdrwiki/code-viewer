animindex += animspeed;
if (drawaura)
{
    specialspritecase = 0;
    drawx = 0;
    fakescale = 2;
    if (facing == 1)
    {
        fakescale = -2;
        drawx = 76;
    }
    drawscale = 1;
    drawsiner += 0.25;
    var remx = x;
    x += drawx;
    superscalexb = 1;
    drawx = 0;
    drawscale = 1;
    xoff = 0;
    if (facing == 1 && specialspritecase == 0)
    {
        drawscale = -1;
        drawx = sprite_width;
    }
    drawsiner += 0.25;
    tempx = x;
    x += drawx;
    superscalex = 0;
    superdrawx = 0;
    superscalexb = 1;
    if (specialspritecase == 0)
    {
        if (facing == 0)
        {
            superscalex = 0;
        }
        else
        {
            superscalex = -4;
            superscalexb = -1;
            superdrawx = -sprite_width * 2;
            xoff = 76;
        }
    }
    gpu_set_blendmode(bm_add);
    for (i = 0; i < 5; i++)
    {
        var aura = (i * 9) + ((drawsiner * 3) % 9);
        var aurax = (aura * 0.75) + (sin(aura / 4) * 4);
        var auray = 45 * scr_ease_in(aura / 45, 1);
        var aurayscale = min(80 / sprite_height, 1);
        draw_sprite_ext(sprite_index, animindex, x - xoff - ((aurax / 180) * drawscale * sprite_width), y - ((auray / 82) * sprite_height * aurayscale), (image_xscale + (aurax / 36)) * drawscale, image_yscale + ((auray / 36) * aurayscale), image_angle, c_red, image_alpha * (1 - (auray / 45)) * 0.5 * auraalph);
    }
    gpu_set_blendmode(bm_normal);
    var xmult = min((70 / sprite_width) * 4, 4);
    var ymult = min((80 / sprite_height) * 5, 5);
    var ysmult = min((80 / sprite_height) * 0.2, 0.2);
    draw_sprite_ext_centerscale(sprite_index, animindex, (x - xoff) + superdrawx + (sin(drawsiner / 5) * xmult), y + (cos(drawsiner / 5) * ymult), image_xscale + superscalex, image_yscale + (sin(drawsiner / 5) * ysmult), image_angle, 255, image_alpha * 0.2 * auraalph);
    draw_sprite_ext_centerscale(sprite_index, animindex, ((x - xoff) + superdrawx) - (sin(drawsiner / 5) * xmult), y - (cos(drawsiner / 5) * ymult), image_xscale + superscalex, image_yscale - (sin(drawsiner / 5) * ysmult), image_angle, 255, image_alpha * 0.2 * auraalph);
    scr_draw_outline_ext(sprite_index, animindex, x - xoff, y, image_xscale * drawscale, image_yscale, image_angle, c_red, image_alpha * 0.3, 2 * auraalph);
    x = tempx;
    mymidx = x + (sprite_width / 2);
    mymidy = y + ((bbox_bottom - y) / 2);
    x = remx;
}
if (con < 2)
{
    if (facing == 0)
    {
        draw_sprite_ext(spr_organik_body, 0, x - 18, y - 14, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(spr_organik_head, animindex, x - 18, y - 14, 2, 2, 0, image_blend, 1);
    }
    else
    {
        draw_sprite_ext(spr_organik_body, 0, x + 94, y - 14, -2, 2, 0, image_blend, 1);
        draw_sprite_ext(spr_organik_head, animindex, x + 94, y - 14, -2, 2, 0, image_blend, 1);
    }
}
if (con == 2)
{
}
if (scr_debug())
{
    var count = 0;
    var space = 10;
    var border = 8;
    var _cx = camerax();
    var _cy = cameray();
    var drawcol = false;
    if (drawcol)
    {
        draw_set_color(c_red);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
        draw_set_color(-1);
        draw_set_color(-255);
        d_circle(x + 40, y + 70 + 20, touchsize, true);
        draw_set_color(-1);
    }
}
