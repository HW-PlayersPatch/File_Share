SensorDistortion
{
	// first pass
	{
		map ui/shaders/dist1.tga
//		map ui/shaders/slime7.tga
		blendFunc add
//		tcMod turb 0 0.3 0 0.3
//		tcMod rotate 10
		tcMod scroll 0.1 0.1
		cull back
	}

	// second pass
	{
		map ui/shaders/dist1.tga
		blendFunc add
		tcMod scroll -0.1 -0.1
        tcMod scale 2.0 2.0
		cull back
	}

//	{
//		map etg/textures/dist1.tga
//		blendFunc add
//		tcMod turb 0 0.1 0 0.1
//		tcMod rotate 45
//	}


//		{
//			map ui/shaders/slime7c.tga
//			tcMod turb .3 .2 1 .05
//			tcMod scroll .01 .01
//		}
	
//		{
//			map ui/shaders/slime7.tga
//			blendfunc one one
//			tcMod turb .2 .1 1 .05
//			tcMod scale .5 .5
//			tcMod scroll .01 .01
//		}


}



