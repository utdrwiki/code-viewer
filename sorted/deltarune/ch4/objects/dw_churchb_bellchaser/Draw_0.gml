draw_self();
if (drawaura)
{
    drawx = 0;
    drawscale = 1;
    if (con == 1 || drawaura)
        auraalph = lerp(auraalph, 1, 0.1);
    drawsiner += 0.25;
    tempx = x;
    x += drawx;
    superscalex = 0;
    superdrawx = 0;
    superscalexb = 1;
    gpu_set_blendmode(bm_add);
    for (var i = 0; i < 5; i++)
    {
        var aura = (i * 9) + ((drawsiner * 3) % 9);
        var aurax = (aura * 0.75) + (sin(aura / 4) * 4);
        var auray = 45 * scr_ease_in(aura / 45, 1);
        var aurayscale = min(80 / sprite_height, 1);
        draw_sprite_ext(sprite_index, image_index, x - ((aurax / 180) * drawscale * sprite_width), y - ((auray / 82) * sprite_height * aurayscale), (image_xscale + (aurax / 36)) * drawscale, image_yscale + ((auray / 36) * aurayscale), image_angle, c_red, image_alpha * (1 - (auray / 45)) * 0.5 * auraalph);
    }
    gpu_set_blendmode(bm_normal);
    var xmult = min((70 / sprite_width) * 4, 4);
    var ymult = min((80 / sprite_height) * 5, 5);
    var ysmult = min((80 / sprite_height) * 0.2, 0.2);
    draw_sprite_ext_centerscale(sprite_index, image_index, x + superdrawx + (sin(drawsiner / 5) * xmult), y + (cos(drawsiner / 5) * ymult), image_xscale + superscalex, image_yscale + (sin(drawsiner / 5) * ysmult), image_angle, 255, image_alpha * 0.2 * auraalph);
    draw_sprite_ext_centerscale(sprite_index, image_index, (x + superdrawx) - (sin(drawsiner / 5) * xmult), y - (cos(drawsiner / 5) * ymult), image_xscale + superscalex, image_yscale - (sin(drawsiner / 5) * ysmult), image_angle, 255, image_alpha * 0.2 * auraalph);
    scr_draw_outline_ext(sprite_index, image_index, x, y, image_xscale * drawscale, image_yscale, image_angle, c_red, image_alpha * 0.3 * auraalph, 2);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * drawscale, image_yscale, image_angle, image_blend, image_alpha);
    x = tempx;
}
var draw_collision = false;
if (draw_collision)
{
    var myx = x + (sprite_width / 2);
    var myy = (y + sprite_height) - 10;
    var size = 48;
    d_circle(myx, myy - size, size, 1);
    var targx = obj_mainchara.bbox_left + ((obj_mainchara.bbox_right - obj_mainchara.bbox_left) / 2);
    var targy = obj_mainchara.bbox_top + ((obj_mainchara.bbox_bottom - obj_mainchara.bbox_top) / 2);
    draw_line(myx, myy, targx, targy);
}
