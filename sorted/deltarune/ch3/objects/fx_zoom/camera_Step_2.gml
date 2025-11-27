size = basesize;
if (zoom != currentzoom)
    size = new Vector2(basesize.y / zoom, basesize.y / zoom);
if (size.x > 640)
    size.x = 640;
if (size.y > 480)
    size.y = 480;
pos.x = clamp(x, camerax() + (size.x / 2), (camerax() + 640) - (size.x / 2));
pos.y = clamp(y, cameray() + (size.y / 2), (cameray() + 480) - (size.y / 2));
