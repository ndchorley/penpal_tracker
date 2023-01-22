open Penpal_tracker.Tracker

let () =
  track_penpals "penpal_list"
  |> print_string
