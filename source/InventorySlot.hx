import flixel.FlxSprite;

class InventorySlotGraphic extends FlxSprite
{
	override public function new(graphic:String)
	{
		super(0, 0, 'assets/textures/inventory/$graphic.png');

		setGraphicSize(Inventory.INVENTORY_SLOT_SIZE);
		updateHitbox();

		active = false;
	}
}

typedef InventorySlot =
{
	var item:String;
}
