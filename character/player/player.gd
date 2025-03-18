extends CharacterBody3D
@onready var character_mover: CharaterMover = $CharacterMover
@onready var head: Node3D = $Head
@onready var crosshair: ColorRect = $UI/Crosshair

@export var mouse_sensitivity_h = 0.15
@export var mouse_sensitivity_y = 0.15

var is_RMB_pressed := false
var initial_mouse_position := Vector2.ZERO
var current_mouse_position := Vector2.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	
	# vision control
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity_h
		head.rotation_degrees.x -= event.relative.y * mouse_sensitivity_y
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -90, 90)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("jump"):
		character_mover.jump()

	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var move_dir := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	character_mover.set_move_dir(move_dir)
