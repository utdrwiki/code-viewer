if (!global.fighting && !instance_exists(obj_battleback))
{
    var xpos = 468;
    var ypos = 46;
    var wid = 40;
    draw_sprite_ext(spr_pxwhite, 0, xpos, ypos, wid, wid, 0, c_red, 0.25);
    draw_text_debug(xpos + 4, ypos + 4, "load");
    var clickd = false;
    if (mouse_check_button_pressed(mb_left))
    {
        if (point_in_rectangle(mouse_x, mouse_y, xpos, ypos, xpos + wid, ypos + wid))
            clickd = true;
    }
    if (i_ex(collision_rectangle(xpos, ypos, xpos + wid, ypos + wid, obj_mainchara, false, false)) || clickd)
        scr_load();
}
