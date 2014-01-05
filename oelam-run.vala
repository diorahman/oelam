using Gee;
using GLib;

private class Run : Command {
  public override string name {
    get { return "run"; }
  }

  public override string description {
    get { return "run description"; }
  }

  public override string help {
    get { return "help run"; }
  }

  public Run (Oelam oe) {
    base(oe);
  }

  public override void run(string[] args){
    stdout.printf("run\n");
    string path = ".";
    if (args.length > 0) {
      path = args[0];
    }

    File file = File.new_for_path(path);
    bool exists = file.query_exists();
    if (exists) {
      FileType type = file.query_file_type(FileQueryInfoFlags.NOFOLLOW_SYMLINKS);
      if (type == FileType.DIRECTORY) {
        string fullpath = file.get_path();
        stdout.printf("%s\n", fullpath);
      } else {
        stderr.printf("wrong type\n");
      }
    }
  }
}
