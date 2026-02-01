open OUnit2
open Penpal_tracker.Parsing

let test =
  "languages are separated by commas, regardless of whitespace" >::
    (fun _ ->
      let languages = "French,English, Spanish,      Italian" in

      let parsed = parse_languages languages in

        assert_equal
          ["French"; "English"; "Spanish"; "Italian"]
          parsed
      )

let _ = run_test_tt_main test
