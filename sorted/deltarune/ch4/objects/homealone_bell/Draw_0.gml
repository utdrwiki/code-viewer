if (bell_bonk)
{
    bell_bonk_timer++;
    if (bell_bonk_timer == 1)
        scr_lerpvar("bell_angle", 0, bell_target_angle, 10, -1, "out");
    if (bell_bonk_timer == 6)
    {
        bell_bonk = false;
        bell_bonk_timer = 0;
        scr_lerpvar("bell_angle", bell_target_angle, 0, 10, -1, "out");
        alarm[10] = 10;
    }
}
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, bell_angle, c_white, 1);
