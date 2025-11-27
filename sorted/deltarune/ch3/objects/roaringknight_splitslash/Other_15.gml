if (active == 1 && scr_precise_hit(3))
{
    playerstrike = 1;
    active = 0;
    memheartx = obj_heart.x;
    memhearty = obj_heart.y;
    obj_heart.image_alpha = 0;
    global.inv = -1;
    cuty = round(remap_clamped(-16, 16, 1, 14, obj_heart.y - (y - 8)));
    obj_knight_split_growtangle.split_delay = 5;
    obj_roaringknight_boxsplitter_attack.timer -= 5;
    obj_roaringknight_boxsplitter_attack.local_turntimer += 5;
    hurt_delay = obj_knight_split_growtangle.split_wait;
}
