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

public class MainWindow : Gtk.Window {
    private Gtk.ScrolledWindow scrollbox;
    private Gtk.Grid script_list;

    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            icon_name: "com.github.philip_scott.deck_buddy",
            resizable: false,
            title: _("Deck-Buddy")
        );
    }

    construct {
        scrollbox = new Gtk.ScrolledWindow (null, null) {
            hscrollbar_policy = Gtk.PolicyType.NEVER
        };

        script_list = new Gtk.Grid () {
            hexpand = true
        };

        scrollbox.add (script_list);
        add (scrollbox);

        create_script_card ("Remote Desktop ", "https://raw.githubusercontent.com/Philip-Scott/deck-buddy/master/guides/remote-desktop/setup.sh");        

        show_all ();
    }

    private void create_script_card (string title, string script_url) {
        script_list.add (new ScriptCard (title, script_url));
    }
}
