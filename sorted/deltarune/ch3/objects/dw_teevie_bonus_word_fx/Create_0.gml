outline_sprite = -4;
text_sprite = -4;
bg_surface = -4;
outline_surface = -4;
current_text = stringsetloc("BONUS ZONE", "obj_dw_teevie_bonus_word_fx_slash_Create_0_gml_8_0");
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

init = function()
{
    is_init = true;
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
