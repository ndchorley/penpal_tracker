let result_from block =
  try Ok (block ()) with
    e -> Error (e)
