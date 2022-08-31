using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace Wizards.Models
{
    public class Spike : DrawableGameComponent
    {
        public Spike(Game game): base(game)
        {
            _spriteBatch = new SpriteBatch(GraphicsDevice);
        }

        Texture2D texture2D;

        protected SpriteBatch _spriteBatch;

        Vector2 position;

        public override void Initialize()
        {
            base.Initialize();
            texture2D = Texture2D.FromFile(Game.GraphicsDevice, "Content/spike.png");
            position = new Vector2(Game.GraphicsDevice.Viewport.Width, 1200);
        }

        public override void Update(GameTime gameTime)
        {
            base.Update(gameTime);
            position.X -= 4;
            if (position.X < -texture2D.Width)
            {
                position.X = GraphicsDevice.Viewport.Width;
            }
        }


        public override void Draw(GameTime gameTime)
        {
            base.Draw(gameTime);

            _spriteBatch.Begin();
            _spriteBatch.Draw(texture2D,position, Color.White);
            _spriteBatch.End();
        }

    }
}

