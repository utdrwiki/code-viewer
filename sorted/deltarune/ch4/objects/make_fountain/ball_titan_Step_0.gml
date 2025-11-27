if (init == 0 && back == 0)
{
    if (big)
    {
        sprite_index = spr_fountain_ball_dissolve_big;
        size /= 2;
        image_xscale /= 2;
        image_yscale /= 2;
    }
    backball = instance_create(x, y, object_index);
    backball.image_xscale = image_xscale + (big ? 0.05 : 0.1);
    backball.image_yscale = image_yscale + (big ? 0.05 : 0.1);
    backball.sprite_index = sprite_index;
    backball.image_blend = c_white;
    backball.depth = depth + 10;
    backball.vspeed = vspeed;
    backball.hspeed = hspeed;
    backball.friction = friction;
    backball.gravity = gravity;
    backball.gravity_direction = gravity_direction;
    backball.siner = siner;
    backball.topper = topper;
    backball.bounce = bounce;
    backball.type = type;
    backball.back = 1;
    backball.big = big;
    backball.front = self;
    backball.size = size;
    init = 1;
}
