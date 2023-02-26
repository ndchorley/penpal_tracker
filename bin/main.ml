open Array_utils
open Penpal_tracker.Tracker
open Version

let () =
  if (contains Sys.argv "--version") then
    display_version_info
  else
    track_penpals "penpal_list"
    |> print_string
