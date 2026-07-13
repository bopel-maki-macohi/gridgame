import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxShader;
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
			setSlot(i, null);
		}

		setSlot(0, 'wheat');
		setSlot(1, 'hoe');
	}

	public function setSlot(slot = 0, item = '')
	{
		while ((slots.length - 1) < slot)
			slots.push({
				item: null,
			});

		slots[slot].item = item;
	}

	override function draw()
	{
		final halflen = Math.round(slots.length / 2);

		for (increment => slot in slots)
		{
			final i = increment - halflen;

			var render:Array<FlxSprite> = [
				slot_graphic_bg,
				((slot.item != null && slot.item != '') ? slot_graphic_slot_item : null),
				((i == this.slot - halflen) ? slot_graphic_slot_selection : slot_graphic_slot_outline),
			];

			slot_graphic_slot_item?.setTile(slot.item);
			slot_graphic_slot_item?.offset.subtract(2, 2);

			for (renderable in render)
			{
				if (renderable == null)
					continue;

				if (renderable.shader == null)
					renderable.shader = new FlxShader();

				renderable.cameras = cameras;
				renderable.x = this.x + (i * INVENTORY_SLOT_SIZE);
				renderable.y = this.y;
				renderable.draw();
			}
		}
	}
}
