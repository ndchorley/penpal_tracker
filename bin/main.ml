open Penpal_tracker.Tracker

let contains array wanted =
  Array.exists (String.equal wanted) array

let () =
  if (contains Sys.argv "--version") then
    print_endline "penpal_tracker: some-commit-hash-here"
  else
    track_penpals "penpal_list"
    |> print_string
