open Penpal_tracker.Tracker
open Version

let contains array wanted =
  Array.exists (String.equal wanted) array

let () =
  if (contains Sys.argv "--version") then
    display_version_info
  else
    track_penpals "penpal_list"
    |> print_string
