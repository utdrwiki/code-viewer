if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (init == 0)
{
    mysolid = instance_create(bbox_left + 2, bbox_top + 2, obj_board_solid);
    mysolid.sprite_index = spr_whitepx;
    mysolid.image_xscale = bbox_right - bbox_left - 3;
    mysolid.image_yscale = bbox_bottom - bbox_top - 3;
    if (cold)
        sprite_index = spr_board_cactus_cold;
    init = 1;
}
if (wither == 1)
{
    if (witherproof == 0)
        sprite_index = spr_board_cactus_dead;
    wither = 2;
}
if (active)
{
    scr_depth_board();
    if (room != room_board_1 && room != room_board_2)
    {
        if (i_ex(kris))
        {
            if (kris.sword == true)
            {
                sndbuff--;
                if (place_meeting(x, y, obj_board_swordhitbox))
                {
                    var sword = instance_place(x, y, obj_board_swordhitbox);
                    if (sword.swordlv > defense)
                    {
                        myhealth--;
                        if (myhealth <= 0)
                        {
                            instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                            instance_destroy();
                        }
                    }
                    else if (sndbuff <= 0)
                    {
                        snd_stop(snd_board_sword_metal);
                        snd_play(snd_board_sword_metal);
                        sndbuff = 10;
                    }
                }
            }
        }
    }
}
