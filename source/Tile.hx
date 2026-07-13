import flixel.FlxLayeredSprite;
import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.math.FlxRandom;

class Tile extends FlxLayeredSprite<TileLayer>
{
	public static var TILE_SIZE:Int = 32;

	public var id(default, null):String;

	public function setTile(_id:String)
	{
		if (_id == null)
			return;

		this.id = _id.toLowerCase();

		loadTileGraphic(_id);

		setGraphicSize(TILE_SIZE);
		updateHitbox();

		data = {};
		tick_value = 0;
		tick_timer = 0;
		tick_rate = 20;

		for (layer in graphic_layers)
		{
			graphic_layers.remove(layer);
			layer.destroy();
			layer = null;
		}
	}

	public var tick_value(default, null):Int;
	public var tick_timer(default, null):Int;
	public var tick_rate(default, null):Int;
	public var tick_random(default, null):FlxRandom;

	public var data:Dynamic = {};

	override public function new(id:String, ?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

		tick_random = new FlxRandom();

		setTile(id);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (tick_timer % tick_rate == 0)
		{
			tick_value++;
			tick();

			tick_timer = 0;
		}

		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed)
		{
			clicked();
		}
	}

	public function tick() {}

	public function clicked() {}

	public function loadTileGraphic(_id:String)
	{
		loadGraphic(getTileGraphic(_id));
	}

	public function getTileGraphic(_id:String)
	{
		return 'assets/textures/tiles/$_id.png';
	}

	function getWaitTick(base = 0.0, min_random = 1.0, max_random = 1.0):Float
	{
		return (tick_rate * (base + tick_random.float(min_random, max_random)));
	}
}
