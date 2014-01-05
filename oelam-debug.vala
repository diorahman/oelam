using Gee;
using GLib;

private class Debug : Command {
  public override  string name {
    get { return "debug";}
  }

  public override string description {
    get { return "Debug";}
  }

  public override string help {
    get { return "Usage: \n oelam debug [PATH] \n\nExamples: \n oelam debug .   Debug current dir"; }
  }

  public Debug (Oelam oe) {
    base (oe);
  }

  public override int run (string[] args) {
    return 0;
  }

}
