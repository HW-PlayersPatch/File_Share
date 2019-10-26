simple default(Texture $diffuse)
{
    setCap texture0Cap         true

    fillMode solidFill

    textureBind 0 $diffuse
}

compound blackAndWhite()
{
    addPass default
}
