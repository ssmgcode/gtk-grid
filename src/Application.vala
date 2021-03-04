public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.ssmgcode.gtk-grid",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (new Gtk.Label (_("Label 1")));
        grid.add (new Gtk.Label (_("Label 2")));

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = _("Gtk Grid")
        };

        main_window.add (grid);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
