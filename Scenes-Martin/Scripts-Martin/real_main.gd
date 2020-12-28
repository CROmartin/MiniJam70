extends Spatial


var menu = preload("res://Scenes-Martin/menu.tscn");
var game = preload("res://Scenes-Martin/main.tscn");
var play = 0;
var quit = 0;
var in_menu = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if in_menu == 1:
		if Input.is_action_pressed("ui_cancel"):
			get_tree().quit()
		if play == 1:
			$menu/Node2D/Play/circle.rotation_degrees += 3;
			if Input.is_action_pressed("mouse_left"):
				var g = game.instance();
				get_node(".").add_child(g);
				$menu.queue_free()
				in_menu = 0;
				play = 0
				
				pass
				
		if quit == 1:
			$menu/Node2D/Quit/circle.rotation_degrees += 3;
			if Input.is_action_pressed("mouse_left"):
				get_tree().quit()
				pass
	else:
		if Input.is_action_pressed("ui_cancel"):
			var m = menu.instance();
			get_node(".").add_child(m);
			$menu.queue_free()
			
			
	pass


func _on_Play_mouse_entered():
	play = 1;
	pass # Replace with function body.


func _on_Play_mouse_exited():
	play = 0
	pass # Replace with function body.


func _on_Quit_mouse_entered():
	quit = 1;
	
	pass # Replace with function body.


func _on_Quit_mouse_exited():
	quit = 0;
	pass # Replace with function body.
