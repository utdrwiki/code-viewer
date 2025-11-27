if (global.chapter == 3 && version == 1 && airborne == true)
    x -= 1;
if (preload)
{
    if (speed > 0)
    {
        preload_speed = speed;
        speed = 0;
    }
    exit;
}
if (!preload && preload_speed != 0)
{
    speed = preload_speed;
    preload_speed = 0;
}
if ((y - height) > (cameray() + 500) || x < (camerax() - 100) || x > (camerax() + 740) || (!airborne && y < (cameray() - 100)))
{
    with (shadow)
        instance_destroy();
    instance_destroy();
}
if (!init)
{
    init = true;
    if (i_ex(shadow))
        shadow.depth = maxDepth + 1;
}
falltime++;
if (!airborne)
{
    if (!destroyOnLand)
        exit;
    if (lifetime > 0)
    {
        lifetime--;
        exit;
    }
    siner -= 0.1;
    image_alpha = min(siner, 1);
    if (siner <= 0)
        instance_destroy();
    exit;
}
if (version == 1)
{
    if (fallspeed < 0)
        fallspeed += fallFriction;
    if (fallspeed > -5)
        fallFriction = 0.8;
    if (speed < 5)
        friction = 0.4;
    if (fallspeed < 10)
        fallspeed = scr_movetowards(fallspeed, 10, 0.15);
}
else
{
    if (fallspeed < 0)
        fallspeed += fallFriction;
    if (fallspeed > -5)
        fallFriction = 0.4;
    if (speed < 5)
        friction = 0.4;
    if (fallspeed < 2)
        fallspeed = scr_movetowards(fallspeed, 2, 0.1);
}
height -= fallspeed;
var _over_gap = false;
if (airborne && (topdrop != 0 || bottomdrop != 0))
{
    var _minyy = miny;
    if (topdrop == 2 && y < (miny + 20))
        _minyy += ((1 - cos(abs(x - 320) / 320)) * 40);
    if (y < _minyy && topdrop >= 1)
        y = _minyy;
    else if (y > maxy && bottomdrop == 1)
        y = maxy;
    else if (y < _minyy && topdrop == -1)
        _over_gap = true;
    else if (y > maxy && bottomdrop == -1)
        _over_gap = true;
}
var landingheight = 0;
if (version == 1)
    landingheight = -64;
if (airborne && height <= landingheight && !_over_gap && fallspeed >= 0)
{
    instance_destroy(shadow);
    fallspeed = 0;
    height = landingheight;
    airborne = false;
    image_index = (image_index < 4) ? 3 : 7;
    speed = 0;
    image_speed = 0;
    x += sin(siner / 15);
    if (version == 0)
    {
        if (collision_rectangle(x - (sprite_width / 2), y - (sprite_height / 2), x + (sprite_width / 2), y + (sprite_height / 2), obj_confetti_overworld, false, true) != -4)
        {
            var _list = ds_list_create();
            var _count = collision_rectangle_list(x - (sprite_width / 2), y - (sprite_height / 2), x + (sprite_width / 2), y + (sprite_height / 2), obj_confetti_overworld, false, true, _list, false);
            depth = maxDepth - _count;
            ds_list_destroy(_list);
        }
        else
        {
            depth = maxDepth;
        }
    }
    siner = 3;
    exit;
}
x += (sin(siner / 15) * (fallspeed / 2));
siner++;
image_speed = 1 + (speed / 15);
var _midy = (miny + maxy) / 2;
if (height < 0 && y < _midy)
    scr_depth_relative(maxDepth, _midy);
else
    scr_depth_ext(start_depth);
if (i_ex(shadow))
{
    shadow.image_alpha = (y > !_over_gap) ? 0 : 1;
    shadow.image_index = image_index;
    shadow.x = x + ((sprite_width - shadow.sprite_width) / 2);
    shadow.y = y + ((sprite_height - shadow.sprite_height) / 2);
    var shadowScale = clamp((40 - (height / 2)) / 20, 0, 2);
    shadow.image_xscale = shadowScale;
    shadow.image_yscale = shadowScale;
}
if (version == 1)
{
    if (i_ex(obj_rouxls_ch3_enemy))
        depth = obj_rouxls_ch3_enemy.depth - 1;
}
