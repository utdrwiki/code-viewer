x += (camerax() - lastx);
y += (cameray() - lasty);
lastx = camerax();
lasty = cameray();
draw_self();
