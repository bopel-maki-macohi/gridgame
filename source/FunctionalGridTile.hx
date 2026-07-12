import flixel.FlxSprite;

class FunctionalGridTile extends GridTile
{
	override function setBlock(_id:String)
	{
		super.setBlock(_id);

		switch (this.id)
		{
			case 'dirt-tilled':
				data.untill_tick = getWaitTick(20, 1, 10);

			case 'wheat':
				var wheat_layer:GridTileLayer = new GridTileLayer(getBlockGraphicId('wheat'), true, 16, 16);
				wheat_layer.animation.add('growth', [0, 1, 2], 1, false);
				wheat_layer.animation.pause();
				wheat_layer.animation.frameIndex = 0;
				graphic_layers.push(wheat_layer);

				data.growth = 0;
				data.growth_tick = getWaitTick(32, 10, 20);
		}
	}

	override function tick()
	{
		super.tick();

		switch (id)
		{
			case 'dirt-tilled':
				if (tick_value > data.untill_tick)
					if (tick_random.bool(10))
						setBlock('dirt');
		}
	}

	override function clicked()
	{
		super.clicked();

		switch (id)
		{
			case 'dirt':
				setBlock('dirt-tilled');

			case 'dirt-tilled':
				setBlock('wheat');
		}
	}

	override function loadBlockGraphic(_id:String)
	{
		switch (_id)
		{
			case 'wheat':
				super.loadBlockGraphic('dirt-tilled');

			default:
				super.loadBlockGraphic(_id);
		}
	}

	override function getBlockGraphicId(_id:String):String
	{
		return super.getBlockGraphicId(_id);
	}
}
