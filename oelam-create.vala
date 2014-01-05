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
    // oelam create com.rockybars.App App app
    string app_name;
    string app_path;

    bool valid_namespace;
    bool valid_path;
    bool valid_name;

    if (args.length > 1) {
      valid_namespace = validate_namespace(args[0], out app_name);

      if (!valid_namespace) {
        return 1;
      }

      if (args.length == 3) {
        valid_name = validate_name(args[1], out app_name);

        if (!valid_name) {
          return 1;
        }
      }

      valid_path = validate_path(args[2], out app_path);

      if (!valid_path) {
        return 1;
      }
    } else {
      stderr.printf("interactive mode is not yet implemented\n");
    }

    return 0;
  }

  private bool validate_namespace(string namespace, out string app_name){
    string[] spaces = namespace.split(".");

    if (spaces.length > 2) {
      app_name = string.joinv("", spaces[2:spaces.length]);
    } else {
      stderr.printf("Invalid app namespace\n");
      return false;
    }
    return true;
  }

  private bool validate_name(string name, out string app_name){
    app_name = name;
    return true;
  }

  private bool validate_path(string path, out string app_path){
    File dir = File.new_for_path(path);
    bool dir_exists = dir.query_exists();

    if (dir_exists) {
      stderr.printf("Already exists\n");
      return false;
    }

    // todo mkdirp
    try{
      dir.make_directory();
    } catch(Error e) {
      stderr.printf("Error creating dir");
      return false;
    }

    app_path = dir.get_path();
    return true;

  }
}
