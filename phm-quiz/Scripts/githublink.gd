extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	meta_clicked.connect(_on_meta_clicked)


func _on_meta_clicked(meta):
	OS.shell_open(str(meta))
