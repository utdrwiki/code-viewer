obj_knight_enemy.siner2 = 0;
anchor_x = obj_knight_enemy.x;
anchor_y = obj_knight_enemy.y;
local_turntimer--;
timer++;
angle += spin;
center_x = scr_get_box(4);
center_y = scr_get_box(3) + 43;
if (local_turntimer < 112 && next_up == 4 && turn_segment == -1)
{
    var knight_stream = instance_create(obj_knight_enemy.x, obj_knight_enemy.y, obj_knight_swordfall);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
            master = other.id;
            event_user(0);
        }
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short end";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
    }
    next_up = -999;
}
with (obj_knight_weird_circle)
{
    x = other.center_x + lengthdir_x(distance, angle + other.angle);
    y = other.center_y + lengthdir_y(distance * 0.25, angle + other.angle);
}
if ((global.time % 4) == 0 && image_alpha != 0)
{
    fade = scr_afterimage();
    fade.depth = creatorid.depth + 1;
    fade.image_alpha = 0.6;
    fade.fadeSpeed = 0.04;
    fade.hspeed = 4;
}
