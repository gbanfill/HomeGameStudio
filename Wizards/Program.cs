using System;
using Foundation;
using UIKit;

namespace Wizards
{
    [Register("AppDelegate")]
    class Program : UIApplicationDelegate
    {
        private static LukeGame game;

        internal static void RunGame()
        {
            game = new LukeGame();
            game.Run();
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main(string[] args)
        {
            UIApplication.Main(args, null, typeof(Program));
        }

        public override void FinishedLaunching(UIApplication app)
        {
            RunGame();
        }
    }
}

