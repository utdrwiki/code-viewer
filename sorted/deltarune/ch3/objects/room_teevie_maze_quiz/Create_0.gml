var _target_depth = layer_get_depth("TILES_Walls") - 10;
var _normal_screen_list = [new Vector2(320, 80), new Vector2(1680, 80), new Vector2(2360, 200), new Vector2(1000, 560), new Vector2(1680, 440), new Vector2(1000, 920)];
for (var i = 0; i < array_length_1d(_normal_screen_list); i++)
{
    var tv_screen = instance_create(0, 0, obj_dw_teevie_tv_screens);
    with (tv_screen)
    {
        x = _normal_screen_list[i].x;
        y = _normal_screen_list[i].y;
        width = 6;
        height = 3;
        depth = _target_depth;
        tvbasesprite = spr_dw_teevie_tv_base;
    }
}
var _quiz_ids = [];
_quiz_ids[0][0] = "C";
_quiz_ids[0][1] = new Vector2(1000, 200);
_quiz_ids[0][2] = 1165;
_quiz_ids[1][0] = "C";
_quiz_ids[1][1] = new Vector2(1680, 800);
_quiz_ids[1][2] = 1166;
_quiz_ids[2][0] = "C";
_quiz_ids[2][1] = new Vector2(2360, 560);
_quiz_ids[2][2] = 1167;
_quiz_ids[3][0] = "C";
_quiz_ids[3][1] = new Vector2(320, 440);
_quiz_ids[3][2] = 1168;
for (var i = 0; i < array_length(_quiz_ids); i++)
{
    var quiz_controller = instance_create(0, 0, obj_dw_ch3_teevie_quiz_controller);
    with (quiz_controller)
    {
        depth = _target_depth;
        var _id = _quiz_ids[i][0];
        var _pos = _quiz_ids[i][1];
        var _flag = _quiz_ids[i][2];
        init_quiz(_id, _pos.x, _pos.y, _flag);
    }
}
if (global.plot < 320)
{
    var treasure_screen_left = instance_create(0, 0, obj_dw_teevie_tv_screens_treasure);
    with (treasure_screen_left)
    {
        x = 320;
        y = 800;
        width = 6;
        height = 3;
        depth = _target_depth;
        tvbasesprite = spr_dw_teevie_tv_base;
        set_secret(1224, 1);
    }
}
else
{
    var tv_screen = instance_create(320, 800, obj_dw_teevie_tv_screens);
    with (tv_screen)
    {
        x = 320;
        y = 800;
        width = 6;
        height = 3;
        depth = _target_depth;
        tvbasesprite = spr_dw_teevie_tv_base;
    }
    var door_collider = instance_create(560, 960, obj_solidblocksized);
    with (door_collider)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}
var treasure_screen_right = instance_create(0, 0, obj_dw_teevie_tv_screens_treasure);
with (treasure_screen_right)
{
    x = 2360;
    y = 920;
    width = 6;
    height = 3;
    depth = _target_depth;
    tvbasesprite = spr_dw_teevie_tv_base;
    set_secret(1225, 2);
}
