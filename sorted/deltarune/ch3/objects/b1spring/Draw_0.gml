if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
var drawmark = 0;
if (obj_board_inventory.lancer == true && con == 0)
    drawmark = 1;
if (drawmark)
{
    siner++;
    var amt = round(abs(sin(siner / 20)) * 5) / 5;
    var col = merge_color(#FEF771, #D4973D, amt);
    col = merge_color(#FFFBE8, #F3CA46, amt);
    with (lmark)
    {
        draw_sprite_ext(spr_board_treasuremarker_lmarkonly, 0, x, y, 2, 2, 0, col, 1);
        draw_sprite_ext(spr_shine_white, other.siner * 0.125, (x - 2) + 4, y + 2, 2, 2, 0, c_white, 1);
    }
}
