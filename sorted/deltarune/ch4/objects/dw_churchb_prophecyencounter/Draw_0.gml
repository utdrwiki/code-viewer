var count = 0;
var space = 10;
var border = 8;
var _cx = camerax();
var _cy = cameray();
if (i_ex(bat))
{
    with (bat)
    {
        if (con == 1 || con == 10)
        {
            drawx = 0;
            drawscale = 1;
            if (con == 1)
            {
                if (!variable_instance_exists(id, "auraalph"))
                    auraalph = 0;
                auraalph = lerp(auraalph, 1, 0.1);
            }
            if (!variable_instance_exists(id, "drawsiner"))
                drawsiner = 0;
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
            var dir = image_angle - 90;
            var leng = 48;
            var size = 24;
            d_circle(x + lengthdir_x(leng, dir), y + lengthdir_y(leng, dir), size, 1);
            d_circle(x, y, size * 2, 1);
        }
    }
}
