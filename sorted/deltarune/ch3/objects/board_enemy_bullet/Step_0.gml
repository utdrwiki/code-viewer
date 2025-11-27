timer++;
if (timer >= acthitboxtime)
    active_hitbox = true;
if (timer == 160 || x > board_tilex(13) || x < board_tilex(0) || y > board_tiley(9) || y < board_tiley(0) || obj_board_camera.con != 0)
    instance_destroy();
if (place_meeting(x, y, obj_board_grayregion))
{
    red = merge_color(red, #D2D2D2, 0.8);
    yellow = merge_color(yellow, #D2D2D2, 0.8);
    active_hitbox = false;
    scr_doom(id, round(speed / 8) + 1);
}
if (i_ex(obj_board_deathevent))
    instance_destroy();
