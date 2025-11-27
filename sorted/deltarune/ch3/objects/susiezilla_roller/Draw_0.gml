image_index = round(sprite_timer / 45) % 8;
sprite_timer -= (speed * 4);
if (sprite_timer < 0)
    sprite_timer += 360;
else if (sprite_timer >= 360)
    sprite_timer -= 360;
draw_self_offset(0, 0);
