using Gee;
using GLib;

private class Help : Command {
  public override  string name {
    get { return "help";}
  }

  public override string description {
    get { return "Display help";}
  }

  public override string help {
    get { return "Usage: \n oelam help [COMMAND] \n\nExamples: \n oelam help run    display help for `run` command"; }
  }

  public Help (Oelam oe) {
    base (oe);
  }

  public override int run (string[] args) {
    if (args.length == 0) {
      Utils.print_line ("Usage: \n oelam [COMMAND] [PARAM...] \n\nAvailable commands:\n");
      MapIterator<string, Command> iter = this.oe.commands.map_iterator ();
      Utils.indent ();
      while (iter.next () == true) {
        Utils.print_line ("%-20s  %s", iter.get_key(), iter.get_value().description);
      }
      Utils.unindent ();
    }
    else {
      Command cmd = this.oe.commands.get (args[0]);
      if (cmd == null) {
        Utils.print_line ("Unrecognised command '%s'.", args[0]);
      }
      else {
        Utils.print_line ("%s", cmd.help);
      }
    }

    return 0;
  }

}
