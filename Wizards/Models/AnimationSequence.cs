using System;
using System.Collections.Generic;
using Microsoft.Xna.Framework.Graphics;

namespace Wizards.Models
{
    public class AnimationSequence
    {
        public AnimationSequence()
        {
            Loop = true;
        }

        public string AnimationType { get; set; }

        public List<Texture2D> AnimationTextures { get; set; }

        public bool Loop { get; set; }

        public string NextAnimation { get; set; }
    }
}
