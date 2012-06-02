package org.wambaugh.sphinx.map;
import firmament.core.FEntity;
import firmament.core.FPhysicsWorld;
import haxe.Timer;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
import firmament.core.FVector;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		
		super (world, config);
		health = 50;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 25) {
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
				var randomY = this.getPositionY() + (Math.random() * .2) - .2;
				var randomX = this.getPositionX() + (Math.random() * .2) - .2;
				ent = new FPhysicsEntity(cast(world),{
					sprite:Assets.getBitmapData("assets/ChardWall" + num + ".png")
					,type:"dynamic"
					,objType: "Shrapnel"
					,angle: Math.random() * 6.28 //getAngle()
					,position: new FVector (randomX, randomY)
					,imageScale:589
					,maxLifeSeconds:.5+ Math.random()*1
					,shapes:[{
						type:'box'
						,width: debrisArray[num-1][0]
						,height: debrisArray[num-1][1]
						,restitution:0
						,density:.01
						,friction:.9
					}]
				});
				
				
				
			}	
		}
	}
}