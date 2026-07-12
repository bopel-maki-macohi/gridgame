import flixel.util.FlxColor;
import flixel.FlxSprite;

class GridTile extends FlxSprite
{
	public var id(default, null):String;

	override public function new(id:String, ?x:Float = 0, ?y:Float = 0)
	{
		super();

		this.id = id;

		makeGraphic(32, 32, FlxColor.WHITE);
		setGraphicSize(32);

		setPosition(x * width, y * width);
	}
}
