timer++;
if (timer > 90 || x < board_tilex(-2) || x > board_tilex(13) || y < board_tiley(-2) || y > board_tiley(8))
    instance_destroy();
place += 8;
animindex += 0.3;
var count = 5;
for (var i = 0; i < count; i++)
    draw_sprite_ext(spr_board_snowflake, animindex, scr_even(x + lengthdir_x(len, place + ((360 / count) * i))), scr_even(y + lengthdir_y(len, place + ((360 / count) * i))), 2, 2, 0, c_white, image_alpha);
