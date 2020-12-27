extends Spatial

var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Flames.set_one_shot(true) ;
	$Flames/Smoke.set_one_shot(true) ;
	$Flames/Sparks.set_one_shot(true) ;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize();
	if $OmniLight.light_energy >= 0.5:
		$OmniLight.light_energy -= 0.5
	if $Flames.is_emitting()  == false:
		queue_free();

	pass
