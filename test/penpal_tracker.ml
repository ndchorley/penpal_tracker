open In_channel
open OUnit2
open Penpal_tracker.Tracker

let contents_of file =
  open_in file |> input_all

let tests =
  "tracking penpals" >::: [
    "produces a report of penpals" >::
      (fun _ ->
        let report =
          track_penpals "penpal_list/produces_a_report_of_penpals"
        in
          assert_equal
            (contents_of "expected/produces_a_report_of_penpals")
            report
            ~printer:Fun.id
      );

    "but omits those who have been sent a letter" >::
      (fun _ ->
        let report =
          track_penpals
            "penpal_list/but_omits_those_who_have_been_sent_a_letter"
        in
          assert_equal
            (contents_of
              "expected/but_omits_those_who_have_been_sent_a_letter")
            report
            ~printer:Fun.id
      );
  ]

let _ = run_test_tt_main tests
