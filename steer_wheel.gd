extends Node3D

@onready var steer_wheel: Node3D = $Pviot/steer_wheel
@export var mouse_sensitivity = 0.15
 
var is_RMB_pressed := false
var initial_mouse_position := Vector2.ZERO
var current_mouse_position := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		steer_wheel.rotation_degrees.y -= event.relative.x
		if is_RMB_pressed:
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
			print(event.position)
	
	if event.is_action_pressed("RMB"):
		is_RMB_pressed = true
	elif event.is_action_released("RMB"):
		is_RMB_pressed = false
