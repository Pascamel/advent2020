namespace day1;

function read_file(string $file_name): vec<int> {
  $handle = \fopen($file_name, "r");
  $result = vec[];

  if ($handle) {
    $line = \fgets($handle);
    while ($line !== false) {
      $result[] = \intval($line);
      $line = \fgets($handle);
    }
  }
  
  return $result;
}

function part_one(string $file_name): int {
  $numbers = read_file($file_name);
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

function part_two(string $file_name): int {
  $numbers = read_file($file_name);
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