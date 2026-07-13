class Item extends Tile
{
	override function getTileGraphic(_id:String)
	{
		return 'assets/textures/items/$_id.png';
	}
}
