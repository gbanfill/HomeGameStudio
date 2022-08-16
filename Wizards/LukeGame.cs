using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Wizards.Models;

namespace Wizards;

public class LukeGame : Game
{
    private GraphicsDeviceManager _graphics;
    

    public LukeGame()
    {
        _graphics = new GraphicsDeviceManager(this);
        Content.RootDirectory = "Content";
        IsMouseVisible = true;
    }

    protected override void Initialize()
    {
        Background background = new Background(this);
        this.Components.Add(background);

        Wizard wizard = new Wizard(this);
        this.Components.Add(wizard);

        base.Initialize();
    }

    protected override void LoadContent()
    {
        

        // TODO: use this.Content to load your game content here
    }

    protected override void Update(GameTime gameTime)
    {
        // TODO: Add your update logic here


        base.Update(gameTime);
    }

    protected override void Draw(GameTime gameTime)
    {
        GraphicsDevice.Clear(Color.LightSeaGreen);

        // TODO: Add your drawing code here

        base.Draw(gameTime);
    }
}

