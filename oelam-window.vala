using Gtk;

public class AppWindow : Window {
  ScrolledWindow scrolledWindow = null;

  public AppWindow () {
    scrolledWindow = new ScrolledWindow (null, null);
    destroy.connect (() => {
      Gtk.main_quit ();
    });
  }
}
