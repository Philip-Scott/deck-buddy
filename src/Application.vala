/*
* Copyright © 2022 Felipe Escoto
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Felipe Escoto
*/

public class DeckBuddy : Gtk.Application {
    private const string GTK_DARK = "gtk_application_prefer_dark_theme";

    public static MainWindow main_window;

    private const uint CONFIGURE_ID_TIMEOUT = 100;

    public DeckBuddy () {}

    public static DeckBuddy _instance = null;
    public static DeckBuddy instance {
        get {
            if (_instance == null) {
                _instance = new DeckBuddy ();
            }
            return _instance;
        }
    }

    static construct {

    }

    protected override void activate () {
        // Set up main window
        main_window = new MainWindow (this);
        main_window.show_all ();
    }

    private static int main (string[] args) {
        Gtk.init (ref args);

        var app = new DeckBuddy ();
        return app.run (args);
    }
}
