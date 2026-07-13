class GridTile extends Tile
{
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

	override public function new(id:String, ?x:Float = 0, ?y:Float = 0)
	{
		super(id);

		grid_x = x;
		grid_y = y;
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
}
