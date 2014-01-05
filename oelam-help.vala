using Gee;
using GLib;

private class Help : Command {
  public override string name {
    get { return "help"; }
  }

  public override string description {
    get { return "help description"; }
  }

  public override string help {
    get { return "help help"; }
  }

  public Help (Oelam oe) {
    base(oe);
  }

  public override void run(string[] args){
    stdout.printf("help\n");
  }
}
