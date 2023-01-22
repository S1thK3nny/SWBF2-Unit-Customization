
Light("bouncing", 875918702)
{
	Rotation(-0.479907, 0.565090, -0.659547, -0.123937);
	Position(287.073669, 217.120377, 107.690414);
	Type(1);
	Color(0.090196, 0.078431, 0.337255);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("sun", 2147336192)
{
	Rotation(0.672421, 0.538740, 0.083629, -0.500614);
	Position(221.984207, 245.033936, -195.686493);
	Type(1);
	Color(0.094118, 0.109804, 0.345098);
	CastShadow();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(20);
	Light1("Sun");
	Light2("");
	Top(66, 97, 179);
	Bottom(38, 40, 121);
}
