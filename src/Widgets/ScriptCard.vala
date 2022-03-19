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

public class ScriptCard : Gtk.Grid {
    public string title {
        get; construct;
    }

    public string script_url {
        get; construct;
    }

    public ScriptCard (string title, string script_url) {
        Object (
            title: title,
            script_url: script_url
        );
    }

    construct {
        var title_label = new Gtk.Label (title);
        var action_button = new Gtk.Button.with_label ("Run Script");
        
        add (title_label);
        add (action_button);

        action_button.clicked.connect (() => {
            GLib.Process.spawn_command_line_async (@"konsole -e \"bash -c 'curl $script_url | bash; read'\"");
        });

        show_all ();
    }
}