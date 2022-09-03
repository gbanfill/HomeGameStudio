using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Media;
using Wizards.Models;

namespace Wizards;

public class LukeGame : Game
{
    private GraphicsDeviceManager _graphics;

    private Song _music;
    public LukeGame()
    {
        _graphics = new GraphicsDeviceManager(this);
        Content.RootDirectory = "Content";
        IsMouseVisible = true;
    }

    Wizard wizard;
    Spike spike;

    protected override void Initialize()
    {
        TouchPanel.EnabledGestures = GestureType.Tap | GestureType.DoubleTap;
        Background background = new Background(this);
        this.Components.Add(background);

        wizard = new Wizard(this);
        this.Components.Add(wizard);

        spike = new Spike(this);
        this.Components.Add(spike);
        base.Initialize();
    }

    protected override void LoadContent()
    {
        
        // TODO: use this.Content to load your game content here
    }

    protected override void Update(GameTime gameTime)
    {
        if(wizard.Touches(spike))
        {
            GameState.IsDead = true;
        }


        base.Update(gameTime);
    }

    protected override void Draw(GameTime gameTime)
    {
        GraphicsDevice.Clear(Color.LightSeaGreen);

        // TODO: Add your drawing code here

        base.Draw(gameTime);
    }
}

