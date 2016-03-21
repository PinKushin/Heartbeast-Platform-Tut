///spideridle
if instance_exists (oPlayer) {
    var dis = distance_to_object (oPlayer);
    
    if dis < sight && alarm[idle] <=0 {
        image_speed = 0.5;
        
        //make sure we face the player
        if oPlayer.x != x {
            image_xscale = sign (oPlayer.x - x);
        }
    }
}
