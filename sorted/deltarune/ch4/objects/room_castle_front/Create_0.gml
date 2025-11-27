con = -1;
customcon = 0;
shutta_pose = false;
shutta_pose_return = false;
shutta_posing = false;
critter_photo = false;
critter_timer = 0;
tasque_npc = -4;
poppup_npc = -4;
maus_npc = -4;
cround_npc = -4;
var recruited_shutta = scr_flag_get(655) == 1;
if (recruited_shutta)
{
    critter_photo = true;
    shutta_marker = scr_dark_marker(330, 349, spr_shutta_idle);
    with (shutta_marker)
    {
        image_speed = 0.2;
        scr_flip("x");
        scr_depth();
    }
    var shutta_collider = instance_create(shutta_marker.x - 100, shutta_marker.y + 60, obj_solidblocksized);
    with (shutta_collider)
    {
        image_xscale = 2;
        image_yscale = 1.5;
    }
    var shutta_readable = instance_create(shutta_marker.x - 100, shutta_marker.y + 60, obj_readable_room1);
    with (shutta_readable)
    {
        extflag = "shutta";
        image_xscale = 4;
        image_yscale = 3;
    }
    if (scr_enemyrecruitcheck("tasque"))
    {
        tasque_npc = instance_create(650, 340, obj_npc_room_animated);
        with (tasque_npc)
        {
            extflag = "tasque";
            sprite_index = spr_npc_tasque_ribbon;
            scr_depth();
        }
        var tasque_collider = instance_create(tasque_npc.x, tasque_npc.y + 30, obj_solidblocksized);
        with (tasque_collider)
        {
            image_xscale = 3.2;
            image_yscale = 1.4;
        }
    }
    if (scr_enemyrecruitcheck("poppup"))
    {
        poppup_npc = instance_create(724, 422, obj_npc_room_animated);
        with (poppup_npc)
        {
            extflag = "poppup";
            sprite_index = spr_npc_poppup_ribbon;
            scr_depth();
        }
    }
    if (scr_enemyrecruitcheck("maus"))
    {
        maus_npc = instance_create(620, 421, obj_npc_room_animated);
        with (maus_npc)
        {
            extflag = "maus";
            sprite_index = spr_npc_maus_ribbon;
            scr_depth();
        }
    }
    cround_npc = instance_create(655, 460, obj_npc_room_animated);
    with (cround_npc)
    {
        extflag = "cround";
        sprite_index = spr_npc_cround_ribbon;
        scr_depth();
    }
}

critter_pose = function()
{
    with (tasque_npc)
        sprite_index = spr_npc_tasque_ribbon_pose;
    with (poppup_npc)
        sprite_index = spr_npc_poppup_ribbon_pose;
    with (maus_npc)
        sprite_index = spr_npc_maus_ribbon_pose;
    with (cround_npc)
        sprite_index = spr_npc_cround_ribbon_pose;
};

critter_reset = function()
{
    with (tasque_npc)
        sprite_index = spr_npc_tasque_ribbon;
    with (poppup_npc)
        sprite_index = spr_npc_poppup_ribbon;
    with (maus_npc)
        sprite_index = spr_npc_maus_ribbon;
    with (cround_npc)
        sprite_index = spr_npc_cround_ribbon;
};
