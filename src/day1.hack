function day1_part_one(string $file_name): int {
  $numbers = read_file_ints($file_name);
  $numbers_set = Set {};
  $result = -1;

  foreach ($numbers as $number) {
    if ($numbers_set->contains(2020 - $number)) {
      $result = $number * (2020 - $number);
      break;
    } else {
      $numbers_set->add($number);
    }    
  }

  return $result;
}

function day1_part_two(string $file_name): int {
  $numbers = read_file_ints($file_name);
  $numbers_set = new Set($numbers);
  $result = -1;

  foreach($numbers as $k1 => $v1) {
    foreach($numbers as $k2 => $v2) {
      if ($numbers_set->contains(2020 - $v1 - $v2)) {
        $result = $v1 * $v2 * (2020 - $v1 - $v2);
        break;
      }
    }
  }

  return $result;
}