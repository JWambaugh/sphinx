package org.wambaugh.sphinx.entities;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class Grunt extends BadGuy
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite = Assets.getBitmapData("assets/alien.png");
		config.type = "dynamic";
		config.imageScale = 712;
		config.shapes = [
			{ 
				type: 'box'
				,width:.3441
				,height:.5
				,restitution:.1
				,density:.5
				,friction:.7
				}
				];
		super(world, config);
		health = 15;
	}
	override public function takeDamage() {
		if (dead) return;
		if (this.health <= 0) {
			
			for ( count in 1 ... 10) {
				var randomY = this.getPositionY() + (Math.random() * .4) - .2;
				var randomX = this.getPositionX() + (Math.random() * .4) - .2;
				var ent = new FPhysicsEntity(cast(world),{
					sprite: Assets.getBitmapData("assets/AlienBlood.png")
					,type:"dynamic"
					,position: new FVector (randomX,randomY)
					,imageScale:712
					,maxLifeSeconds:.25+ Math.random()*.5
					,shapes:[ {
							type:'box'
							,height:.0478
							,width:.0478
							,restitution:.1
							,density:.1
							,friction:.9
						}]
					,collisionCategory:32 
					,collidesWith:1|2|8
					});
				}
			}
		}
	}
