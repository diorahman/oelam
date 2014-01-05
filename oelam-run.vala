using Gee;
using GLib;
using Gtk;

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

  public override int run(string[] args){
    string path = ".";

    if (args.length > 0) {
      path = args[0];
    }

    File file = File.new_for_path(path);
    string fullpath = file.get_path();
    bool exists = file.query_exists();

    if (exists) {
      FileType type = file.query_file_type(FileQueryInfoFlags.NOFOLLOW_SYMLINKS);
      if (type == FileType.DIRECTORY) {
        bool valid_path = validate_path(fullpath);

        if (valid_path) {
          return show(fullpath, args);
        } else {
          stderr.printf("Not a valid oelam app\n");
          return 1;
        }

      } else {
        stderr.printf("Wrong type\n");
        return 1;
      }
    } else {
      stderr.printf("Not exist\n");
      return 1;
    }
  }

  private bool validate_path(string path) {
    string config = path + "/config.xml";
    File file_config = File.new_for_path(config);
    bool file_config_exists = file_config.query_exists();

    if (!file_config_exists) {
      return false;
    }

    return true;
  }

  private int show(string path, string[] args) {
    Gtk.init(ref args);
    var c = new ConfigXML(path);
    var w = new AppWindow(c);
    if (c.width != -1) {
      w.default_width = c.width;
    }

    if (c.height != -1) {
      w.default_height = c.height;
    }

    if (c.title != null) {
      w.title = c.title.strip();
    }

    w.show_all();
    Gtk.main();
    return 0;
  }
}
