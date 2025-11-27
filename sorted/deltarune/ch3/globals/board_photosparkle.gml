function scr_board_photosparkle()
{
    var _lifetime = 8;
    var imgspeed = 0.5;
    if (argument_count > 0)
        _lifetime = argument0;
    var sparkle = scr_board_marker(x, y, spr_board_sparkle, imgspeed, depth - 1, 2);
    with (sparkle)
        scr_lerpvar("x", x, x + other.sprite_width, _lifetime);
    scr_doom(sparkle, _lifetime);
    sparkle = scr_board_marker(x + sprite_width, y + sprite_height, spr_board_sparkle, imgspeed, depth - 1, 2);
    with (sparkle)
        scr_lerpvar("x", x, x - other.sprite_width, _lifetime);
    scr_doom(sparkle, _lifetime);
    sparkle = scr_board_marker(x, y + sprite_height, spr_board_sparkle, imgspeed, depth - 1, 2);
    with (sparkle)
        scr_lerpvar("y", y, y - other.sprite_height, _lifetime);
    scr_doom(sparkle, _lifetime);
    sparkle = scr_board_marker(x + sprite_width, y, spr_board_sparkle, imgspeed, depth - 1, 2);
    with (sparkle)
        scr_lerpvar("y", y, y + other.sprite_height, _lifetime);
    scr_doom(sparkle, _lifetime);
    var _photox = 0;
    var _photoy = 0;
    with (obj_board_playercamera)
    {
        _photox = (x + ((camwidth / 2) * 32)) - 16;
        _photoy = (y + ((camheight / 2) * 32)) - 16;
    }
    var star = scr_board_marker(centerx(id), centery(id), spr_board_sparkle, imgspeed, obj_board_playercamera.depth + 1, 2, 0);
    var starmovetime = 30;
    var starpausetime = 7;
    with (star)
    {
        scr_script_delayed(scr_lerpvar, 8, "x", x, _photox + 16, starmovetime, -1, "out");
        scr_script_delayed(scr_lerpvar, 8, "y", y, _photoy + 16, starmovetime, -1, "out");
        scr_doom(id, starmovetime + 8 + starpausetime);
    }
}
