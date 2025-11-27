draw_text(0, 0, string(track_pos));
if (!active)
    draw_self();
if (active)
    draw_text(camerax() + (camerawidth() / 2), (cameray() + cameraheight()) - 40, timer / 30);
