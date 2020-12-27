extends Spatial

onready var player = get_tree().get_root().get_node("main/Player");
var ball = preload("res://Scenes-Martin/Projectile.tscn");
var timer = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



func _process(delta):
	var distance = translation.distance_to(player.translation);
	if distance < 5.4:
		$FATHER_FEAR.get_surface_material(0).emission_energy += 0.005;
		
		if $FATHER_FEAR.get_surface_material(0).emission_energy >= 16:
			translation.y -= 0.03;
			if translation.y <= -1:
				queue_free();
		if timer > 0:
			timer -=1;
		else:
			timer = 250;

#			create_ball($Position3D.translation);
			create_ball($Position3D2.translation);
			create_ball($Position3D3.translation);
	else:
		if $FATHER_FEAR.get_surface_material(0).emission_energy > 0.2:
			$FATHER_FEAR.get_surface_material(0).emission_energy -= 0.2;
			
	look_at_from_position(translation, player.translation, Vector3(0,1,0));
	pass

func create_ball(target):
		var magicBall = ball.instance();
		var _c = cos(deg2rad(rotation_degrees.y));
		var _s = sin(deg2rad(rotation_degrees.y));
		var x_off = target.x;
		var z_off = target.z;
		var t_x = translation.x + _c*x_off + _s*z_off;
		var t_z = translation.y + _c*z_off - _s*x_off;
		
		target = Vector3(t_x, target.y, t_z);
		get_node("..").add_child(magicBall);
		magicBall.translation = target;
#		magicBall.translation.y += 0.6;
		
		magicBall.linear_velocity = target.normalized()*4;
		

