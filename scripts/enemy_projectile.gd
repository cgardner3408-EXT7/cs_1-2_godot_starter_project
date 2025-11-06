extends Area2D
var direction = position
var speed = 300

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		body.change_health(-2)
		queue_free()
	pass




func set_direction(target_position):
	direction = position.direction_to(target_position)
