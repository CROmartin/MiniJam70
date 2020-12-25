extends KinematicBody

var move_speed = 8;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var posToMove = Vector3(0,0,0);
	if Input.is_action_pressed("up"):
		posToMove.z = -1;
		move_and_collide(posToMove * move_speed * delta);
	if Input.is_action_pressed("down"):
		posToMove.z = 1;
		move_and_collide(posToMove * move_speed * delta);
		
	if Input.is_action_pressed("right"):
		posToMove.x = 1;
		move_and_collide(posToMove * move_speed * delta);
	if Input.is_action_pressed("left"):
		posToMove.x = -1;
		move_and_collide(posToMove * move_speed * delta);
	
