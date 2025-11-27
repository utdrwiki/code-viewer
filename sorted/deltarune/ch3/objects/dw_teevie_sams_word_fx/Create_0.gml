outline_sprite = -4;
text_sprite = -4;
bg_surface = -4;
outline_surface = -4;
current_text = "";
current_alpha = 0;
current_color = c_white;
current_outline_color = 16777215;
timer = 0;
flashing = true;
_uniUV = 0;
_uniTime = 0;
_uniSpeed = 0;
_time = 0.025;
_speed = 0.75;
bonus_color_speed = 0.025;
siner = 0;
is_init = false;
is_love = false;

init = function(arg0, arg1)
{
    is_love = arg1;
    if (!is_love)
    {
        current_color = c_red;
        current_outline_color = 0;
    }
    current_text = arg0;
    is_init = true;
};

fade_out = function(arg0)
{
    flashing = false;
    scr_lerpvar("image_alpha", 1, 0, arg0);
    scr_doom(id, arg0 + 1);
};

clean_up = function()
{
    if (surface_exists(bg_surface))
        surface_free(bg_surface);
    if (surface_exists(outline_surface))
        surface_free(outline_surface);
    if (sprite_exists(text_sprite))
        sprite_delete(text_sprite);
    if (sprite_exists(outline_sprite))
        sprite_delete(outline_sprite);
};
