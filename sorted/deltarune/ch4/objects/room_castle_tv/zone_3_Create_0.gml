con = -1;
solo_mode = !scr_havechar(3) && !scr_havechar(2);
maus_shake = true;
maus_transform = false;
maus_transform_timer = 0;
hand_marker = -4;
mike_controller = -4;
treasure_active = true;
treasure_con = 0;

show_treasure = function()
{
    if (global.flag[1693] == 0)
        global.flag[1693] = 1;
    var treasure = instance_create(92, 210, obj_treasure_room);
    with (treasure)
    {
        itemflag = 1703;
        itemtype = "item";
        itemidchest = 34;
        scr_depth();
    }
};

statue_cat_tall = instance_create(82, 94, obj_mike_statue_cat_overworld);
with (statue_cat_tall)
    sprite_index = spr_statue_cat_tall;
statue_cat_tall.init("statue_cat_tall", show_treasure);
maus_marker = scr_dark_marker(930, 280, spr_npc_maus_scared);
with (maus_marker)
    scr_depth();
maus_block = instance_create(maus_marker.x, maus_marker.y + 10, obj_solidblockDark);
with (maus_block)
    image_yscale = 0.5;
maus_readable = instance_create(maus_marker.x, maus_marker.y + 10, obj_readable_room1);
with (maus_readable)
{
    extflag = "maus";
    image_xscale = 2;
}
statue_cat = instance_create(880, 158, obj_mike_statue_cat);
with (statue_cat)
    scr_depth();
statue_block = instance_create(statue_cat.x, statue_cat.y + 60, obj_solidblockDark);
statue_readable = instance_create(statue_cat.x + 8, statue_cat.y + 70, obj_readable_room1);
with (statue_readable)
{
    extflag = "statue_cat";
    image_xscale = 2;
    image_yscale = 2;
}

show_convo = function(arg0)
{
    switch (arg0)
    {
        case "statue_cat_tall":
            con = 1;
            break;
        case "maus":
            con = 5;
            break;
        case "statue_cat":
            con = 10;
            break;
    }
};

remove_cat = function()
{
    with (statue_cat)
        instance_destroy();
    with (statue_block)
        instance_destroy();
    with (statue_readable)
        instance_destroy();
};

remove_maus = function()
{
    with (maus_marker)
        instance_destroy();
    with (maus_block)
        instance_destroy();
    with (maus_readable)
        instance_destroy();
};

remove_cat_tall = function()
{
    with (statue_cat_tall)
        clean_up();
};

if (global.flag[1692] == 1)
{
    mike_controller = instance_create(0, 0, obj_mike_controller);
    remove_maus();
    remove_cat();
}
if (global.flag[1693] == 1)
    remove_cat_tall();
for (var _i = 0; _i < instance_number(obj_mouse_hat); _i++)
{
    var _hat = instance_find(obj_mouse_hat, _i);
    _hat.image_index = _i;
}
