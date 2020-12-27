extends Spatial

export var path_name = "";
onready var path = get_tree().get_root();
onready var player = get_tree().get_root().get_node("main/Player");


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Patrol");
	path_name = "main/"+path_name;
	path = get_tree().get_root().get_node(path_name); 


	pass
	# Replace with function body.



func _process(delta):
	
	var real_trans = path.translation + path.pf.translation;
	var distance = real_trans.distance_to(player.translation);
	
	
	var force = 1-distance/4;
	var f = 0.2;



	var deg = Vector3(0,0,0);
	var deg1 = Vector3(0,0,0);

	
	
	print(path.rotation_degrees);
		
	if distance > 0.6 && distance < 4 && player.dead == false:
		path.pf.set_rotation_mode(0);
		
		#Smooth rotation
#		rotation_degrees.y+360;
#		deg = rotation_degrees;
#		look_at_from_position(real_trans,player.translation, Vector3(0,1,0));
#		rotation_degrees.y+360;
#		deg1 = rotation_degrees;
#		rotation_degrees = deg;
#
#		if rotation_degrees.y+360 > deg1.y+360:
#			rotation_degrees.y -= min(3, abs(rotation_degrees.y-deg1.y))
#		else:
#			rotation_degrees.y += min(3, abs(rotation_degrees.y-deg1.y))
			
			
		look_at_from_position(real_trans,player.translation, Vector3(0,1,0));
		$AnimationPlayer.play("Attack");
		path.stop = true;
		player.cl.disabled = true;
		player.stun = true;
		

		if rotation_degrees.y < deg1.y+45 && rotation_degrees.y > deg1.y-45:
			if distance <= 2:
				player.move_speed = 0;
				
			if player.translation.x > real_trans.x:
				player.translation.x -= min(f*force, abs(translation.x - real_trans.x));
			else:
				player.translation.x += min(f*force, abs(translation.x - real_trans.x));
			
			if player.translation.z > real_trans.z:
				player.translation.z -= min(f*force, abs(translation.z - real_trans.z));
			else:
				player.translation.z += min(f*force, abs(translation.z - real_trans.z));
			
			$Particles.emitting = true;
			$Particles2.emitting = true;
		else:
			$Particles.emitting = false;
			$Particles2.emitting = false;
		
	elif player.dead == false:
		if distance < 0.6:
			player.visible = false;
			player.dead = true;
			player.stun = true;
		path.stop = false;
		player.cl.disabled = false;
		player.stun = false;
		rotation_degrees.y = 180;
		path.pf.set_rotation_mode(4);
		$Particles.emitting = false;
		$Particles2.emitting = false;
		$AnimationPlayer.play("Patrol");
	pass
