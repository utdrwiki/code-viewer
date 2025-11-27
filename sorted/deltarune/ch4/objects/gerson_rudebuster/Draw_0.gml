if (susieattackcon == 2)
{
    var scale = 1;
    if (susieattacktimer == 7)
        scale = 1.2;
    if (susieattacktimer == 8)
        scale = 0.8;
    if (susieattacktimer == 9)
        scale = 0.6;
    if (susieattacktimer == 10)
        scale = 0.5;
    if (susieattacktimer > 3)
        draw_sprite_ext(spr_gerson_rude_orb2, 0, (obj_heroparent.x + 200) - 38, (obj_heroparent.y + 37) - 10, 0.6 * scale, 0.9 * scale, image_angle - (susieattacktimer * 80), image_blend, image_alpha);
    if (susieattacktimer < 7)
    {
        var px = (obj_heroparent.x + 200) - 36;
        var py = (obj_heroparent.y + 37) - 10;
        repeat (4)
        {
            var randdir = irandom(360);
            var dist = 40 + irandom(180);
            var randsizex = 0.35 + random(0.85);
            var randsizey = 0.45 + random(0.55);
            with (instance_create(px + lengthdir_x(dist, randdir), py + lengthdir_y(dist, randdir), obj_particle_generic))
            {
                image_xscale = randsizex;
                image_yscale = randsizey;
                direction = point_direction(x, y, px, py);
                image_angle = direction;
                scr_lerpvar("speed", 30, 60 + irandom(8), 6, 1, "in");
                scr_lerpvar("image_xscale", image_xscale * 16, 0, 6, 1, "in");
                scr_lerpvar("image_yscale", image_yscale, image_xscale * 0.5, 6, 1, "in");
            }
        }
        with (obj_particle_generic)
        {
            if (point_distance(x, y, px, py) <= 60)
                instance_destroy();
        }
    }
    exit;
}
draw_self();
if (susieattackcon == 0 && x < (camerax() + 330))
{
    textcolortimer += 0.1;
    textcolor = merge_color(c_white, c_red, 0.5 + (sin(textcolortimer) / 2));
    draw_set_alpha(0.5);
    ossafe_fill_rectangle(obj_herosusie.x + 86, obj_herosusie.y + 33, obj_herosusie.x + 90 + 70, obj_herosusie.y + 30 + 30, false);
    draw_set_alpha(1);
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        draw_text_color(obj_herosusie.x + 90, obj_herosusie.y + 30, stringsetloc("PRESS", "obj_gerson_rudebuster_slash_Draw_0_gml_57_0"), textcolor, textcolor, textcolor, textcolor, 1);
        draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, obj_herosusie.x + 168, obj_herosusie.y + 33, 2, 2, 0, c_white, 1);
    }
    else
    {
        draw_text_color(obj_herosusie.x + 90, obj_herosusie.y + 30, stringsetloc("PRESS Z", "obj_gerson_rudebuster_slash_Draw_0_gml_60_0"), textcolor, textcolor, textcolor, textcolor, 1);
    }
}
if (hurtflashalpha > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, hurtflashalpha);
    d3d_set_fog(false, c_black, 0, 0);
    hurtflashalpha -= 0.1;
}
