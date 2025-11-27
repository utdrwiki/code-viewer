if (active)
    scr_depth_board();
if (init == 0)
{
    mysolid = instance_create(bbox_left + 2, bbox_top + 2, obj_board_solid);
    mysolid.sprite_index = spr_whitepx;
    mysolid.image_xscale = bbox_right - bbox_left - 3;
    mysolid.image_yscale = bbox_bottom - bbox_top - 3;
    init = 1;
}
if (room != room_board_1 && room != room_board_2)
{
    hitbuff--;
    if (place_meeting(x, y, obj_board_swordhitbox) && hitbuff <= 0)
    {
        hitbuff = 10;
        scr_shakeobj();
        snd_play(snd_board_damage);
        myhealth--;
        if (myhealth == 0)
        {
            instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
            instance_destroy();
        }
    }
}
