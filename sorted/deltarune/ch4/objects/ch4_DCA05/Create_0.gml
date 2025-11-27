con = -1;
customcon = 0;
lcon = 0;
if (scr_debug())
    scr_setparty(1, 1, 0);
stool_npc = instance_create(102, 226, obj_npc_room);
with (stool_npc)
{
    extflag = "stool";
    sprite_index = spr_dw_church_stool;
    scr_depth();
}
var doorloc = [];
layer_set_visible("DEBUG_ASSETS", 0);
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4123)
    {
        book_marker = scr_marker_fromasset(spritesArray[i]);
        book_marker.depth = layer_get_depth("Tiles_new_books") - 10;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 34)
    {
        door_marker = scr_marker_fromasset(spritesArray[i]);
        with (door_marker)
        {
            scr_depth();
            image_speed = 0;
            if (global.plot >= 150)
                image_index = 1;
        }
    }
}
if (global.plot < 150)
{
    door_readable = instance_create(door_marker.x, 180, obj_readable_room1);
    with (door_readable)
    {
        extflag = "door";
        image_xscale = 4;
    }
    door_collider = instance_create(door_marker.x, 160, obj_solidblockDark);
    with (door_collider)
        image_xscale = 2;
    book_readable = instance_create(book_marker.x - 6, book_marker.y, obj_readable_room1);
    with (book_readable)
    {
        extflag = "book";
        image_yscale = 4;
    }
}
else
{
    book_marker.image_blend = c_black;
}
if (global.plot >= 140 && global.plot < 150)
{
    con = 0;
    with (instance_create(632, 222, obj_solidblocksized))
    {
        sprite_index = spr_doorAny;
        scr_size(1, 3);
    }
    gerson_npc = instance_create(250, 170, obj_npc_gerson);
    with (gerson_npc)
    {
        extflag = "gerson";
        current_state = 4;
        facing_right = true;
        scr_depth();
    }
    ralsei_marker = scr_dark_marker(camerax() - 100, cameray() - 100, spr_ralsei_splat);
    if (scr_debug() && global.tempflag[90] == 1)
    {
        obj_mainchara.x = 560;
        with (obj_caterpillarchara)
            x = obj_mainchara.x + 80;
    }
    susie_throw = false;
    susie_throw_timer = 0;
    ralsei_splat_fx = false;
    ralsei_splat_toggle = false;
    kris_splat = false;
    kris_splat_timer = 0;
    susie_hide = false;
    susie_show = false;
    susie_shadow = 0;
    explore = false;
    explore_con = 0;
    ralsei_pause_follow = false;
}
else
{
}
