time_percent = lerp(0, 1, (get_timer() - time_started) / 1000000 / duration);
if (time_percent > 0.5)
    alpha -= 0.03;
ring_update(lerp_ease_out(0, 1, time_percent, 2));
if (time_percent >= 1)
    instance_destroy();
