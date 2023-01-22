ParticleEmitter("Drops")
{
	MaxParticles(20.0000,20.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0050, 0.0050);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(5.0);
	SoundName("")
	NoRegisterStep();
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.5000,0.5000);
			PositionY(0.8000,2.0000);
			PositionZ(-0.5000,0.5000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(2.0000,2.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.2000, 0.5000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 64.0000, 96.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.5000);
		Position()
		{
			LifeTime(1.5000)
			Accelerate(0.0000, -12.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(1.5000)
			Scale(4.0000);
		}
		Color(0)
		{
			LifeTime(1.5000)
			Reach(255.0000,255.0000,255.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_dirt2");
	}
	ParticleEmitter("Spray")
	{
		MaxParticles(3.0000,3.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0200, 0.0200);
		BurstCount(1.0000,1.0000);
		MaxLodDist(50.0000);
		MinLodDist(10.0000);
		BoundingRadius(5.0);
		SoundName("")
		NoRegisterStep();
		Size(1.0000, 1.0000);
		Hue(255.0000, 255.0000);
		Saturation(255.0000, 255.0000);
		Value(255.0000, 255.0000);
		Alpha(255.0000, 255.0000);
		Spawner()
		{
			Spread()
			{
				PositionX(-0.7500,0.7500);
				PositionY(1.5000,2.0000);
				PositionZ(-0.7500,0.7500);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(-0.4000,-0.4000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(2.0000,3.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.1500, 0.6500);
			Red(0, 255.0000, 255.0000);
			Green(0, 255.0000, 255.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 255.0000, 255.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(3.0000);
			Position()
			{
				LifeTime(1.0000)
			}
			Size(0)
			{
				LifeTime(1.0000)
			}
			Color(0)
			{
				LifeTime(0.2000)
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("EMITTER");
			Texture("flare0");
			ParticleEmitter("Water")
			{
				MaxParticles(5.0000,5.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0500, 0.0500);
				BurstCount(1.0000,1.0000);
				MaxLodDist(50.0000);
				MinLodDist(10.0000);
				BoundingRadius(5.0);
				SoundName("")
				Size(1.0000, 1.0000);
				Hue(255.0000, 255.0000);
				Saturation(255.0000, 255.0000);
				Value(255.0000, 255.0000);
				Alpha(255.0000, 255.0000);
				Spawner()
				{
					Spread()
					{
						PositionX(-0.1000,0.1000);
						PositionY(-0.1000,0.1000);
						PositionZ(-0.1000,0.1000);
					}
					Offset()
					{
						PositionX(-0.0500,0.0500);
						PositionY(-0.0500,0.0500);
						PositionZ(-0.0500,0.0500);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(1.0000,1.0000);
					InheritVelocityFactor(0.3000,0.3000);
					Size(0, 0.1000, 0.1500);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 64.0000, 64.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -45.0000, 45.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(2.0000);
					Position()
					{
						LifeTime(3.0000)
						Accelerate(0.0000, -10.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(1.5000)
						Scale(12.0000);
						Next()
						{
							LifeTime(1.5000)
							Scale(2.0000);
						}
					}
					Color(0)
					{
						LifeTime(2.0000)
						Reach(255.0000,255.0000,255.0000,0.0000);
					}
				}
				Geometry()
				{
					BlendMode("NORMAL");
					Type("PARTICLE");
					Texture("com_sfx_smoke3");
				}
			}
		}
		ParticleEmitter("Cloud")
		{
			MaxParticles(20.0000,20.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0050, 0.0050);
			BurstCount(1.0000,1.0000);
			MaxLodDist(50.0000);
			MinLodDist(10.0000);
			BoundingRadius(5.0);
			SoundName("")
			NoRegisterStep();
			Size(1.0000, 1.0000);
			Hue(255.0000, 255.0000);
			Saturation(255.0000, 255.0000);
			Value(255.0000, 255.0000);
			Alpha(255.0000, 255.0000);
			Spawner()
			{
				Spread()
				{
					PositionX(-0.0100,0.0100);
					PositionY(1.0000,2.0000);
					PositionZ(-0.0100,0.0100);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(2.0000,2.7500);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.4000, 0.8000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 64.0000, 64.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.0000);
				Position()
				{
					LifeTime(1.2500)
					Accelerate(0.0000, -12.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(1.5000)
					Scale(0.5000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Reach(255.0000,255.0000,255.0000,0.0000);
				}
			}
			Geometry()
			{
				BlendMode("NORMAL");
				Type("PARTICLE");
				Texture("com_sfx_smoke3");
			}
			ParticleEmitter("Ring")
			{
				MaxParticles(4.0000,4.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.1000, 0.3000);
				BurstCount(1.0000,1.0000);
				MaxLodDist(50.0000);
				MinLodDist(10.0000);
				BoundingRadius(5.0);
				SoundName("")
				NoRegisterStep();
				Size(1.0000, 1.0000);
				Hue(255.0000, 255.0000);
				Saturation(255.0000, 255.0000);
				Value(255.0000, 255.0000);
				Alpha(255.0000, 255.0000);
				Spawner()
				{
					Spread()
					{
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					Offset()
					{
						PositionX(-0.1000,0.1000);
						PositionY(0.1000,0.1000);
						PositionZ(-0.1000,0.1000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.2000, 0.4000);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(2.0000);
					Position()
					{
						LifeTime(0.2000)
					}
					Size(0)
					{
						LifeTime(2.0000)
						Scale(3.0000);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Reach(255.0000,255.0000,255.0000,40.0000);
						Next()
						{
							LifeTime(1.4000)
							Reach(255.0000,255.0000,255.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("BILLBOARD");
					Texture("com_sfx_flashring2");
				}
				ParticleEmitter("Ring")
				{
					MaxParticles(7.0000,7.0000);
					StartDelay(0.2500,0.2500);
					BurstDelay(0.1000, 0.3000);
					BurstCount(1.0000,1.0000);
					MaxLodDist(50.0000);
					MinLodDist(10.0000);
					BoundingRadius(5.0);
					SoundName("")
					NoRegisterStep();
					Size(1.0000, 1.0000);
					Hue(255.0000, 255.0000);
					Saturation(255.0000, 255.0000);
					Value(255.0000, 255.0000);
					Alpha(255.0000, 255.0000);
					Spawner()
					{
						Spread()
						{
							PositionX(0.0000,0.0000);
							PositionY(0.0000,0.0000);
							PositionZ(0.0000,0.0000);
						}
						Offset()
						{
							PositionX(-1.0000,1.0000);
							PositionY(0.1000,0.1000);
							PositionZ(-1.0000,1.0000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.1000, 0.2000);
						Red(0, 255.0000, 255.0000);
						Green(0, 255.0000, 255.0000);
						Blue(0, 255.0000, 255.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, 0.0000, 0.0000);
						RotationVelocity(0, 0.0000, 0.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(2.0000);
						Position()
						{
							LifeTime(0.2000)
						}
						Size(0)
						{
							LifeTime(2.0000)
							Scale(9.0000);
						}
						Color(0)
						{
							LifeTime(0.1000)
							Reach(255.0000,255.0000,255.0000,40.0000);
							Next()
							{
								LifeTime(1.4000)
								Reach(255.0000,255.0000,255.0000,0.0000);
							}
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("BILLBOARD");
						Texture("com_sfx_flashring1");
					}
				}
			}
		}
	}
}
