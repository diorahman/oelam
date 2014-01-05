using Gee;
using GLib;

private class Create : Command {
  public override string name {
    get { return "create"; }
  }

  public override string description {
    get { return "create description"; }
  }

  public override string help {
    get { return "help create"; }
  }

  public Create (Oelam oe) {
    base(oe);
  }

  public override int run(string[] args){
    stdout.printf("`create` is not yet implemented\n");
    return 0;
  }
}
