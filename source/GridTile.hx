import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.FlxSprite;

class GridTile extends FlxSprite
{
	public static var TILE_SIZE:Int = 32;

	public var id(default, null):String;

	public function setBlock(_id:String)
	{
		this.id = _id.toLowerCase();

		loadBlockGraphic(_id);

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

	public var grid_x(default, set):Float;
	public var grid_y(default, set):Float;

	function set_grid_x(_grid_x):Float
	{
		@:bypassAccessor
		x = _grid_x * width;
		return grid_x = _grid_x;
	}

	function set_grid_y(_grid_y):Float
	{
		@:bypassAccessor
		y = _grid_y * width;
		return grid_y = _grid_y;
	}

	public var data:Dynamic = {};

	public var graphic_layers:Array<GridTileLayer> = [];

	override public function new(id:String, ?x:Float = 0, ?y:Float = 0)
	{
		super();

		tick_random = new FlxRandom();

		setBlock(id);

		grid_x = x;
		grid_y = y;
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

	public function loadBlockGraphic(_id:String)
	{
		loadGraphic(getBlockGraphicId(_id));
	}

	public function getBlockGraphicId(_id:String)
	{
		return 'assets/textures/tiles/$_id.png';
	}

	override function setPosition(x:Float = 0.0, y:Float = 0.0)
	{
		grid_x = x;
		grid_y = y;
	}

	@:deprecated('Use grid_x')
	override function set_x(_x):Float
	{
		return super.set_x(_x);
	}

	@:deprecated('Use grid_y')
	override function set_y(_y):Float
	{
		return super.set_y(_y);
	}

	override function draw()
	{
		super.draw();

		for (layer in graphic_layers)
		{
			if (layer == null)
				graphic_layers.remove(layer);

			layer.cameras = cameras;
			layer.draw();
		}
	}
}
