if (snd_is_playing(global.currentsong[1]) && inSync == 1)
    beats = (audio_sound_get_track_position(global.currentsong[1]) / spb)
else
{
    inSync = 0
    beats += bpf
}
if (abs((beats - beatsPrev)) > 3)
    inSync = 0
beatsPrev = beats
framesAway = ((targetBeat - beats) / bpf)
var _percent = max(0, (framesAway / frames))
var _yDiff = abs((ystart - endY))
y = ease_out_cubic(_percent, endY, (-_yDiff), 1)
y = max(y, ystart)
if (image_alpha >= 1)
    active = true
else if (follow != noone)
    x = (follow.x + targetX)
if (framesAway < (frames + fadeInSpeed))
    image_alpha = scr_approach(image_alpha, 1, (1 / fadeInSpeed))
if (framesAway < frames)
{
    if (_percent <= 0)
        instance_destroy()
}
if (room == room_dw_cyber_maze_virokun && y >= 240)
{
    y = 240
    instance_destroy()
}
if (room == room_dw_cyber_maze_rhythm && y > 2440)
{
    y = 2440
    instance_destroy()
}
