extends CharacterBody2D

var speed = 800
var direction = Vector2.ZERO

func _physics_process(_delta):
	velocity = direction.normalized() * speed
	move_and_slide()

func start_motion(direction_vector: Vector2):
	direction = direction_vector.normalized()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Zombie"):
		
		queue_free()
