extends KinematicBody2D

# Carlos Diaz

export (float, 0, 50) var speed: float;
export (float, 0, 10) var time_march: float;
export (float, 0, 5) var acceleration: float = 0;

var velocity: Vector2;
var direction: Vector2;

var last_acc;

func _ready():
	velocity = Vector2();
	direction = Vector2();

func _physics_process(delta):
	direction = Vector2(Input.get_action_strength("D") - Input.get_action_strength("A"), 
	Input.get_action_strength("S") - Input.get_action_strength("W"));
	
	if direction.length() != 0:
		last_acc -= delta;
	else:
		last_acc = acceleration;

	velocity.x = direction.x * speed * time_march;
	velocity.y = direction.y * speed * time_march;

	print(velocity);

	velocity = move_and_slide(velocity);
