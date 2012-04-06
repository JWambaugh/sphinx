package org.wambaugh.sphinx.entities;
import firmament.core.FPhysicsWorld;
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
		health = 100;
	}
	override public function takeDamage() {
		if (this.health <= 0) {
			for ( count in 1 ... 8) {
				var ent = new FPhysicsEntity(cast(world),{
					sprite: Assets.getBitmapData("assets/AlienBlood.png")
					,type:"dynamic"
					,position:this.getPosition() 
					,imageScale:712
					,maxLifeSeconds:.5+ Math.random()*2
					,shapes:[ {
							type:'circle'
							,radius:.03
							,restitution:.1
							,density:.1
							,friction:.1
						}]
					});
				}
			}
		}
	}
