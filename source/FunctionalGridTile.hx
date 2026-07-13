import flixel.FlxSprite;

class FunctionalGridTile extends GridTile
{
	override function setTile(_id:String)
	{
		super.setTile(_id);

		switch (this.id)
		{
			case 'dirt-tilled':
				data.untill_tick = getWaitTick(20, 1, 10);

			case 'wheat':
				var wheat_layer:TileLayer = new TileLayer(getTileGraphic('wheat'), true, 16, 16);
				wheat_layer.animation.add('growth', [0, 1, 2], 1, false);
				wheat_layer.animation.pause();
				wheat_layer.animation.frameIndex = 0;
				wheat_layer.visible = false;
				graphic_layers.push(wheat_layer);

				data.growth = -1;
				data.growth_max = 2;
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
						setTile('dirt');

			case 'wheat':
				if (data.growth < data.growth_max)
				{
					if (tick_value > data.growth_tick && tick_random.bool(10))
					{
						if (data.growth >= 0)
							data.growth++;
						else
						{
							if (tick_random.bool(25))
								data.growth++;
							else
								data.growth--;
						}

						graphic_layers[0].animation.frameIndex = data.growth;
						graphic_layers[0].visible = data.growth >= 0;

						tick_value = 0;
					}

					if (data.growth < -1)
					{
						final previous_tick = tick_value;
						setTile('dirt-tilled');
						tick_value = tick_random.int(0, previous_tick);
					}
				}
		}
	}

	override function clicked()
	{
		super.clicked();

		switch (id)
		{
			case 'dirt':
				setTile('dirt-tilled');

			case 'dirt-tilled':
				setTile('wheat');
		}
	}

	override function loadTileGraphic(_id:String)
	{
		switch (_id)
		{
			case 'wheat':
				super.loadTileGraphic('dirt-farming');

			default:
				super.loadTileGraphic(_id);
		}
	}

	override function getTileGraphic(_id:String):String
	{
		return super.getTileGraphic(_id);
	}
}
