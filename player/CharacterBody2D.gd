extends CharacterBody2D

var bulletPath = preload("res://Scene/Bullet/bullet_image.tscn")

func get_input():
	look_at(get_global_mouse_position())
	

func _physics_process(_delta):
	get_input()
	if Input.is_action_just_pressed("Shoot"):
		$Lazer_Zap.play()
		shoot()

func shoot():
	var bullet = bulletPath.instantiate()
	var direction = (get_global_mouse_position() - global_position).normalized()
	bullet.global_position = global_position + direction * 30
	bullet.start_motion(direction)
	get_tree().get_root().add_child(bullet)

func _on_area_2d_area_entered(area):
	if area.is_in_group("Zombie"):
		queue_free()
