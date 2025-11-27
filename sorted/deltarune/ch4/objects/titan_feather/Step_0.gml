speed *= 0.95;
image_angle += rot;
rot *= 0.95;
life--;
if (life <= 0)
    instance_destroy();
image_alpha = life / lifeD;
