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

        public Vector2 position;

        public Rectangle BoundingBox =>
            new Rectangle((int)position.X, (int)position.Y- texture2D.Height, texture2D.Width, texture2D.Height);


        public override void Initialize()
        {
            base.Initialize();
            texture2D = Texture2D.FromFile(Game.GraphicsDevice, "Content/spike.png");
            position = new Vector2(Game.GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height - texture2D.Height - 100);
        }

        public override void Update(GameTime gameTime)
        {
            base.Update(gameTime);
            if (!GameState.IsDead)
            {
                position.X -= 4;
                if (position.X < -texture2D.Width)
                {
                    Reset();
                }
            }
        }

        public void Reset()
        {
            position.X = GraphicsDevice.Viewport.Width;
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

