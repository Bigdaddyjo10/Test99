extends CharacterBody2D
var speed = 200
var CorrectSound = preload("res://Scene/Bullet/Zombie_Death.mp3")

var player: Node2D = null

func _ready():
	player = get_node("/root/Lvl/Player")

func _physics_process(delta):
	if player:
		var player_position = player.global_position
		var direction = (player_position - global_position).normalized()
		@warning_ignore("shadowed_variable_base_class")
		var velocity = direction * speed
		global_position += velocity * delta


func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		$AudioStreamPlayer.play()
		speed = 0
		$Timer.start()
		print("BOOBS")

 


func _on_timer_timeout():
	queue_free()
