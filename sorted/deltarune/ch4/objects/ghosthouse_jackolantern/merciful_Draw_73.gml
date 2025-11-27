if (scr_debug() && sunkus_kb_check(32))
{
    draw_set_color(c_orange);
    d_circle(x, y, 45 - (size * 30), true);
    draw_set_color(c_red);
    d_circle(obj_heart.x + 4, obj_heart.y + 4, 30, true);
    draw_set_color(c_red);
    d_circle(obj_heart.x + 4, obj_heart.y + 4, light_distance - 45, true);
}
