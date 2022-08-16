using System;
using Microsoft.Xna.Framework;

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
            LoadAnimationSequence(AnimationType.IDLE, 4);
            LoadAnimationSequence(AnimationType.WALKING, 4);
            LoadAnimationSequence(AnimationType.JUMP, 4);


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
            if (((int)gameTime.TotalGameTime.TotalSeconds) % 2 == 0)
            {
       //         SetCurrentAnimation(AnimationType.JUMP, gameTime);
            }
            base.Update(gameTime);
        }

        public override void Draw(GameTime gameTime)
        {
            DrawCurrentAnimationFrame(Position, gameTime);

            base.Draw(gameTime);
        }
    }
}
