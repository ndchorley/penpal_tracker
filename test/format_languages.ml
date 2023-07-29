open OUnit2
open Penpal_tracker.Report

let tests =
  "formatting languages" >::: [
    "just produces the language when there's only one" >::
      (fun _ ->
        let languages = ["English"] in

        let formatted = format_languages languages in

          assert_equal "English" formatted ~printer:Fun.id
      )
  ]

let _ = run_test_tt_main tests
