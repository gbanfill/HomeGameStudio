//using System;
//using System.Collections.Generic;
//using Microsoft.Xna.Framework;
//using Microsoft.Xna.Framework.Graphics;
//using Microsoft.Xna.Framework.Input;
//using Microsoft.Xna.Framework.Input.Touch;

//namespace Wizards.Models
//{
//    public class Minator : BaseCraftPixModel
//    {
        
     
//        protected override string BaseContentPath => "Minotaur_01/PNG Sequences";
//        protected override string ModelName => "Minotaur_01";

//        public Minator(Game game):base(game)
//        {
//            DrawOrder = 100; 
//        }

//        protected override void LoadContent()
//        {
//            SetCurrentAnimation(AnimationType.WALKING, new GameTime());
//            LoadAnimationSequence(AnimationType.IDLE, 11);
//            LoadAnimationSequence(AnimationType.IDLE_BLINK, 11);
//            LoadAnimationSequence(AnimationType.WALKING, 17);
//            LoadAnimationSequence(AnimationType.JUMP_LOOP, 5);
//            LoadAnimationSequence(AnimationType.JUMP_START, 5, AnimationType.JUMP_LOOP);

//            SetInitalPosition();

//            base.LoadContent();
//        }

//        public override void Update(GameTime gameTime)
//        {
//            if (TouchPanel.IsGestureAvailable)
//            {
//                var gesture = TouchPanel.ReadGesture();
//                switch (gesture.GestureType)
//                {
//                    case GestureType.Tap:                
//                        //switch //(CurrentAnimation )
//                        //{
//     //                       cas//e AnimationType.IDLE:
//                               // SetCurrentAnimation(AnimationType.WALKING, gameTime);
//                               // break;
//                          //  cas//e AnimationType.WALKING:
//                               // SetCurrentAnimation(AnimationType.IDLE, gameTime);
//                               // break;
//                        //}
//                        break;
//                    case GestureType.DoubleTap:
//                        SetCurrentAnimation(AnimationType.JUMP_START, gameTime);
//                        break;
//                }
//            }

//            HandleJumping(gameTime);

//            base.Update(gameTime);
//        }

//        public override void Draw(GameTime gameTime)
//        {
//            DrawCurrentAnimationFrame(Position, gameTime);

//            base.Draw(gameTime);
//        }
//    }
//}
