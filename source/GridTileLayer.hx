import flixel.FlxG;
import flixel.FlxSprite;

class GridTileLayer extends FlxSprite
{
	override public function new(path:String, animated = false, w = 0, h = 0)
	{
		super(0, 0);

		loadGraphic(path, animated, w, h);

        setGraphicSize(GridTile.TILE_SIZE);
        updateHitbox();

		@:bypassAccessor
		active = false;
	}

	override function draw()
	{
		update(FlxG.elapsed);

		super.draw();
	}

	override function set_active(_active:Bool):Bool
	{
		return active = false;
	}
}
