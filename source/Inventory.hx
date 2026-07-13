import InventorySlot.InventorySlotGraphic;
import flixel.FlxObject;
import flixel.util.FlxAxes;
import flixel.FlxBasic;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class Inventory extends FlxObject
{
	public static var INVENTORY_SLOTS:Int = 10;
	public static var INVENTORY_SLOT_SIZE:Int = 36;

	public var slots:Array<InventorySlot> = [];
	public var slot(default, set):Int = 0;

	function set_slot(_slot):Int
	{
		if (_slot < 0)
			_slot = slots.length - 1;
		if (_slot > slots.length - 1)
			_slot = 0;

		return this.slot = _slot;
	}

	var slot_graphic_bg:InventorySlotGraphic;
	var slot_graphic_slot_selection:InventorySlotGraphic;
	var slot_graphic_slot_outline:InventorySlotGraphic;
	var slot_graphic_slot_item:Item;

	override public function new()
	{
		super();

		slot_graphic_bg = new InventorySlotGraphic('bg');

		slot_graphic_slot_outline = new InventorySlotGraphic('border');
		slot_graphic_slot_outline.alpha = 0.3;

		slot_graphic_slot_item = new Item(null);

		slot_graphic_slot_selection = new InventorySlotGraphic('border');

		for (i in 0...INVENTORY_SLOTS)
		{
			slots.push({});
		}
	}

	override function draw()
	{
		final halflen = Math.round(slots.length / 2);

		for (i in -halflen...halflen)
		{
			var render = [
				slot_graphic_bg,
				slot_graphic_slot_item,
				((i == slot - halflen) ? slot_graphic_slot_selection : slot_graphic_slot_outline),
			];

			slot_graphic_slot_item?.setTile('wheat');
			slot_graphic_slot_item?.offset.subtract(2, 2);

			for (renderable in render)
			{
				if (renderable == null)
					continue;

				renderable.cameras = cameras;
				renderable.x = this.x + (i * INVENTORY_SLOT_SIZE);
				renderable.y = this.y;
				renderable.draw();
			}
		}
	}
}
