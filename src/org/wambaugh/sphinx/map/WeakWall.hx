package org.wambaugh.sphinx.map;
import firmament.core.FEntity;
import firmament.core.FPhysicsWorld;
import haxe.Timer;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite =Assets.getBitmapData("assets/weakWall.png");
		config.type = "dynamic";
		config.imageScale = 589;
		config.shapes = [
		{
			type:'box'
			,width:.151
			,height:.7
			,restitution:.1
			,density:.5
			,friction:.7
		}
		];
		
		super (world, config);
		health = 100;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 50) {
			this.currentImage = Assets.getBitmapData("assets/weakWallCracked.png");
		}
		var debrisArray = [
			[.0407,.5467 ]
			,[.090,.2207 ]
			//,[.0662,.3548 ]
			,[.0577,.3175 ]
			//,[.1019,.3396 ]
			,[.1019,.2292 ]
			,[.0679,.1969 ]
		];
		
		if (health <= 0) {
			
			for (num in 1 ... 6) {
				var ent;
				ent = new FPhysicsEntity(cast(world),{
					sprite:Assets.getBitmapData("assets/ChardWall" + num + ".png")
					,type:"dynamic"
					,angle: getAngle()
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