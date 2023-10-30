class_name PlayerController extends CharacterBody3D


@onready var cam_arm: SpringArm3D = $SpringArm3D


# OOP composition
var phy_ser := PlayerPhysics.new()
var mov_param := phy_ser.PhysicsParameters.new()
var cam_ser := PlayerCamera.new()
var cam_param := cam_ser.CameraParameters.new()


const SPEED := 15.0
const JUMP_VELOCITY := 9.0
var input_dir: Vector2
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var cam_rot := Vector2.ZERO
const mouse_sensitivity := 0.003


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		handle_camera(event)


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	handle_move(delta)


# Facade pattern
func handle_move(delta: float) -> void:
	input_dir = Input.get_vector("w", "s", "a", "d")
	mov_param.on_floor = is_on_floor()
	mov_param.delta = delta
	mov_param.speed = SPEED
	mov_param.gravity = gravity
	mov_param.jump_velocity = JUMP_VELOCITY
	mov_param.input_dir = input_dir
	mov_param.cam_rot = cam_rot
	mov_param.cam_arm = cam_arm
	velocity = phy_ser.calculate_move(mov_param)

	var _collided := move_and_slide()


func handle_camera(event: InputEvent) -> void:
	cam_param.event = event
	cam_param.mouse_sensitivity = mouse_sensitivity
	cam_rot = cam_ser.calculate_camera(cam_param)

	cam_arm.rotation.x = cam_rot.x
	cam_arm.rotation.y = cam_rot.y
