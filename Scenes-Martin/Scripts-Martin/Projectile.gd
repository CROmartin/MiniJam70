extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 100;
var timer_2 = 600;
var ex = preload("res://Scenes-Martin/Explosion.tscn");
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if linear_velocity ==  Vector3(0,0,0):
#		linear_velocity = Vector3(0,0,1) * delta * 250;
	if timer > 0:
		timer -= 1;
	else:
		linear_velocity = linear_velocity*1.2;
		timer = 60
		
	if timer_2 > 0:
		timer_2 -= 1;
	else:
		var explosion = ex.instance();
		get_node("..").add_child(explosion);
		explosion.translation = self.translation;
		queue_free();
		
		
	var body = [null]
	body[0] = get_colliding_bodies();
	
	pass


func _on_RigidBody_body_entered(body):

	if body.name == "Player":
		body.dead = true;
		var explosion = ex.instance();
		get_node("..").add_child(explosion);
		explosion.translation = self.translation;
		queue_free();
		pass
	pass # Replace with function body.

