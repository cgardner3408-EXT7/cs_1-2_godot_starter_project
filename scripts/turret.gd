extends CharacterBody2D
var maxTimer = 2 
var projectile_original = preload("res://scenes/enemy_projectile.tscn")
var timer
var in_range = false
var player

func _ready():
	
	pass

func _process(delta: float) -> void:
	
	if in_range:
		maxTimer -= delta
		if maxTimer<= 0:
			shoot()
			timer = maxTimer
		
	pass # Replace with function body.


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player = body
		in_range = true
		shoot()
		
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range  = false
	pass # Replace with function body.

func shoot():
	
	var projectile_clone = projectile_original.instantiate()
	
	projectile_clone.global_position = position
	
	
	projectile_clone.set_direction(player.position)	
	
	get_tree().get_root().add_child(projectile_clone)
