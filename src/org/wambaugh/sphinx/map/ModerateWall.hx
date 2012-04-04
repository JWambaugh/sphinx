package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class ModerateWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite = new Bitmap(Assets.getBitmapData("assets/ModerateWall.png"));
		config.type = "dynamic";
		config.imageScale = 589;
		config.shapes = [
		{
			type:'box'
			,width:.151
			,height:.7
			,restitution:.1
			,density:.7
			,friction:.7
		}
		];
		super (world, config);
		health = 200;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 100) {
			this.currentImage.bitmapData = Assets.getBitmapData("assets/ModerateWallCracked.png");
		}
		var debrisArray = [
			[.0594,.1817 ]
			,[.0643,.1681 ]
			,[.0611,.2224 ]
			,[.1358,.1426 ]
			,[.0679,.1596 ]
			
		];
		
		if (health <= 0) {
			
			for (num in 1 ... 6) {
				var ent;
				ent = new FPhysicsEntity(cast(world),{
					sprite:new Bitmap(Assets.getBitmapData("assets/ModChardWall" + num + ".png"))
					,type:"dynamic"
					,angle: Math.random()*6.28
					,position:this.getPosition()
					,imageScale:589
					,maxLifeSeconds:.5+ Math.random()*2
					,shapes:[{
						type:'box'
						,width: debrisArray[num-1][0]
						,height: debrisArray[num-1][1]
						,restitution:.9
						,density:.1
						,friction:.1
					}]
				});
				
				
				
			}	
		}
	}
}