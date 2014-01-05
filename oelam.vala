using GLib;
using Gee;

public class Oelam : Object{
  
  public HashMap<string, Command> commands;

  public static int main(string[] args){
    var oe = new Oelam();
    oe.run(args);
    return 0;
  }

  public Oelam(){
    this.commands = new HashMap<string, Command>(str_hash, str_equal);
    this.commands.set("help", new Help(this));
    this.commands.set("create", new Create(this));
    this.commands.set("run", new Run(this));
  }

  public void run(string[] args){
    var command_line = "";
    string[] arguments = {};
    if (args.length == 1) {
      command_line = "run";
    } else {
      command_line = args[1];
      if (args.length > 1) {
        arguments = args[2:args.length];
      }
    }

    var command = parse_command_line(command_line);
    if (command != null) {
      command.run(arguments);
    } else {
      arguments = args[1:args.length];
      command = parse_command_line("run");
      int ret = command.run(arguments);
      if (ret > 0) {
        stderr.printf("Or `%s` is unknown command\n", args[1]);
      }

    }
  }

  public Command? parse_command_line(string line){
    return this.commands.get(line);
  }
}

public abstract class Command {
  protected Oelam oe;

  public Command(Oelam oe){
    this.oe = oe;
  }

  public abstract string name { get; }
  public abstract string description { get; }
  public abstract string help { get; }
  public abstract int run(string[] args);
}
