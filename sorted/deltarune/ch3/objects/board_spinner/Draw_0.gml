timer++;
draw_set_color(c_black);
ossafe_fill_rectangle(0, 0, 640, 480, 0);
draw_set_color(c_white);
draw_set_font(fnt_mainbig);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(320, 192, "TURN " + string(global.turnnumber));
if (timer == 40)
{
    obj_mainchara_board.movesleft = 3;
    obj_board_controller.phase = 0;
    instance_destroy();
}
