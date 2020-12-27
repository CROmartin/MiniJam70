extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var field = preload("res://Scenes-Jordan/Forcefield.tscn");
onready var player = get_tree().get_root().get_node("main/Player");
var para = 1.0;
var max_e = 0.3;
var min_e = 0.2;
var c_destroyed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	var distance = translation.distance_to(player.translation);
	if player.pick >= 6:
		if c_destroyed == false:
			$CenterArena/Cylinder.queue_free();
			c_destroyed = true;
		$CenterArena/Forcefield.translation.y = 20;
		
		if distance < 5.3:
			$CenterArena/Forcefield.visible = true;
			$CenterArena/Forcefield.translation.y = 0;
			
	if player.dead == true:
		max_e = 1
		min_e = 0.5
	else:
		max_e = 0.3
		min_e = 0.1
		
	$PlayArea.get_surface_material(0).emission_energy += 0.001*para;
	
	if $PlayArea.get_surface_material(0).emission_energy >= max_e && para == 1:
		para = para*-1
		
	if $PlayArea.get_surface_material(0).emission_energy <= min_e && para == -1:
		para = para*-1
		
	pass
