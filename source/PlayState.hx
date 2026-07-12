package;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
	var width:Int = 16;
	var height:Int = 4;

	var grid:FlxTypedSpriteGroup<FunctionalGridTile>;

	override function create()
	{
		super.create();

		grid = new FlxTypedSpriteGroup<FunctionalGridTile>();
		add(grid);

		for (y in 0...height)
		{
			for (x in 0...width)
			{
				var tile = new FunctionalGridTile((FlxG.random.bool() ? 'dirt-tilled' : 'dirt'), x, y);
				grid.add(tile);
			}
		}

		grid.screenCenter();
	}
}
