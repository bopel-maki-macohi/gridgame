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
	var slot_graphic_slot_outline:InventorySlotGraphic;
	var slot_graphic_slot_selection:InventorySlotGraphic;
	var slot_graphic_slot_item:InventorySlotGraphic;

	override public function new()
	{
		super();

		slot_graphic_bg = new InventorySlotGraphic('bg');
		slot_graphic_slot_outline = new InventorySlotGraphic('slot');
		slot_graphic_slot_selection = new InventorySlotGraphic('selection');
		slot_graphic_slot_item = new InventorySlotGraphic('slot');

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
			if (i == slot - halflen)
			{
				if (slot_graphic_slot_selection != null)
				{
					slot_graphic_slot_selection.cameras = cameras;
					slot_graphic_slot_selection.x = this.x + (i * INVENTORY_SLOT_SIZE);
					slot_graphic_slot_selection.y = this.y;
					slot_graphic_slot_selection.draw();
				}
			}
			else
			{
				if (slot_graphic_bg != null)
				{
					slot_graphic_bg.cameras = cameras;
					slot_graphic_bg.x = this.x + (i * INVENTORY_SLOT_SIZE);
					slot_graphic_bg.y = this.y;
					slot_graphic_bg.draw();
				}
			}

			if (slot_graphic_slot_outline != null)
			{
				slot_graphic_slot_outline.cameras = cameras;
				slot_graphic_slot_outline.x = this.x + (i * INVENTORY_SLOT_SIZE);
				slot_graphic_slot_outline.y = this.y;
				slot_graphic_slot_outline.draw();
			}
		}
	}
}
