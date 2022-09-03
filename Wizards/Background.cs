using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace Wizards
{
    public class Background : DrawableGameComponent
    {
        public Background(Game game): base (game)
        {
            DrawOrder = 0;
        }

        Texture2D background;
        private SpriteBatch _spriteBatch;

        Rectangle sourceRectangle1;
        Rectangle sourceRectangle2;
        Rectangle destinationRectangle1;
        Rectangle destinationRectangle2;

        int imageWidthVisibleOnScreen;

        protected override void LoadContent()
        {
            _spriteBatch = new SpriteBatch(GraphicsDevice);

            background = Texture2D.FromFile(Game.GraphicsDevice, "Content/Cartoon_Forest_BG_04.png");
            imageWidthVisibleOnScreen = (int)((background.Width / (float)Game.GraphicsDevice.Viewport.Width) * Game.GraphicsDevice.Viewport.Height);
            sourceRectangle1 = new Rectangle(0, 0, imageWidthVisibleOnScreen, 1080);
            destinationRectangle1 = new Rectangle(0, 0, Game.GraphicsDevice.Viewport.Width, Game.GraphicsDevice.Viewport.Height);
            sourceRectangle2 = new Rectangle(0, 0, imageWidthVisibleOnScreen, 1080);
            destinationRectangle2 = new Rectangle(0, 0, Game.GraphicsDevice.Viewport.Width, Game.GraphicsDevice.Viewport.Height);

            base.LoadContent();
        }

        public const int BACKGROUND_SPEED = 2;

        public override void Update(GameTime gameTime)
        {
            if (!GameState.IsDead)
            {
                sourceRectangle1.X += BACKGROUND_SPEED;

                // if image isnt big enough to fill the screen change the width of the destination rectangle
                if (sourceRectangle1.X + sourceRectangle1.Width > background.Width)
                {
                    sourceRectangle1.Width -= BACKGROUND_SPEED;
                    destinationRectangle1.Width = (int)(sourceRectangle1.Width * GraphicsDevice.Viewport.Width / (float)imageWidthVisibleOnScreen);

                    sourceRectangle2.Width = imageWidthVisibleOnScreen - sourceRectangle1.Width;
                    destinationRectangle2.X = destinationRectangle1.Width;
                    destinationRectangle2.Width = GraphicsDevice.Viewport.Width - destinationRectangle1.Width;
                }

                // reset the source rectangle back to 0
                if (sourceRectangle1.X > background.Width)
                {
                    sourceRectangle1.X = 0;
                    sourceRectangle1.Width = imageWidthVisibleOnScreen;
                    destinationRectangle1.Width = Game.GraphicsDevice.Viewport.Width;

                    sourceRectangle2.X = 0;
                    sourceRectangle2.Width = imageWidthVisibleOnScreen;
                    destinationRectangle2.Width = Game.GraphicsDevice.Viewport.Width;
                    destinationRectangle2.X = 0;

                }
            }
            base.Update(gameTime);
        }

        public override void Draw(GameTime gameTime)
        {
            Game.GraphicsDevice.Clear(Color.LightSeaGreen);

            _spriteBatch.Begin();
            _spriteBatch.Draw(background, destinationRectangle1, sourceRectangle1, Color.White);

            if (sourceRectangle1.Width < imageWidthVisibleOnScreen)
            {
                _spriteBatch.Draw(background, destinationRectangle2, sourceRectangle2, Color.White);

            }
            _spriteBatch.End();

            base.Draw(gameTime);
        }
    }
}
