open In_channel
open OUnit2
open Penpal_tracker.Tracker

let contents_of file =
  open_in file |> input_all

let tests =
  "tracking penpals" >::: [
    "produces a report of penpals" >::
      (fun _ ->
        let report = track_penpals "penpal_list" in

          assert_equal
            (contents_of "expected")
            report
            ~printer:Fun.id
      )
  ]

let _ = run_test_tt_main tests
