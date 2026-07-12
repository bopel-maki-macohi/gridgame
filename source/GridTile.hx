import flixel.util.FlxColor;
import flixel.FlxSprite;

class GridTile extends FlxSprite
{
	public var id(default, null):String;

	override public function new(id:String, ?x:Float = 0, ?y:Float = 0)
	{
		super();

		this.id = id;

        loadGraphic('assets/textures/tiles/$id.png');
        
		setGraphicSize(32);
        updateHitbox();

		setPosition(x * width, y * width);
	}
}
