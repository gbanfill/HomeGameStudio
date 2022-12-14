using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input.Touch;

namespace Wizards.Models
{
    public class Wizard : BaseCraftPixModel
    {
        public Wizard(Game game) :base(game)
        {
            DrawOrder = 100; 
        }


        protected override string BaseContentPath => "Wizard/PNG Sequences";

        protected override string ModelName => "Wizard";

        protected override void LoadContent()
        {
            LoadAnimationSequence(AnimationType.IDLE, 0);
            LoadAnimationSequence(AnimationType.WALKING, 4);
            LoadAnimationSequence(AnimationType.JUMP_LOOP, 0);
            LoadAnimationSequence(AnimationType.JUMP, 3, AnimationType.JUMP_LOOP);
            LoadAnimationSequence(AnimationType.DYING, 4, AnimationType.DEAD);
            LoadAnimationSequence(AnimationType.DEAD, 0);

            SetCurrentAnimation(AnimationType.WALKING, new GameTime());
            SetInitalPosition();

            base.LoadContent();
        }

        public void Load()
        {
            LoadContent();
        }

        public override void Update(GameTime gameTime)
        {
            if (GameState.IsDead && CurrentAnimation == AnimationType.WALKING )
            {
                SetCurrentAnimation(AnimationType.DYING, gameTime);
            }
            if(!GameState.IsDead && TouchPanel.IsGestureAvailable)
            {
                var gesture = TouchPanel.ReadGesture();
                if (gesture.GestureType== GestureType.Tap)
                {
                    Console.WriteLine("screen tapped");
                    SetCurrentAnimation(AnimationType.JUMP, gameTime);
                }
            }
            HandleJumping(gameTime);
            base.Update(gameTime);

        }

        public override void Draw(GameTime gameTime)
        {
            DrawCurrentAnimationFrame(Position, gameTime);

            base.Draw(gameTime);
        }

        public void Reset(GameTime gametime)
        {
            SetCurrentAnimation(AnimationType.WALKING, gametime);
        }

        public bool Touches(Spike spike)
        {
            return spike.BoundingBox.Contains(new Vector2(Position.X + (Width/2), Position.Y) );
        }
    }
}
