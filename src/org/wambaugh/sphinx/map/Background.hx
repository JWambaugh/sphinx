package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import nme.display.Bitmap;
import firmament.core.FPhysicsWorld;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class Background extends FPhysicsEntity
{

	public function new(world:FPhysicsWorld) 
	{
		var config:Dynamic = { };
		config.type = "static";
		config.sprite = Assets.getBitmapData("assets/Background.png");
		config.imageScale = 55;
		
		config.shapes = [
			{
				type:'box'
				,width:8
				,height:6
			}
			];
		config.collisionCategory =16 ;
		config.collidesWith = 0;
			super(world, config);
			setZPosition( -10); 
	}
	
}