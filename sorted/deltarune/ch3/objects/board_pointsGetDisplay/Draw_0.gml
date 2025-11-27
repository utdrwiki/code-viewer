if (i_ex(obj_board_camera) && outofboard == false)
{
    if (obj_board_camera.shift != "none")
        visible = false;
}
draw_set_color(c_white);
if (visible)
{
    var gridx = scr_even(x);
    var gridy = scr_even(y);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var signer = "+";
    if (amount < 0)
        signer = "";
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_color(c_black);
    draw_text(gridx - 2, gridy, signer + string(amount));
    draw_text(gridx - 2, gridy - 2, signer + string(amount));
    draw_text(gridx - 2, gridy + 2, signer + string(amount));
    draw_text(gridx + 2, gridy, signer + string(amount));
    draw_text(gridx + 2, gridy - 2, signer + string(amount));
    draw_text(gridx + 2, gridy + 2, signer + string(amount));
    draw_text(gridx, gridy, signer + string(amount));
    draw_text(gridx, gridy - 2, signer + string(amount));
    draw_text(gridx, gridy + 2, signer + string(amount));
    draw_set_color(c_white);
    if (amount < 0)
        draw_set_color(hexcolor(#473DE3));
    draw_text(gridx, gridy, signer + string(amount));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
