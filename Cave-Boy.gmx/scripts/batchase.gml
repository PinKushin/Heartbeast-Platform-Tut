///batchase
if instance_exists (oPlayer) {
    var dir = point_direction (x, y, oPlayer.x, oPlayer.y);
    hspd = lengthdir_x (spd, dir);
    vspd = lengthdir_y (spd, dir);
    
    //shange to flying sprite
    sprite_index = sBatFly;
    
    //Face the right direction
    if hspd !=0 {image_xscale = sign (hspd)};
    
    //move
    move (oSolid);
}
