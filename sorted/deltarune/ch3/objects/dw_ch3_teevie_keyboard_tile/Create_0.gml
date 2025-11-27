is_pressed = false;
char_string = "?";
char_sprite_index = 0;
char_y_offset = 0;
tile_index = 0;

init_button = function(arg0)
{
    char_string = arg0;
    if (ord(arg0) <= 57)
        char_sprite_index = ord(arg0) - 22;
    else
        char_sprite_index = ord(string_upper(arg0)) - 65;
};

press_button = function()
{
    is_pressed = true;
    char_y_offset = 4;
    tile_index = 1;
    snd_play(asset_get_index("snd_speak_and_spell_" + char_string));
};

reset_button = function()
{
    is_pressed = false;
    char_y_offset = 0;
    tile_index = 0;
};
