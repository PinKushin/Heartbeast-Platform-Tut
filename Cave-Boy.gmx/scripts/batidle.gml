///batidle
sprite_index = sBatIdle;

///look for player
if instance_exists (oPlayer) {
    var dis = point_distance (x, y, oPlayer.x, oPlayer.y);
    
    if dis < sight {
        state = batchase
    }
}
