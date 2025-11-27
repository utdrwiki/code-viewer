timestamp_string = "";
if (count > 0)
{
    for (i = 0; i < count; i++)
        timestamp_string += (string_format_zero(i, 2, 0) + " - " + string_format_zero(timestamps[i], 3, 0) + " (" + string_format_zero(timestamps[i] / 30, 2, 2) + ")#");
}
