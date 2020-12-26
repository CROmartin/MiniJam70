extends Spatial

onready var player = get_tree().get_root().get_node("Player");
var rng = RandomNumberGenerator.new()
export var corner = "";
onready var corner_id = get_tree().get_root().get_node("main/PlayArea/CornerPiece2")


onready var l1 = $OmniLight.light_energy;
onready var l2 = $OmniLight2.light_energy;
onready var l3 = $OmniLight3.light_energy;

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize();
	corner = "main/PlayArea/" + corner;
	corner_id = get_tree().get_root().get_node(corner)
	print(corner);
	pass # Replace with function body.

func _process(delta):
	player = get_tree().get_root().get_node("main/Player");
	var distance = translation.distance_to(player.translation);
	if distance > 9:
		$OmniLight.visible = false;
		$OmniLight2.visible = false;
		$OmniLight3.visible = false;
	else:
		$OmniLight.visible = true;
		$OmniLight2.visible = true;
		$OmniLight3.visible = true;
	
	if distance < 4 && $OmniLight.light_energy > 0:
		corner_id.flicker = 1;
		player.part_change = 1;
		var d_l = 0.2;
		var r_l = 4.0;
		$OmniLight.light_energy = l1;
		$OmniLight2.light_energy = l2;
		$OmniLight3.light_energy = l3;
		
		$OmniLight.light_energy -= d_l;
		$OmniLight2.light_energy -= d_l;
		$OmniLight3.light_energy -= d_l;
		
		l1 = $OmniLight.light_energy;
		l2 = $OmniLight2.light_energy;
		l3 = $OmniLight3.light_energy;
		
		$OmniLight.light_energy = l1 + rng.randf_range(-r_l, r_l);
		$OmniLight2.light_energy = l2 + rng.randf_range(-r_l, r_l);
		$OmniLight3.light_energy = l3 + rng.randf_range(-r_l, r_l);
		
	if $OmniLight.light_energy <= 0:
		$OmniLight.light_energy = 0;
		$OmniLight2.light_energy = 0;
		$OmniLight3.light_energy = 0;
		corner_id.flicker = 0;
		player.part_change = 0;
	pass
