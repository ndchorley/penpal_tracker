open OUnit2
open Penpal_tracker.Report

let tests =
  "formatting languages" >::: [
    "just produces the language when there's only one" >::
      (fun _ ->
        let languages = ["English"] in

        let formatted = format_languages languages in

          assert_equal
            "English"
            formatted
            ~printer:Fun.id
      );

      "and separates two languages with the word 'and'" >::
        (fun _ ->
          let languages = ["French"; "English"] in

          let formatted = format_languages languages in

            assert_equal
              "French and English"
              formatted
              ~printer:Fun.id
        );

      ("but separates more than two languages with a comma " ^
       "and the final two with the word 'and'") >::
        (fun _ ->
          let languages =
            ["English"; "German"; "French"; "Spanish"]
          in

          let formatted = format_languages languages in

            assert_equal
              "English, German, French and Spanish"
              formatted
              ~printer:Fun.id
        )
  ]

let _ = run_test_tt_main tests
