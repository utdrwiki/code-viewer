is_partying = false;
siner = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 0.2;
_is_init = false;
_party_sprite = -4;
_party_anim_speed = 0;
y_pos = ystart;
x_pos = xstart;

set_depth = function(arg0)
{
    depth = arg0;
};

init = function()
{
    if (_is_init)
        exit;
    _is_init = true;
    event_user(0);
};

start_partying = function()
{
    is_partying = true;
    if (_party_sprite != -4)
    {
        sprite_index = _party_sprite;
        image_speed = 0.2;
        if (image_xscale < 0)
            scr_flip("x");
    }
};

stop_partying = function()
{
    is_partying = false;
    _party_sprite = sprite_index;
    _party_anim_speed = image_speed;
    image_speed = 0;
};

shock = function()
{
    stop_partying();
    event_user(1);
    scr_shakeobj();
};
