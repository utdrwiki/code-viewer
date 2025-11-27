if (init == 0)
{
    sprite_index = spr_board_enemy_shadowman_down;
    grabindex = 2034;
    throwindex = grabindex;
    image_speed = 0;
    if (extflag == "shadowman")
        throwindex = 4210;
    if (extflag == "elnina")
    {
        sprite_index = spr_board_elnina_cute;
        grabindex = 3888;
        throwindex = grabindex;
        image_speed = 0.125;
    }
    if (extflag == "lanino")
    {
        sprite_index = spr_board_lanino_pose;
        grabindex = 4499;
        throwindex = grabindex;
        image_speed = 0.125;
    }
}
if (active)
{
    if (con == 0)
        scr_depth_board();
}
if (con == 1)
{
    throwmarker = scr_board_marker(x, y, throwindex, image_speed, 100001, 2);
    with (instance_create(x, y, obj_board_pointsGet))
    {
        amount = 50;
        event_user(0);
    }
    with (throwmarker)
    {
        vspeed = -6;
        gravity = 0.9;
        friction = 0.1;
    }
    if (dir == 1)
        throwmarker.hspeed = 6 + (right_h() * 2);
    if (dir == 3)
        throwmarker.hspeed = -(6 + (left_h() * 2));
    if (extflag == "shadowman")
    {
        var hat = scr_board_marker(throwmarker.x + 2, throwmarker.y, spr_board_enemy_shadowman_hit_hat, 0, throwmarker.depth, 2);
        hat.vspeed = throwmarker.vspeed - 2;
        hat.hspeed = throwmarker.hspeed * 1.1;
        hat.friction = throwmarker.friction;
        hat.gravity = throwmarker.gravity;
        scr_doom(hat, 240);
    }
    setxy(room_width * 4, room_height * 4);
    con = 2;
}
if (con == 2)
{
    if (throwmarker.y > board_tiley(10))
    {
        safe_delete(throwmarker);
        instance_destroy();
    }
}
