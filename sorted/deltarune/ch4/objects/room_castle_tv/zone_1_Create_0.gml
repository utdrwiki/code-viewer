con = -1;
solo_mode = !scr_havechar(3) && !scr_havechar(2);
init = false;
if (global.flag[1689] == 0 && !solo_mode)
    con = 0;
if (global.flag[1692] == 1)
    mike_controller = instance_create(0, 0, obj_mike_controller);
for (var i = 0; i < 6; i++)
{
    var _statue = instance_create(430 + (i * 180), 138, obj_mike_statue);
    with (_statue)
        scr_depth();
    var _statue_block = instance_create(_statue.x + 10, _statue.y + 80, obj_solidblockDark);
    var _statue_readable = instance_create(_statue.x + 8, _statue.y + 70, obj_readable_room1);
    with (_statue_readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = "statue";
    }
}
statue_cat = instance_create(1480, 200, obj_mike_statue_cat);
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
        case "statue":
            con = 1;
            break;
        case "ralsei":
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

if (global.flag[1690] == 1)
    remove_cat();
