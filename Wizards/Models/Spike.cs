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

        public override void Initialize()
        {
            base.Initialize();
            texture2D = Texture2D.FromFile(Game.GraphicsDevice, "Content/spike.png");
        }

        public override void Draw(GameTime gameTime)
        {
            base.Draw(gameTime);

            _spriteBatch.Begin();
            _spriteBatch.Draw(texture2D,new Vector2(750,1200), Color.White);
            _spriteBatch.End();
        }

    }
}

