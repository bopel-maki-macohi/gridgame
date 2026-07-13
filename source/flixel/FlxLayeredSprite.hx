package flixel;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.FlxSprite;

class FlxLayeredSprite<T:FlxSprite> extends FlxSprite
{
	public var graphic_layers:Array<T> = [];

	override function draw()
	{
		super.draw();

		for (layer in graphic_layers)
		{
			if (layer == null)
			{
				graphic_layers.remove(layer);
				continue;
			}

			if (!layer.visible)
				continue;

			layer.setPosition(this.x, this.y);
			layer.cameras = cameras;
			layer.draw();
		}
	}
}
