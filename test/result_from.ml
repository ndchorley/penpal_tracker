open OUnit2
open Penpal_tracker.Result_from

let tests =
  "result_from" >::: [
    "turns a successful computation into an Ok" >::
      (fun _ ->
        assert_equal
          (Ok (2))
          (result_from (fun () -> 1 + 1))
      );

    "turns an exception into an Error" >::
      (fun _ ->
        assert_equal
          (Error (Division_by_zero))
          (result_from (fun () -> 1 / 0))
      )
  ]

let _ = run_test_tt_main tests
