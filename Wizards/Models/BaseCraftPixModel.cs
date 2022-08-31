using System;
using System.Collections.Generic;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace Wizards.Models
{
    public abstract class BaseCraftPixModel : DrawableGameComponent
    {
        public BaseCraftPixModel(Game game) : base(game)
        {
            Animations = new Dictionary<string, AnimationSequence>();
            _spriteBatch = new SpriteBatch(GraphicsDevice);
            Position = new Vector2(0, 0);
        }

        protected abstract string BaseContentPath { get; }
        protected abstract string ModelName { get; }

        protected SpriteBatch _spriteBatch;

        public int Width { get; private set; }
        public int Height { get; private set; }
        private bool dimensionsSet = false;

        public Vector2 Position;
        protected float initalY = 0;

        protected void LoadAnimationSequence(string animationType, int number, string nextAnimationType = null)
        {
            AnimationSequence result = new AnimationSequence()
            {
                AnimationType = animationType,
                AnimationTextures = new List<Texture2D>()
            };

            if (!string.IsNullOrEmpty(nextAnimationType))
            {
                result.Loop = false;
                result.NextAnimation = nextAnimationType;
            }

            for (int i = 0; i <= number; i++)
            {
                string contentPath = $"{BaseContentPath}/{animationType}/{ModelName}_{animationType}_{i:0##}";
                result.AnimationTextures.Add(Texture2D.FromFile(Game.GraphicsDevice, "Content/" + contentPath + ".png"));
                //result.AnimationTextures.Add(Game.Content.Load<Texture2D>(contentPath));
            }
            Animations.Add(animationType, result);
            if (!dimensionsSet)
            {
                Width = Animations[animationType].AnimationTextures[0].Width;
                Height = Animations[animationType].AnimationTextures[0].Height;
                dimensionsSet = true;
            }
        }

        protected void SetInitalPosition()
        {
            Position.X = 0 ;
            Position.Y = GraphicsDevice.Viewport.Height - Height-100;
            initalY = Position.Y;
        }

        Dictionary<string, AnimationSequence> Animations { get; set; }

        private string _currentAnimation;
        public string CurrentAnimation
        {
            get { return _currentAnimation; }
            private set {
                _currentAnimation = value;
                currentFrame = 0;
            }
        }

        public void SetCurrentAnimation(string animationType, GameTime gameTime)
        {
            CurrentAnimation = animationType;
            currentAnimationStartAt = gameTime.TotalGameTime;
            if (animationType == AnimationType.JUMP)
            {
                jumpStartTime = gameTime.TotalGameTime;
            }
        }

        double milisecondsSinceLastChange = 0;
        protected TimeSpan currentAnimationStartAt = TimeSpan.Zero;
        int currentFrame = 0;

        protected void DrawCurrentAnimationFrame(Vector2 position, GameTime gameTime)
        {
            milisecondsSinceLastChange += gameTime.ElapsedGameTime.Milliseconds;
            if (milisecondsSinceLastChange > 100)
            {
                currentFrame++;
                milisecondsSinceLastChange = 0;
                currentAnimationStartAt = gameTime.TotalGameTime;
                if (currentFrame >= Animations[CurrentAnimation].AnimationTextures.Count)
                {
                    currentFrame = 0;
                    if (!Animations[CurrentAnimation].Loop && !string.IsNullOrEmpty(Animations[CurrentAnimation].NextAnimation))
                    {
                        CurrentAnimation = Animations[CurrentAnimation].NextAnimation;
                    }
                }
            }

            int frame = ((int)gameTime.TotalGameTime.TotalMilliseconds / 100) % Animations[CurrentAnimation].AnimationTextures.Count; 
            _spriteBatch.Begin();
            _spriteBatch.Draw(Animations[CurrentAnimation].AnimationTextures[currentFrame], position, Color.White);
            _spriteBatch.End();

            
        }

        TimeSpan jumpStartTime = TimeSpan.Zero;

        public void HandleJumping(GameTime gameTime)
        {
            if (CurrentAnimation == AnimationType.JUMP || CurrentAnimation == AnimationType.JUMP_LOOP)
            {
                if (gameTime.TotalGameTime - jumpStartTime < TimeSpan.FromSeconds(0.5))
                {
                    var newPositionY = Position.Y - 15;
                    Position.Y = Math.Clamp(newPositionY, 0, initalY);
                }
                else //if (gameTime.TotalGameTime - jumpStartTime < TimeSpan.FromSeconds(1))
                {
                    Position.Y += 15;
                }
                
            }

            if (Position.Y > initalY)
            {
                SetCurrentAnimation(AnimationType.WALKING, gameTime);
                SetInitalPosition();
            }
        }
    }
}
