class FunctionalGridTile extends GridTile
{
	override function setBlock(_id:String)
	{
		super.setBlock(_id);

		switch (this.id)
		{
			case 'dirt-tilled':
				data.untill_tick = (tick_rate * (20 + tick_random.float(1, 10)));
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
		}
	}
}
