if (photographed == 0)
{
    scr_lerpvar("image_alpha", 0.5, 0, 15);
    hspeed = 0;
    vspeed = -6;
    friction = 0.3;
    var sparkle = scr_afterimage();
    sparkle.sprite_index = spr_board_sparkle;
    sparkle.image_speed = 0.25;
    type = -1;
    photographed = 1;
}
