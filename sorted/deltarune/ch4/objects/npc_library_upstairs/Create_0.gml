bird_npc = instance_create(200, 158, obj_npc_room);
bird_npc.sprite_index = spr_normalnpc;
bird_npc.image_xscale = -1;
if (global.chapter == 4)
    bird_npc.x -= 40;
