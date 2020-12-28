extends KinematicBody

var move_speed = 2;
var gravity = 9.8;
var tilt = 1;
var tilt_range_max = 60;
var tilt_range = tilt_range_max;
var tilt_speed = 0.0025;
var second_pos;
var tilt_pos = Vector3(0,0,0);
var posToMove = Vector3(0,0,0);
var part_change = 0;
var stun = false;
var dead = false;
var start_pos = Vector3(0,0,0);
var pick = 0;
onready var cl = $CollisionShape;
onready var music = get_tree().get_root().get_node("main/AudioStreamPlayer");


# Called when the node enters the scene tree for the first time.
func _ready():
	tilt_pos = translation;
	tilt_pos.y -= 0.15;
	start_pos = translation;
	pass # Replace with function body.

#func _process(delta):
#	pass

func _physics_process(delta):
	

	
	if !dead:
		posToMove.x = 0;
		posToMove.z = 0;
		var mas = Vector3(0,0,0);
		if Input.is_action_pressed("up"):
			posToMove.z = 1*move_speed; # -1
			posToMove.x = -1*move_speed;
			$PlayerNew/AnimationPlayer.play("Bounce");
			mas = move_and_slide(posToMove, Vector3(0,3,0));
			
		if Input.is_action_pressed("down"):
			posToMove.z = -1*move_speed; # 1
			posToMove.x = 1*move_speed;
			$PlayerNew/AnimationPlayer.play("Bounce");
			mas = move_and_slide(posToMove, Vector3(0,3,0));
			
		if Input.is_action_pressed("right"):
			posToMove.x = -1*move_speed;
			posToMove.z = -1*move_speed;
			$PlayerNew/AnimationPlayer.play("Bounce");
			mas = move_and_slide(posToMove, Vector3(0,3,0));
			
		if Input.is_action_pressed("left"):
			posToMove.z = 1*move_speed;
			posToMove.x = 1*move_speed;
			$PlayerNew/AnimationPlayer.play("Bounce");
			mas = move_and_slide(posToMove, Vector3(0,3,0));
		
#		$PlayerNew.look_at_from_position(translation,posToMove, Vector3(0,1,0));
		
		if !Input.is_action_pressed("up") && !Input.is_action_pressed("down") && !Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
			$PlayerNew/AnimationPlayer.play("Idle");
		if !stun:
			var vec = move_and_slide(posToMove, Vector3(0,3,0));
			
			if !is_on_floor():
				if !translation.y+vec.y > translation.y: 
					posToMove.y -= gravity * delta;
			else:
				if !translation.y+vec.y > translation.y:
					posToMove.y = 0;
					
			if vec.y > 0:
				if vec.y < 0.0001:
					vec.y = 0;
				
			if vec.y > 0 && posToMove.y == 0:
				posToMove.y = 3;
			elif translation.y+vec.y > translation.y:
				posToMove.y = 0;
			
		tilting(delta)
	else:
		var f = 0.2;
		var distance = translation.distance_to(start_pos);
		music.change_song("sc_pc_idle");
		if translation.y > start_pos.y:
			translation.y -= min(f, abs(translation.y - start_pos.y));
		else:
			translation.y += min(f, abs(translation.y - start_pos.y));
		
		if translation.x > start_pos.x:
			translation.x -= min(f, abs(translation.x - start_pos.x));
		else:
			translation.x += min(f, abs(translation.x - start_pos.x));
			
		if translation.z > start_pos.z:
			translation.z -= min(f, abs(translation.z - start_pos.z));
		else:
			translation.z += min(f, abs(translation.z - start_pos.z));
		visible = false;
		
		
		part_change = 1;
		if distance < 0.4:
			dead = false;
			visible = true;
			move_speed = 2;
			part_change = 0;
		
	if part_change == 1:
		$body/Particles.process_material.set("tangential_accel", 30);
		$body/Particles2.process_material.set("linear_accel", 8);
	else:
		$body/Particles.process_material.set("tangential_accel", 5);
		$body/Particles2.process_material.set("linear_accel", 0.2);
	$body.rotation_degrees.y += 1;
	$PlayerNew.rotation_degrees.y += 1;
	
	
	pass
func tilting(delta):
	if tilt == 1:
		$body.translation.y += tilt_speed*tilt;
		tilt_range -= 1;
		$OmniLight.light_energy += 0.1;
	else:
		$body.translation.y += tilt_speed*tilt; 
		tilt_range -= 1;
		$OmniLight.light_energy -= 0.1;
		
	
	if tilt_range == 0:
		tilt_pos = translation;
		tilt_pos.y -= 0.15;
		tilt_range = tilt_range_max;
		tilt = tilt*-1;
		
	
		
		
	


