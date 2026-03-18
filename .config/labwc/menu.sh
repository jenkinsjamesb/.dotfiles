#!/bin/sh

echo "<openbox_pipe_menu>"

labwc-menu-generator --bare

echo "  <separator />"
echo "  <item label=\"Reconfigure\"><action name=\"Reconfigure\"/></item>"
echo "  <item label=\"Exit\"><action name=\"Exit\"/></item>"

echo "</openbox_pipe_menu>"
