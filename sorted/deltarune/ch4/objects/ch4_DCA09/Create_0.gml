con = -1;
customcon = 0;
layer_set_visible("DEBUG_ASSETS", 0);
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 34)
    {
        door_marker = scr_marker_fromasset(spritesArray[i]);
        door_marker.image_speed = 0;
        door_marker.image_index = 0;
        if (global.plot >= 180)
            door_marker.image_index = 1;
        door_marker.depth = layer_get_depth("Tiles_new_main") - 10;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 625)
    {
        book_marker = scr_marker_fromasset(spritesArray[i]);
        book_marker.depth = layer_get_depth("Tiles_new_main") - 10;
    }
}
if (global.plot < 170)
    global.plot = 170;
if (scr_debug())
    scr_setparty(1, 1, 0);

close_door = function()
{
    door_marker.image_index = 0;
    var door_block = instance_create(680, 160, obj_solidblockDark);
    door_block.image_xscale = 2;
    var door_readable = instance_create(door_block.x, door_block.y + 15, obj_readable_room1);
    with (door_readable)
    {
        extflag = "door_locked";
        image_xscale = 4;
    }
};

if (global.plot >= 170 && global.plot < 180)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 0;
    blackall.image_blend = c_black;
    set_party = false;
    set_text_speed = false;
    side_b = scr_sideb_active();
    blood_drip = false;
    drip_marker = scr_marker(camerax() - 100, cameray() - 100, spr_whitepixel);
    drip_marker.depth = blackall.depth - 10;
    drip_marker.image_blend = c_red;
    drip_marker.image_xscale = 2;
    drip_marker.image_yscale = 2;
    drip_marker.image_alpha = 0;
    drip_move = false;
    drip_siner = 0;
    susie_hide = false;
    susie_show = false;
    susie_shadow = 0;
}
else
{
    if (global.plot >= 180)
        close_door();
    book_marker.x = room_width;
    instance_destroy();
}
