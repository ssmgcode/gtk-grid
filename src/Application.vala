public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.ssmgcode.gtk-grid",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        //  Grid orientation is horizontal by default
        /*  grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;  */
        /*  grid.add (new Gtk.Label (_("Label 1")));
        grid.add (new Gtk.Label (_("Label 2")));  */

        /*  var button = new Gtk.Button.with_label (_("Click me!")) {
            margin = 12
        };
        var label = new Gtk.Label (null) {
            margin = 12
        };

        grid.add (button);
        grid.add (label);  */

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = _("Gtk Grid")
        };

        var hello_button = new Gtk.Button.with_label (_("Say Hello"));
        var hello_label = new Gtk.Label (null);

        var rotate_button = new Gtk.Button.with_label (_("Rotate"));
        var rotate_label = new Gtk.Label (_("Horizontal"));

        var grid = new Gtk.Grid ();
        grid.column_spacing = 6;
        grid.row_spacing = 6;

        //  Add first row of widgets
        /*  Notice that the attach method takes 5 arguments
            1. The widget that you want to attach to the grid
            2. The column number to attach to starting at 0
            3. The row number to attach to starting at 0
            4. The number of columns the widget should span
            5. The number of rows the widget should span
        */
        grid.attach (hello_button, 0, 0, 1, 1);
        /*  You can also use attach_next_to to place widget next to another one on all four sides  */
        grid.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);

        //  Add second row of widgets
        grid.attach (rotate_button, 0, 1);
        grid.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

        main_window.add (grid);

        //  We add this portion of code below main_window.add (grid) to separate the code that defines the UI and the next portion that defines the functions that we associated with the UI
        /*  button.clicked.connect (() => {
            label.label = _("Hello World!");
            button.sensitive = false;
        });  */
        hello_button.clicked.connect (() => {
            hello_label.label = _("Hello World!");
            hello_button.sensitive = false;
        });

        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = _("Vertical");
            rotate_button.sensitive = false;
        });
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
