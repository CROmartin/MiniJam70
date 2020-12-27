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
	print(distance);
	
	var force = 1-distance/3;
	var f = 0.1;
	if distance > 0.5 && distance < 3 && player.dead == false:
		$AnimationPlayer.stop();
		path.stop = true;
		player.cl.disabled = true;
		player.stun = true;
		if player.translation.x > real_trans.x:
			player.translation.x -= f*force;
		else:
			player.translation.x += f*force;
		
		if player.translation.z > real_trans.z:
			player.translation.z -= f*force;
		else:
			player.translation.z += f*force;
			
		$Particles.emitting = true;
		$Particles2.emitting = true;
		
		look_at_from_position(real_trans,player.translation, Vector3(0,1,0));
		
		path.pf.set_rotation_mode(0)
	elif player.dead == false:
		if distance < 0.5:
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
