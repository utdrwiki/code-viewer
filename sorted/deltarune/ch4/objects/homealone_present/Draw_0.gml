if (shake)
{
    shake_timer++;
    if (shake_timer == 1)
    {
        snd_loop(snd_paper_surf);
        shake_x_offset -= 0.3;
        shake_y_offset += 0.3;
    }
    if (shake_timer == 2)
    {
        snd_stop(snd_paper_surf);
        shake_x_offset += 0.3;
        shake_y_offset -= 0.3;
        shake = false;
        shake_timer = 0;
    }
}
draw_sprite(sprite_index, 0, x + shake_x_offset, y + shake_y_offset);
