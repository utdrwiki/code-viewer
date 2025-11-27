var lab_collider = instance_create(115, 50, obj_solidblock);
lab_collider.image_xscale = 4.25;
var lab_interact = instance_create(144, 52, obj_readable_room1);
lab_interact.image_xscale = 1.6;
if (global.chapter == 1)
{
    var upstairs_collider = instance_create(200, 60, obj_solidblock);
    upstairs_collider.image_xscale = 4;
}
if (global.chapter >= 2)
{
    if (i_ex(obj_npc_facing))
    {
        with (obj_npc_facing)
        {
            if (global.chapter >= 4)
            {
                if (scr_flag_get(457) == 0)
                    instance_destroy();
                else if (x >= 90)
                    instance_destroy();
            }
            else
            {
                instance_destroy();
            }
        }
    }
    if (i_ex(obj_npc_room))
    {
        with (obj_npc_room)
            instance_destroy();
    }
    if (global.chapter == 4)
    {
        with (obj_readable_room1)
        {
            if (x < 120 && y < 65)
                instance_destroy();
        }
        var doggo = scr_marker(44, 54, spr_npc_prisoner_dog_eye);
        with (doggo)
            scr_depth();
        var greater = scr_marker(40, 30, spr_npc_prisoner_dog_big);
        with (greater)
            scr_depth();
        var lesser = scr_marker(69, 57, spr_npc_prisoner_dog_lesser_learned);
        with (lesser)
            scr_depth();
        var dogamy = scr_marker(85, 40, spr_npc_prisoner_dog_m);
        with (dogamy)
            scr_depth();
        var dogessa = scr_marker(114, 40, spr_npc_prisoner_dog_f);
        with (dogessa)
            scr_depth();
        var readable = instance_create(dogamy.x + 4, dogamy.y + 20, obj_readable_room1);
        readable.image_xscale = 2.25;
        readable = instance_create(lesser.x - 4, lesser.y + 20, obj_readable_room1);
        var collider = instance_create(readable.x, readable.y, obj_solidblockLight);
        collider.image_xscale = readable.image_xscale;
        instance_create(lesser.x + 8, lesser.y + 20, obj_solidblockLight);
    }
}
