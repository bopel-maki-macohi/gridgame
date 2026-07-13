class Item extends Tile
{
	override public function new(id:String, x = 0.0, y = 0.0)
	{
		super(id, x, y);

		clickable = false;
	}

	override function getTileGraphic(_id:String)
	{
		return 'assets/textures/items/$_id.png';
	}
}
