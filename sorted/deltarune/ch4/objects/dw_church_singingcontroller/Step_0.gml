var last_pos = trackpos;
trackpos = audio_sound_get_track_position(global.currentsong[1]);
if (!init)
{
    last_pos = trackpos;
    init = true;
}
var MOMENT = 0;
var DURATION = 1;
var CHORUSES = 2;
for (var i = 0; i < array_length(musichits); i++)
{
    var hit = musichits[i];
    if (trackpos >= hit[MOMENT] && last_pos < hit[MOMENT])
    {
        with (obj_dw_church_singingmizzle)
        {
            if (hit[CHORUSES][chorus])
                sing(hit[DURATION]);
        }
    }
}
