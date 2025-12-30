open Helpers
open OUnit2
open Penpal_tracker.Tracker

let tests =
  "tracking penpals" >::: [
    "lists multiple penpals ordered as they are in the file" >::
      (fun _ ->
        let report =
          track_penpals "penpal_list/lists_multiple_penpals_ordered_as_they_are_in_the_file"
        in
          assert_equal
            (contents_of "expected/lists_multiple_penpals_ordered_as_they_are_in_the_file")
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
            false
            (contains report "Gerard Blaset")
            ~printer:Bool.to_string
      );

    "and reports if there are no penpals who have not been written to" >::
      (fun _ ->
        let report =
          track_penpals
            "penpal_list/and_reports_if_there_are_no_penpals_who_have_not_been_written_to"
        in
          assert_equal
            "You have written to everyone on the list\n"
            report
            ~printer:Fun.id
      );

    "but complains if the file can't be found" >::
      (fun _ ->
        let file = "some_directory/does_not_exist" in

        let message = track_penpals file in

          assert_equal
            ("Couldn't find penpal list at " ^ file ^ "\n")
            message
            ~printer:Fun.id
      )
  ]

let _ = run_test_tt_main tests
