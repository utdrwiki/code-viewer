depth = 5990;
y_pos = 228;
overlay_alpha = 0.4;

clean_up = function()
{
    scr_lerpvar("overlay_alpha", overlay_alpha, 0, 30);
    scr_doom(id, 31);
};
