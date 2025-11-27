create_npc = function(arg0, arg1)
{
    npc_marker = scr_dark_marker(arg0.x, arg0.y, arg0.sprite_index);
    npc_marker.image_index = arg0.image_index;
    with (npc_marker)
        scr_depth();
    npc_readable = instance_create(npc_marker.x, npc_marker.y + 40, obj_readable_room1);
    with (npc_readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = arg1;
    }
    npc_solid = instance_create(npc_marker.x, npc_marker.y + 40, obj_solidblockDark);
    with (obj_roomglow)
        create_highlight(other.npc_marker);
    with (obj_floorshadow)
    {
        if (target == other.npc_marker)
        {
            ignorepreset = true;
            yoff = -8;
        }
    }
};

remove_npc = function()
{
    with (npc_marker)
        instance_destroy();
    with (npc_readable)
        instance_destroy();
    with (npc_solid)
        instance_destroy();
};

progress_scene = function()
{
    con = 10;
};

answer_choice = function(arg0)
{
    if (arg0 == 0)
        con = 15;
    else
        con = 20;
};

regain_control = function()
{
    global.interact = 0;
    global.facing = 0;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    obj_mainchara.cutscene = 0;
    with (kr_actor)
        visible = 0;
};

lose_control = function()
{
    global.interact = 1;
    kr_actor.x = obj_mainchara.x;
    kr_actor.y = obj_mainchara.y;
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    with (kr_actor)
        visible = 1;
    with (obj_caterpillarchara)
        visible = 0;
    with (obj_mainchara)
        visible = 0;
};

con = -1;
customcon = 0;
if (global.plot >= 260 && global.plot < 270)
{
    con = 0;
    scr_setparty(0, 0, 0);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    npc_marker = -4;
    npc_readable = -4;
    exit_block = instance_create(280, 480, obj_solidblockDark);
    exit_block.visible = 1;
    exit_block.image_xscale = 2;
    final_prophecy = instance_create(3860, 320, obj_dw_church_prophecy);
    final_prophecy.extflag = "final";
    final_prophecy.active = true;
    final_prophecy.destroykind = 3;
    final_prophecy.textonly = true;
    kris_head_marker = scr_dark_marker(0, 0, spr_kris_kneel_head);
    kris_head_marker.visible = 0;
    if (global.tempflag[90] == 1)
    {
        con = 5;
        blackall.image_alpha = 0;
        with (obj_mainchara)
        {
            x = 855;
            y = 191;
        }
        var _target_actor = -4;
        with (obj_caterpillarchara)
        {
            fun = 1;
            follow = 0;
            if (name == "ralsei")
            {
                _target_actor = id;
                sprite_index = spr_ralsei_walk_right_sad_subtle;
                x = 906;
                y = 179;
            }
            visible = 0;
        }
        create_npc(_target_actor, "ralsei");
    }
}
else
{
    instance_destroy();
}
