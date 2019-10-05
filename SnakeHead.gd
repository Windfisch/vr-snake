extends Spatial

export (NodePath) var snake_tail # tail must have the same parent as head
var tail

var positions = []

var t = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	tail = get_node(snake_tail)
	
	for i in range(30):
		positions.append(Vector3(0,0,0))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	
	var pos = self.translation
	#pos.y = 0.25
	
	if t > 0.3:
		t = 0
		positions.push_front(pos)
		positions.pop_back()
		
		positions_updated()
		
func positions_updated():
	var curve = tail.get_node("Path").curve
	curve.clear_points()
	for pos in positions:
		curve.add_point(pos)
		
func set_color(color):
	$MeshInstance.mesh.surface_get_material(0).albedo_color = color
	$MeshInstance.mesh.surface_get_material(0).emission = color
	
#	pass
