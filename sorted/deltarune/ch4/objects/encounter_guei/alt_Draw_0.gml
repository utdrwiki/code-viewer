with (obj_marker)
{
    if (variable_instance_exists(id, "extflag"))
    {
        if (extflag == "guei")
        {
            draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, image_blend, image_alpha);
            draw_sprite_ext(sprite_index, image_index + 0.5, x + (sin(image_index) * 4), y, 2, 2, image_angle, image_blend, image_alpha * 0.5);
            draw_sprite_ext(sprite_index, image_index + 0.9, x + (sin(image_index) * 8), y, 2, 2, image_angle, image_blend, image_alpha * 0.35);
        }
    }
}
with (chaser)
{
    if (other.con < 2)
    {
        var walk_index = image_index;
        var drawscale = image_yscale;
        var superdrawx = 0;
        var superscalex = 2;
        drawsiner++;
        gpu_set_blendmode(bm_add);
        for (var i = 0; i < 5; i++)
        {
            var aura = (i * 9) + ((drawsiner * 3) % 9);
            var aurax = (aura * 0.75) + (sin(aura / 4) * 4);
            var auray = 45 * scr_ease_in(aura / 45, 1);
            var aurayscale = min(80 / sprite_height, 1);
            draw_sprite_ext(sprite_index, walk_index, x - ((aurax / 180) * sprite_width), y - ((auray / 82) * sprite_height * aurayscale), image_xscale + (aurax / 36), image_yscale + ((auray / 36) * aurayscale), image_angle, c_red, auraalpha * (alpha * (1 - (auray / 45)) * 0.5));
        }
        gpu_set_blendmode(bm_normal);
        var xmult = min((70 / sprite_width) * 4, 4);
        var ymult = min((80 / sprite_height) * 5, 5);
        var ysmult = min((80 / sprite_height) * 0.2, 0.2);
        draw_sprite_ext_centerscale(sprite_index, walk_index, x + (sin(drawsiner / 5) * xmult), y + (cos(drawsiner / 5) * ymult), image_xscale, image_yscale + (sin(drawsiner / 5) * ysmult), image_angle, 255, auraalpha * alpha * 0.2);
        draw_sprite_ext_centerscale(sprite_index, walk_index, x - (sin(drawsiner / 5) * xmult), y - (cos(drawsiner / 5) * ymult), image_xscale, image_yscale - (sin(drawsiner / 5) * ysmult), image_angle, 255, auraalpha * alpha * 0.2);
        scr_draw_outline_ext(sprite_index, walk_index, x, y, image_xscale, image_yscale, image_angle, c_red, auraalpha * alpha * 0.3, 2);
        draw_sprite_ext(sprite_index, walk_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
        mymidx = x + (sprite_width / 2);
        mymidy = y + ((bbox_bottom - y) / 2);
        draw_sprite_ext(spr_guei_chase, image_index, x, y, 2, 2, image_angle, image_blend, alpha);
        draw_sprite_ext(spr_guei_chase, image_index + 0.5, x + (sin(image_index) * 4), y, 2, 2, image_angle, image_blend, alpha * 0.5);
        draw_sprite_ext(spr_guei_chase, image_index + 0.9, x + (sin(image_index) * 8), y, 2, 2, image_angle, image_blend, alpha * 0.35);
    }
    else
    {
        var prog = clamp(other.btimer / 20, 0, 1);
        sprite_index = spr_guei_idle_nowisp;
        draw_sprite_ext(sprite_index, other.siner / 4, x - (60 * (1 - prog)), y - (80 * (1 - prog)), 2, 2, 0, c_white, prog * 4);
    }
    draw_set_color(c_red);
    var _xloc = (x + 16) - 30;
    var _yloc = ((y + 30) - 44) + 12;
    draw_set_color(c_white);
}
